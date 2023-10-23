<#
	.SYNOPSIS
	Name: New-WECManifest.ps1
	Creates a custom event channel manifest file from input CSV
	.DESCRIPTION
	Leverages an input CSV file to create the required Manifest file for .dll compilation
	Once compiled, can be loaded into a Windows Event Collector to allow custom forwarding
	and long term storage of events.
	.EXAMPLE
	Creates the Manfifest file to compile
	New-WECManifest.ps1 -ConfigurationFilePath EventCollectorChannels.csv
	.PARAMETER ConfigurationFilePath
	A CSV file which must include a ProviderSymbol, ProviderName, ProviderGuid, ChannelSymbol
	and ChannelName.
	.NOTES
	Adapted from script by Russell Tomkins. See link below.
	.LINK
	https://github.com/russelltomkins/Project-Sauron/blob/master/Create-Manifest.ps1
#>

[CmdletBinding()]
Param(
	[Parameter(Mandatory=$true,
			   Position=0,
			   HelpMessage="Path to configuration file with ProviderSymbol, ProviderName, ProviderGuid, ChannelSymbol and ChannelName values.")]
	[ValidateScript({ Test-Path -Path $PSItem })]
	[Alias("CFG")]
	[string]
	$ConfigurationFilePath
)

$BaseName = [System.IO.Path]::GetFileNameWithoutExtension($ConfigurationFilePath)			# configuration file, Manifest file and DLL file base name
$CustomEventsDLL = "C:\Windows\System32\$BaseName.dll"										# The Resource and Message DLL that will be referenced in the manifest.
$CustomEventsMAN = "$PSScriptRoot\$BaseName.man"											# The Manifest file
$CustomEvents = Import-CSV $ConfigurationFilePath | Select-Object -Property ProviderSymbol,	# Event Provider ID
																			ProviderName,	# Event Provider Name
																			ProviderGuid,	# Event Provider GUID
																			ChannelSymbol,	# Event Channel ID
																			ChannelName		# Event Channel Name

# Create The Manifest XML Document
$XmlWriter = New-Object System.XMl.XmlTextWriter($CustomEventsMAN,$null)

# Set The Formatting
$xmlWriter.Formatting = "Indented"
$xmlWriter.Indentation = "4"

# Write the XML Decleration
$xmlWriter.WriteStartDocument()

# Create Instrumentation Manifest
$xmlWriter.WriteStartElement("instrumentationManifest")
$xmlWriter.WriteAttributeString("xsi:schemaLocation","http://schemas.microsoft.com/win/2004/08/events eventman.xsd")
$xmlWriter.WriteAttributeString("xmlns","http://schemas.microsoft.com/win/2004/08/events")
$xmlWriter.WriteAttributeString("xmlns:win","http://manifests.microsoft.com/win/2004/08/windows/events")
$xmlWriter.WriteAttributeString("xmlns:xsi","http://www.w3.org/2001/XMLSchema-instance")
$xmlWriter.WriteAttributeString("xmlns:xs","http://www.w3.org/2001/XMLSchema")
$xmlWriter.WriteAttributeString("xmlns:trace","http://schemas.microsoft.com/win/2004/08/events/trace")

# Create Instrumentation, Events and Provider Elements
$xmlWriter.WriteStartElement("instrumentation")
$xmlWriter.WriteStartElement("events")

$ProviderList = $CustomEvents | Select-Object -Property ProviderSymbol,ProviderName,ProviderGuid -Unique
ForEach($Provider in $ProviderList){
	$xmlWriter.WriteStartElement("provider")
		$xmlWriter.WriteAttributeString("name",$Provider.ProviderName)
		$xmlWriter.WriteAttributeString("guid",$Provider.ProviderGuid)
		$xmlWriter.WriteAttributeString("symbol",$Provider.ProviderSymbol)
		$xmlWriter.WriteAttributeString("resourceFileName",$CustomEventsDLL)
		$xmlWriter.WriteAttributeString("messageFileName",$CustomEventsDLL)
		$xmlWriter.WriteAttributeString("parameterFileName",$CustomEventsDLL)
		$xmlWriter.WriteStartElement("channels")

		$ChannelList = $CustomEvents | Where-Object{$_.ProviderSymbol -eq $Provider.ProviderSymbol} | Select-Object -Property ChannelName,ChannelSymbol -Unique
		ForEach($Channel in $ChannelList){
			$xmlWriter.WriteStartElement("channel")	
				$xmlWriter.WriteAttributeString("name",$Channel.ChannelName)
				$xmlWriter.WriteAttributeString("chid",($Channel.ChannelName).Replace(' ',''))
				$xmlWriter.WriteAttributeString("symbol",$Channel.ChannelSymbol)
				$xmlWriter.WriteAttributeString("type","Admin")
				$xmlWriter.WriteAttributeString("enabled","false")
			$xmlWriter.WriteEndElement() # Closing channel
		}
		$xmlWriter.WriteEndElement() # Closing channels
	$xmlWriter.WriteEndElement() # Closing provider
}

$xmlWriter.WriteEndElement() # Closing events
$xmlWriter.WriteEndElement() # Closing Instrumentation
$xmlWriter.WriteEndElement() # Closing instrumentationManifest

# End the XML Document
$xmlWriter.WriteEndDocument()

# Finish The Document
$xmlWriter.Finalize
$xmlWriter.Flush()
$xmlWriter.Close()
