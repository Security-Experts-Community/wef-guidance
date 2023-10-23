<#
	.SYNOPSIS
	Name: New-WECSubscriptions.ps1
	Bulk creation of Windows Event Collection Subscriptions from an input CSV
	.DESCRIPTION
	Leverages an input CSV file to bulk create WEC subscriptions for event delivery
	to dedicated custom event channels. Subscriptions are imported and enabled by default.
	Use the -NoImport and -Enable switches to override the behaviour.
	.EXAMPLE
	Create and Import the WEC subscriptions (enabled by default)
	New-WECSubscriptions.ps1 -ConfigurationFilePath EventCollectorChannels.csv
	.EXAMPLE
	Create, Import and force disable the WEC subscriptions
	New-WECSubscriptions.ps1 -ConfigurationFilePath EventCollectorChannels.csv -Enable $false
	.EXAMPLE
	Create and Import the WEC subscriptions (enabled by default). Create output WEC subscription XML files in
	custom directory.
	New-WECSubscriptions.ps1 -ConfigurationFilePath EventCollectorChannels.csv -OutputFolder C:\Subscriptions
	.EXAMPLE
	Only create the WEC subscription files, do not import them.
	New-WECSubscriptions.ps1 -ConfigurationFilePath EventCollectorChannels.csv -NoImport
	.PARAMETER ConfigurationFilePath
	A CSV file which must include a ChannelName, SubscriptionType, QueryPath, TransportName,
	ContentFormat, AllowedSourceDomainComputers, AllowedIssuerCAList and AllowedSubjectList.
	.PARAMETER OutputFolder
	The location of the output subscription .xml files. Defaults to "\Subscriptions" under the current directory.
	.PARAMETER Enable
	Creates and imports the subscriptions but enables them immediately.
	.PARAMETER NoImport
	Creates the subscriptions files, but does not import them.
	.NOTES
	Adapted from script by Russell Tomkins. See link below.
	.LINK
	https://github.com/russelltomkins/Project-Sauron/blob/master/Create-Subscriptions.ps1
#>

[CmdletBinding()]
Param(
	[Parameter(Mandatory=$true,
			   Position=0,
			   HelpMessage="Path to configuration file with ChannelName, SubscriptionType, QueryPath, TransportName, ContentFormat, AllowedSourceDomainComputers, AllowedIssuerCAList and AllowedSubjectList values.")]
	[ValidateScript({ Test-Path -Path $PSItem })]
	[Alias("CFG")]
	[string]
	$ConfigurationFilePath,

	[Parameter(Mandatory=$false,
			   Position=1,
			   HelpMessage="Location of the output subscription .xml files.")]
	[string]
	$OutputFolder = "$PSScriptRoot\Subscriptions",

	[Parameter(Mandatory=$false,
			   HelpMessage="Indicated if created subscription must be enabled immediately.")]
	[switch]
	$Enable = $true,

	[Parameter(Mandatory=$false,
			   HelpMessage="Indicates if created subscriptions files must be imported to the server.")]
	[switch]
	$NoImport = $false
)

$CustomChannels = Import-CSV $ConfigurationFilePath | Select-Object -Property ChannelName,					# Event Channel Name
																			  SubscriptionType,				# Event Subscription type ( SourceInitiated | CollectorInitiated )
																			  SubscriptionName,				# Event Subscription name
																			  QueryPath,					# path to directory with XML file containig xPath query for a susscription
																			  TransportName,				# ( HTTP | HTTPS )
																			  ContentFormat,				# ( Events | RenderedText)
																			  AllowedSourceDomainComputers,	# domain objects allowed to connect to a subscription
																			  AllowedIssuerCAList,			# CA root certificate thumbprint to check for if non-domain computer tries to authenticate with certificate
																			  AllowedSubjectList			# DNS names of non-domain computers allowd to connect to a subscription

# Loop through Chanel in input events.
ForEach ($Channel in $CustomChannels) {
	# --- Setup the Event Channels ---
	# Bind to the Event Channel
	$EventChannel = Get-WinEvent -ListLog $Channel.ChannelName

	If (!($EventChannel.IsEnabled)) {
		Write-Host "Error: Event Channel is not Enabled" -Foregroundcolor "Red" -BackGroundColor "Black"
		Write-host "Run 'Set-WECEventChannels.ps1' to configure Event Channel prior to creating event subscriptions" -Foregroundcolor "Red" -BackGroundColor "Black"
		Exit
	}
	
	# --- Create the Subscription XML's
	# Pre-pend the current Folder path and create the SubFolders
	If (!(Test-Path $OutputFolder)) {New-Item -Type Directory $OutputFolder | Out-Null}
	
	# Create our new XML File	
	$xmlFilePath = $OutputFolder + "\" + $Channel.SubscriptionName + ".xml"
	$XmlWriter = New-Object System.XMl.XmlTextWriter($xmlFilePath,$null)

	# Set The Formatting
	$xmlWriter.Formatting = "Indented"
	$xmlWriter.Indentation = "4"

	# Write the XML Decleration
	$xmlWriter.WriteStartDocument()

	# Create Subscription
	$xmlWriter.WriteStartElement("Subscription")
	$xmlWriter.WriteAttributeString("xmlns","http://schemas.microsoft.com/2006/03/windows/events/subscription")

	$xmlWriter.WriteElementString("SubscriptionId",$Channel.SubscriptionName)
	$xmlWriter.WriteElementString("SubscriptionType",$Channel.SubscriptionType)
	$xmlWriter.WriteElementString("Description",$Channel.ChannelName)
	$xmlWriter.WriteElementString("Enabled","true")
	$xmlWriter.WriteElementString("Uri","http://schemas.microsoft.com/wbem/wsman/1/windows/EventLog")
	$xmlWriter.WriteElementString("ConfigurationMode","Custom")
		$xmlWriter.WriteStartElement("Delivery")
		$xmlWriter.WriteAttributeString("Mode","Push")
			$xmlWriter.WriteStartElement("Batching")
				$xmlWriter.WriteElementString("MaxLatencyTime","30000")
			$xmlWriter.WriteEndElement() # Close Batching
			$xmlWriter.WriteStartElement("PushSettings")
				$xmlWriter.WriteStartElement("Heartbeat")
					$xmlWriter.WriteAttributeString("Interval","3600000")
				$xmlWriter.WriteEndElement() # Closing Heartbeat
			$xmlWriter.WriteEndElement() # Closing PushSettings
		$xmlWriter.WriteEndElement() # Closing Delivery

		$xmlWriter.WriteStartElement("Query")
			$Query = Get-Content -LiteralPath "$PSScriptRoot\queries\$($Channel.QueryPath)" -Raw
			$xmlWriter.WriteCData($Query)
		$xmlWriter.WriteEndElement() # Closing Query
	
		$xmlWriter.WriteElementString("ReadExistingEvents","false")
		$xmlWriter.WriteElementString("TransportName",$Channel.TransportName)
		$xmlWriter.WriteElementString("ContentFormat",$Channel.ContentFormat)
		$xmlWriter.WriteStartElement("Locale")
			$xmlWriter.WriteAttributeString("Language","en-US")
		$xmlWriter.WriteEndElement() #Closing Locale

		$xmlWriter.WriteElementString("LogFile",$Channel.ChannelName)
		$xmlWriter.WriteElementString("PublisherName","Microsoft-Windows-EventCollector")

		# SourceInitiated subscription
		if ($Channel.SubscriptionType -eq 'SourceInitiated') {
			# Add Domain Computers groups as Event Sources
			if ($Channel.AllowedSourceDomainComputers) {
				$sddlString = "O:NSG:BAD:P"
				ForEach ($SourceDomainComputer in $Channel.AllowedSourceDomainComputers.Split(';')) {
					Switch ($SourceDomainComputer) {
							"Domain Controllers" { $GroupSID = "DD" }
							"Domain Computers" { $GroupSID = "DC" }
							Default { $GroupSID = [System.Security.Principal.NTAccount]::new( $SourceDomainComputer ).Translate([System.Security.Principal.SecurityIdentifier]).Value }
					}
					$sddlString = $sddlString + "(A;;GA;;;" + $GroupSID + ")"
				}
				$sddlString = $sddlString + "S:"
				$xmlWriter.WriteElementString("AllowedSourceDomainComputers", $sddlString)
			}
			else { $xmlWriter.WriteElementString("AllowedSourceDomainComputers", "") }

			# Add Non-Domain Computers as Event Sources
			if ($Channel.AllowedIssuerCAList -or $Channel.AllowedSubjectList) {
				$xmlWriter.WriteStartElement("AllowedSourceNonDomainComputers") # Start AllowedSourceNonDomainComputers
				if ($Channel.AllowedIssuerCAList) {
					$xmlWriter.WriteStartElement("AllowedIssuerCAList") # Start AllowedIssuerCAList
					ForEach ($IssuerCAThumbprint in $Channel.AllowedIssuerCAList.Split(';')) {
						$xmlWriter.WriteElementString("IssuerCA", $IssuerCAThumbprint)
					}
					$xmlWriter.WriteEndElement() # Closing AllowedIssuerCAList
				}
				if ($Channel.AllowedSubjectList) {
					$xmlWriter.WriteStartElement("AllowedSubjectList") # Start AllowedSubjectList
					ForEach ($Subject in $Channel.AllowedSubjectList.Split(';')) {
						$xmlWriter.WriteElementString("Subject", $Subject)
					}
					$xmlWriter.WriteEndElement() # Closing AllowedSubjectList
				}
				$xmlWriter.WriteEndElement() # Closing AllowedSourceNonDomainComputers
			}
			else { $xmlWriter.WriteElementString("AllowedSourceNonDomainComputers", "") }
		} # CollectorInitiated subscription
		else {
			$xmlWriter.WriteElementString("CredentialsType", "Default")
			$xmlWriter.WriteStartElement("EventSources") # Start EventSources
			ForEach ($SourceDomainComputer in $Channel.AllowedSourceDomainComputers.Split(';')) {
				$xmlWriter.WriteStartElement("EventSource") # Start EventSource
					$xmlWriter.WriteAttributeString("Enabled", $Enable)
					$xmlWriter.WriteElementString("Address", $SourceDomainComputer)
				$xmlWriter.WriteEndElement() # Closing EventSourc
			}
			$xmlWriter.WriteEndElement() # Closing EventSource
		}

	$xmlWriter.WriteEndElement() # Closing Subscription

	# End the XML Document
	$xmlWriter.WriteEndDocument()

	# Finish The Document
	$xmlWriter.Finalize
	$xmlWriter.Flush()
	$xmlWriter.Close()

	If( -not $NoImport ){
		# Import subscription to the server
		$command = "C:\Windows\System32\wecutil.exe"
		$action = "create-subscription"
		& $command $action $xmlFilePath
	}
}
