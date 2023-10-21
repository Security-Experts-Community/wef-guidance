<#
	.SYNOPSIS
	Name: Remove-StaleWECSubscribers.ps1
	Removes registry records of inactive WEC event sources no longer allowed to connect to WEC subscriptions.
	.DESCRIPTION
	Searches all currently enabled SourceInitiated subscriptions binded to domain objects for inactive
	event sources, that are no longer allowed to connect to those subscriptions and removes their
	records from registry.
	.EXAMPLE
	Remove stale event sources from registry.
	Remove-StaleWECSubscribers.ps1
	.EXAMPLE
	Remove stale event sources from registry and write log to specified location.
	Remove-StaleWECSubscribers.ps1 -LogPath S:\Script\Logs
	.EXAMPLE
	Remove stale event sources from registry, write log to specified location and redefine number of logs to rotate.
	Remove-StaleWECSubscribers.ps1 -LogPath S:\Script\Logs -LogRotation 10
	.EXAMPLE
	Remove stale event sources from registry, using Cmdlets from 'ActiveDirectory' module.
	Remove-StaleWECSubscribers.ps1 -UseADModule
	.PARAMETER LogPath
	Path to directory, where script logs will be written.
	Defaults to $PSScriptRoot.
	.PARAMETER LogRotation
	Number of log files to rotate. Defaults to 5.
	.PARAMETER UseADModule
	Indicates if 'ActiveDirectory' module Cmdlets should be used instead of .NET 'Active Directory Searcher Object'.
	If set to $true, but 'ActiveDirectory' module is not installed, .NET 'Active Directory Searcher Object' is used.
#>

[CmdletBinding()]
Param(
	[Parameter(Mandatory=$false,
	           Position=0,
	           HelpMessage="Path to directory, where script logs will be written.")]
    [ValidateScript({ Test-Path -Path $PSItem })]
	[string]
	$LogPath = "$PSScriptRoot",

	[Parameter(Mandatory=$false,
	           Position=1,
	           HelpMessage="Number of log files to rotate.")]
	[int]
	$LogRotation = 5,

	[Parameter(Mandatory=$false,
	           HelpMessage="Indicates if 'ActiveDirectory' module Cmdlets should be used instead of .NET 'Active Directory Searcher Object'.")]
	[switch]
	$UseADModule = $false
)

function Transtale-NTName {
Param ([string]$NTName)
	#Name Translator Initialization Types
	$ADS_NAME_INITTYPE_DOMAIN	= 1
	$ADS_NAME_INITTYPE_SERVER	= 2
	$ADS_NAME_INITTYPE_GC		= 3

	#Name Transator Name Types
	$DISTINGUISHEDNAME			= 1
	$CANONICALNAME				= 2
	$NT4NAME					= 3
	$DISPLAYNAME				= 4
	$DOMAINSIMPLE				= 5
	$ENTERPRISESIMPLE			= 6
	$GUID						= 7
	$UNKNOWN					= 8
	$USERPRINCIPALNAME			= 9
	$CANONICALEX				= 10
	$SERVICEPRINCIPALNAME		= 11
	$SIDORSIDHISTORY			= 12

	$ns = New-Object -ComObject NameTranslate
	[System.__ComObject].InvokeMember("Init", "InvokeMethod", $null, $ns, ($ADS_NAME_INITTYPE_GC, $null))
	[System.__ComObject].InvokeMember("Set", "InvokeMethod", $null, $ns, ($UNKNOWN, $NTName))
	return [System.__ComObject].InvokeMember("Get", "InvokeMethod", $null, $ns, $DISTINGUISHEDNAME)
}

function Rotate-Logs {
Param ([string]$Path, [string]$Name, [int]$Rotation)
	$LogFile = "$Path\$Name.log"
	if (Test-Path -Path $LogFile) {
		$LogDate = (Get-ChildItem -Path $LogFile | Select-Object -Expand LastWriteTime).ToFileTimeUtc()
		Move-Item $LogFile "$LogFile.$LogDate.bak" -Force
	}
	$logFiles = Get-ChildItem -Path "$Path\*.bak" | Where-Object { $_.Name -match "^$Name\.log\.\d+\.bak$" } | Select-Object -Property FullName,LastWriteTime
	if ($logFiles.Count -gt $Rotation-1) {
		$oldLogs = $logFiles | Sort-Object LastWriteTime -Descending | Select-Object -Last ($logFiles.Count + 1 - $Rotation)
		ForEach ($log in $oldLogs) {Remove-Item $log.FullName -Force}
	}
}

function Write-Log {
Param ([string]$Path, [string]$Message)
	$Stamp = (Get-Date).ToString('dd.MM.yyyy HH:mm:ss')
	Add-Content -Path $Path -Value "[$Stamp] - $Message"
}

$scriptName = (Get-Item $PSCommandPath).Basename	# script name
$LogFile = "$LogPath\$scriptName.log"				# script log file path
$AllStaleRecords = 0								# overall amount of removed registry records
$Computers = @()									# array of allowed event sources for subscription (no need to override if SDDL is same)
$SDDL = ''											# security descriptor of subscription (same SDDL = same set of computers)
Rotate-Logs -Path $LogPath -Name $scriptName -Rotation $LogRotation

# use 'ActiveDirectory' module or .NET 'Active Directory Searcher Object'
$ADModule = $UseADModule -and (Get-Module -Name ActiveDirectory -ListAvailable) -ne $Null
if ($UseADModule -and !($ADModule)) { Write-Log -Path $LogFile -Message "'ActiveDirectory' module for Powershell is not installed on the system." }

# get all enabled Subscriptions with type 'SourceInitiated' binded to domain objects
$Subscriptions = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\EventCollector\Subscriptions | Where-Object {
	$_.GetValue("Enabled") -eq "1" -and								# subscription is in 'enabled' state
	$_.GetValue("SubscriptionType") -eq "SourceInitiated" -and		# subscription type is 'SourceInitiated'
	$_.GetValue("AllowedSourceDomainComputers") -ne ''				# subscription is binded to domain objects
} | Select-Object -ExpandProperty PSChildName
Write-Log -Path $LogFile -Message "Got $(($Subscriptions).Count) subscription(s) binded to domain objects."

ForEach ($Subscription in $Subscriptions) {
	Write-Log -Path $LogFile -Message "[$Subscription] Starting to process subscription..."
	$StaleRecords = 0
	Try {
		# get subscription configuration file as XML
		[xml]$SubscriptionConfig = wecutil get-subscription $Subscription /format:xml
		# get subscription Heartbeat interval
		$SubscriptionHeartbeat = $SubscriptionConfig.Subscription.Delivery.PushSettings.Heartbeat.Interval
		# get all computers currently listed as event sources for that subscription
		$SubscribedComputers = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\EventCollector\Subscriptions\$Subscription\EventSources -ErrorAction Stop
		# filter out computers that are active event sources (current time - last heartbeat time < heartbeat interval)
		$SubscribedComputers = $SubscribedComputers | Where-Object { ((Get-Date) - [DateTime]::FromFileTime($_.GetValue("LastHeartbeatTime"))).TotalMilliseconds -gt $SubscriptionHeartbeat } | Select-Object -ExpandProperty PSChildName
		if ( -not $SubscribedComputers ) {
			Write-Log -Path $LogFile -Message "[$Subscription] All current event sources are active. Skipping..."
			Continue
		}
		else { Write-Log -Path $LogFile -Message "[$Subscription] Got $($SubscribedComputers.Count) inactive event source(s)." }

		# get subscription Security Descriptor
		$SubscriptionSDDL = $SubscriptionConfig.Subscription.AllowedSourceDomainComputers
		# get names of binded domain objects
		$AllowedSourceDomainComputers = ConvertFrom-SddlString -SDDL $SubscriptionSDDL -Type ActiveDirectoryRights | % {$_.DiscretionaryAcl} | % { ($_ -split ':')[0] }
		Write-Log -Path $LogFile -Message "[$Subscription] Subscription is binded to following domain objects: @($(`"'{0}'`" -f ($AllowedSourceDomainComputers -join `"'; '`")))."

		if ($SDDL -ne $SubscriptionSDDL) {
			$Computers = @()
			# get all computers currently allowed to connect to that subscription
			ForEach ($item in $AllowedSourceDomainComputers) {
				# Method 1: this method is restricted by LDAP administration limits 'MaxPageSize', 'MaxValRange', 'MaxResultSetSize' parameters
				# 			so it is recommended to thoroughly test it in your environment, before choosing it
				# https://learn.microsoft.com/en-us/troubleshoot/windows-server/identity/view-set-ldap-policy-using-ntdsutil
				if (-not $ADModule) {
					$ObjectDN = [String](Transtale-NTName($item))
					[ADSI]$ADObject = "LDAP://$ObjectDN"
					if ($ADObject.ObjectClass -eq "group") {
						$ADObject = @()

						$DS = New-Object DirectoryServices.DirectorySearcher([ADSI]"LDAP://$ObjectDN")
						$DS.Filter = "(objectClass=group)"
						$DS.SearchScope = "Base"
						$startIndex = 0
						$fetchedAll = $false
						while (-not $fetchedAll) {
							$DS.PropertiesToLoad.Add("member;range=$startIndex-$($startIndex+999)") | Out-Null
							$Members = $DS.FindOne()
							$ADObject += $Members.Properties | ForEach-Object {$_.item($_.PropertyNames -Like "member;*")} | ForEach-Object { [ADSI]("LDAP://$_") }
							$fetchedAll = $Members.Properties["member;range=$startIndex-*"].Count -gt 0
							$startIndex += 1000
						}
						$DS.Dispose()
					}
				}
				# Method 2: this method is not restricted, but requires PS 'ActiveDirectory' module to be installed on the system
				else {
					$ADObject = Get-ADObject -Identity ([String](Transtale-NTName($item))) -Properties ObjectClass,DNSHostName
					if ($ADObject.ObjectClass -eq "group") {
						$ADObject = @(Get-ADGroup -Identity $ADObject -Properties Member | Select-Object -ExpandProperty Member | Get-ADComputer)
					}
				}
				$Computers += $ADObject | Select-Object DNSHostName
			}
			$SDDL = $SubscriptionSDDL
		}
		Write-Log -Path $LogFile -Message "[$Subscription] Got $(($Computers).Count) computer(s) overall currently allowed to connect to subscription."

		Write-Log -Path $LogFile -Message "[$Subscription] Cleaning up subscription..."
		# if any inactive computer listed in registry as event source is not a member of allowed domain objects (its inactive and its not allowed) -> delete its registry record
		$SubscribedComputers | Where-Object { $Computers.DNSHostName -notcontains $_ } | ForEach-Object {
			$ComputerName = $_
			Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\EventCollector\Subscriptions\$Subscription\EventSources\$ComputerName" -Force -Verbose
			Write-Log -Path $LogFile -Message "[$Subscription] Computer '$ComputerName' is no longer allowed to connect to subscription. Removing record from registry."
			$StaleRecords += 1
		}
	} Catch [System.Management.Automation.ItemNotFoundException] {
		Write-Log -Path $LogFile -Message "[$Subscription] Subscription has no event sources registered. Skipping..."
		Continue
	} Catch {
		Write-Log -Path $LogFile -Message "[$Subscription] Unhandled error occurred during processing: $PSItem"
		Write-Log -Path $LogFile -Message "[$Subscription] Skipping..."
		Continue
	} Finally {
		Write-Log -Path $LogFile -Message "[$Subscription] Records removed: $StaleRecords"
		$AllStaleRecords += $StaleRecords
		Write-Log -Path $LogFile -Message "[$Subscription] Subscription processing finished."
	}
}
Write-Log -Path $LogFile "Records removed overall: $AllStaleRecords"
