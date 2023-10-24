<#
	.SYNOPSIS
	Name: Set-DSGMembership.ps1
	Keeps domain security groups, specified in provided configuration file, up-to-date, according to
	that file content.
	.DESCRIPTION
	Leverages an input JSON file to check and update specified domain security groups membership
	according to membersip of associated domain OUs.
	.EXAMPLE
	Update domain security groups.
	Set-DSGMembership.ps1 -DSGJSON DSG.json
	.EXAMPLE
	Update domain security groups and write log to specified location.
	Set-DSGMembership.ps1 -LogPath S:\Script\Logs
	.EXAMPLE
	Update domain security groups, write log to specified location and redefine number of logs to rotate.
	Set-DSGMembership.ps1 -LogPath S:\Script\Logs -LogRotation 10
	.EXAMPLE
	Update domain security groups, using Cmdlets from 'ActiveDirectory' module.
	Set-DSGMembership.ps1 -UseADModule
	.PARAMETER ConfigurationFilePath
	A JSON configuratino file, which must include DSGName, OUDNList and searchFilter.
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
	[Parameter(Mandatory=$true,
			   Position=0,
			   HelpMessage="Path to JSON configuratino file.")]
	[ValidateScript({ Test-Path -Path $PSItem })]
	[Alias("CFG", "DSGJSON")]
	[string]
	$ConfigurationFilePath,

	[Parameter(Mandatory=$false,
			   Position=1,
			   HelpMessage="Path to directory, where script logs will be written.")]
	[ValidateScript({ Test-Path -Path $PSItem })]
	[string]
	$LogPath = "$PSScriptRoot",

	[Parameter(Mandatory=$false,
			   Position=2,
			   HelpMessage="Number of log files to rotate.")]
	[int]
	$LogRotation = 5,

	[Parameter(Mandatory=$false,
			   HelpMessage="Indicates if 'ActiveDirectory' module Cmdlets should be used instead of .NET 'Active Directory Searcher Object'.")]
	[switch]
	$UseADModule = $false
)

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
Rotate-Logs -Path $LogPath -Name $scriptName -Rotation $LogRotation

# use 'ActiveDirectory' module or .NET 'Active Directory Searcher Object'
$ADModule = $UseADModule -and (Get-Module -Name ActiveDirectory -ListAvailable) -ne $Null
if ($UseADModule -and !($ADModule)) { Write-Log -Path $LogFile -Message "'ActiveDirectory' module for Powershell is not installed on the system." }

$DynamicDSG = Get-Content -Raw $ConfigurationFilePath | ConvertFrom-Json
Write-Log -Path $LogFile -Message "Got $(($DynamicDSG).Count) Domain Security Groups to update: $(($DynamicDSG.DSGDN -split "," | ConvertFrom-StringData).CN -join(', '))."

ForEach ($item in $DynamicDSG) {
	$RemovedMembers = 0		# amount of computer accounts removed from all specified Domain Security Groups
	$NewMembers = 0			# amount of newly added members of all specified Domain Security Groups
	$DSGMembers = @()		# current members of DSG
	$OUsMembers = @()		# current members of all OUs specified in OUDNList
	$DSGName = ($item.DSGDN -split "," | ConvertFrom-StringData).CN
	Write-Log -Path $LogFile -Message "[$DSGName] Trying to update Domain Security Group '$DSGName' members list based on Organizational Unit List @($(`"'{0}'`" -f ($item.OUDNList -join `"'; '`")))..."
	Try {
		ForEach ($OUDN in $item.OUDNList) {
			# get currecnt OU members
			Try {
				# Method 1: this method is restricted by LDAP administration limits 'MaxPageSize', 'MaxValRange', 'MaxResultSetSize' parameters
				# 			so it is recommended to thoroughly test it in your environment, before choosing it
				# https://learn.microsoft.com/en-us/troubleshoot/windows-server/identity/view-set-ldap-policy-using-ntdsutil
				if (-not $ADModule) {
					# check if OU exists
					if ([ADSI]::Exists("LDAP://$OUDN")) {
						$DS = New-Object DirectoryServices.DirectorySearcher([ADSI]"LDAP://$OUDN")
						$DS.Filter = $item.searchFilter
						$DS.SearchScope = "Subtree"
						$DS.PageSize = 500
						$Members = @($DS.FindAll() | ForEach-Object { [ADSI]("$($_.Path)") })
						$DS.Dispose()
					}
				}
				# Method 2: this method is not restricted, but requires PS 'ActiveDirectory' module to be installed on the system
				else {
					# check if OU exists
					Get-ADOrganizationalUnit -Identity $OUDN -ErrorAction Stop | Out-Null
					$Members = @(Get-ADComputer -LDAPFilter $item.searchFilter -SearchBase $OUDN -SearchScope Subtree -ErrorAction Stop)
				}
				$OUsMembers += $Members
				Write-Log -Path $LogFile -Message "[$DSGName] Organizational Unit '$OUDN' currently has $($Members.Count) member(s), matching provided filter."
			} Catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
				Write-Log -Path $LogFile -Message "[$DSGName] Organizational Unit '$OUDN' doesn't exist in Domain hierarchy."
				Write-Log -Path $LogFile -Message "[$DSGName] Skipping..."
				Continue
			} Catch {
				Write-Log -Path $LogFile -Message "[$DSGName] Unhandled error occurred during Organizational Unit '$OUDN' members list retrieval: $PSItem"
				Write-Log -Path $LogFile -Message "[$DSGName] Skipping..."
				Continue
			}
		}
		Write-Log -Path $LogFile -Message "[$DSGName] Organizational Units @($(`"'{0}'`" -f ($item.OUDNList -join `"'; '`"))) currently have $($OUsMembers.Count) member(s), matching provided filter, overall."

		# get current DSG members
		Try {
			# Method 1: this method is restricted by LDAP administration limits 'MaxPageSize', 'MaxValRange', 'MaxResultSetSize' parameters
			# 			so it is recommended to thoroughly test it in your environment, before choosing it
			# https://learn.microsoft.com/en-us/troubleshoot/windows-server/identity/view-set-ldap-policy-using-ntdsutil
			if (-not $ADModule) {
				# check if DSG exists
				if ([ADSI]::Exists("LDAP://$($item.DSGDN)")) {
					$DSG = [ADSI]("LDAP://$($item.DSGDN)")
					$DSGMembers = @()

					$DS = New-Object DirectoryServices.DirectorySearcher([ADSI]"LDAP://$($item.DSGDN)")
					$DS.Filter = "(objectClass=group)"
					$DS.SearchScope = "Base"
					$startIndex = 0
					$fetchedAll = $false
					while (-not $fetchedAll) {
						$DS.PropertiesToLoad.Add("member;range=$startIndex-$($startIndex+999)") | Out-Null
						$Members = $DS.FindOne()
						$DSGMembers += $Members.Properties | ForEach-Object {$_.item($_.PropertyNames -Like "member;*")} | ForEach-Object { [ADSI]("LDAP://$_") }
						$fetchedAll = ($Members.Properties).Count -eq 1 -or $Members.Properties["member;range=$startIndex-*"].Count -gt 0
						$startIndex += 1000
					}
					$DS.Dispose()
				}
			}
			# Method 2: this method is not restricted, but requires PS 'ActiveDirectory' module to be installed on the system
			else {
				# check if DSG exists
				$DSG = Get-ADGroup -Identity $item.DSGDN -ErrorAction Stop
				$DSGMembers = @(Get-ADGroup -Identity $item.DSGDN -Properties Member -ErrorAction Stop | Select-Object -ExpandProperty Member | Get-ADComputer)
			}
			Write-Log -Path $LogFile -Message "[$DSGName] Domain Security Group '$DSGName' currently has $($DSGMembers.Count) member(s)."
		} Catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
			Write-Log -Path $LogFile -Message "[$DSGName] Domain Security Group '$DSGName' doesn't exist in Domain hierarchy."
			Write-Log -Path $LogFile -Message "[$DSGName] Skipping..."
			Continue
		} Catch {
			Write-Log -Path $LogFile -Message "[$DSGName] Unhandled error occurred during Domain Security Group '$DSGName' members list retrieval: $PSItem"
			Write-Log -Path $LogFile -Message "[$DSGName] Skipping..."
			Continue
		}

		$DSGMembers = $DSGMembers | Select-Object -Property ADSPath,objectGUID,Name | Sort-Object -Property [string]Name
		$OUsMembers = $OUsMembers | Select-Object -Property ADSPath,objectGUID,Name | Sort-Object -Property [string]Name

		# update DSG membership
		# both DSG and OU are empty
		if ((-not $DSGMembers) -and (-not $OUsMembers)) {
			Write-Log -Path $LogFile -Message "[$DSGName] All Organizational Units '$($item.OUDNList)' and Domain Security Group '$DSGName' are empty - nothing to update."
		# DSG is empty
		} ElseIf ((-not $DSGMembers) -and ($OUsMembers)) {
			Write-Log -Path $LogFile -Message "[$DSGName] Domain Security Group '$DSGName' is empty - adding all members of Organizational Units '$($item.OUDNList)'..."
			if (-not $ADModule) { $OUsMembers | ForEach-Object {$DSG.Add($_.ADSPath)} }
			else { $DSG | Add-ADGroupMember -Members $OUsMembers.objectGUID -Confirm:$false -ErrorAction Stop }
			$NewMembers = $OUsMembers.Count
		# OU is empty
		} ElseIf ((-not $OUsMembers) -and ($DSGMembers)) {
			Write-Log -Path $LogFile -Message "[$DSGName] Organizational Units '$($item.OUDNList)' are empty - removing all members from Domain Security Group '$DSGName'..."
			if (-not $ADModule) { $DSGMembers | ForEach-Object {$DSG.Remove($_.ADSPath)} }
			else { $DSG | Remove-ADGroupMember -Members $DSGMembers.objectGUID -Confirm:$false -ErrorAction Stop }
			$RemovedMembers = $DSGMembers.Count
		# both DSG and OU have members
		} ElseIf (($DSGMembers) -and ($OUsMembers)) {
			Switch (Compare-Object -ReferenceObject $DSGMembers -DIfferenceObject $OUsMembers -Property ADSPath,objectGUID,Name) {
				# computer account is a memeber of OU, but not a member of DSG -> add computer account to DSG
				{ $_.SideIndicator -eq "=>" } {
					if (-not $ADModule) { $DSG.Add($_.ADSPath) }
					else { $DSG | Add-ADGroupMember -Members $_.objectGUID -Confirm:$false -ErrorAction Stop }
					Write-Log -Path $LogFile -Message "[$DSGName] Added new member '$($_.Name)' to Domain Security Group '$DSGName'."
					$NewMembers++
				}
				# computer account is a memeber of DSG, but not a member of OU -> remove computer account from DSG
				{ $_.SideIndicator -eq "<=" } {
					if (-not $ADModule) { $DSG.Remove($_.ADSPath) }
					else { $DSG | Remove-ADGroupMember -Members $_.objectGUID -Confirm:$false -ErrorAction Stop }
					Write-Log -Path $LogFile -Message "[$DSGName] Removed member '$($_.Name)' from Domain Security Group '$DSGName'."
					$RemovedMembers++
				}
			}
		}
	} Catch {
		Write-Log -Path $LogFile -Message "[$DSGName] Unhandled error occurred during Domain Security Group '$DSGName' update: $PSItem"
		Write-Log -Path $LogFile -Message "[$DSGName] Skipping..."
		Continue
	} Finally {
		Write-Log -Path $LogFile -Message "[$DSGName] New members added: $NewMembers"
		Write-Log -Path $LogFile -Message "[$DSGName] Members removed: $RemovedMembers"
		Write-Log -Path $LogFile -Message "[$DSGName] Domain Security Group '$DSGName' update finished."
	}
}
