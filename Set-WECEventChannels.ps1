<#
	.SYNOPSIS
	Name: Set-WECEventChannels.ps1
	Preparation of event channels to receive event collection subscriptions from an input CSV.
	.DESCRIPTION
	Leverages an input CSV file to prepare the custom event channels created by New-WECManifest.ps1.
	.EXAMPLE
	Prepare the Event Chanenls using the Input CSV file.
	Set-WECEventChannels.ps1 -ConfigurationFilePath EventCollectorChannels.csv
	.PARAMETER ConfigurationFilePath
	A CSV file which must include a ChannelName, LogRootPath and MaximumSizeInBytes.
#>

[CmdletBinding()]
Param(
	[Parameter(Mandatory=$true,
	           Position=0,
	           HelpMessage="Path to configuration file with ChannelName, LogRootPath and MaximumSizeInBytes values.")]
    [ValidateScript({ Test-Path -Path $PSItem })]
	[Alias("CFG")]
	[string]
	$ConfigurationFilePath
)

$CustomChannels = Import-CSV $ConfigurationFilePath | Select-Object -Property ChannelName,			# Event Channel Name
																			  LogRootPath,			# path to directory where event channel log file will be stored
																			  MaximumSizeInBytes	# maximum size in bytes of an event channel log file

# get only unique channels
$CustomChannels = $CustomChannels | Group-Object -Property 'ChannelName' | ForEach-Object { $_.Group | Sort-Object -Property [int]'MaximumSizeInBytes' -Descending | Select-Object -First 1 }
ForEach ($path in ($CustomChannels.LogRootPath | Select-Object -Unique)) {
	# Create The Folder
	If(!(Test-Path $path)) {New-Item -Type Directory $path | Out-Null}

	# Add an ACE to allow LOCAL SERVICE to modify the folder
	$ACE = New-Object System.Security.AccessControl.FileSystemAccessRule("LOCAL SERVICE",'Modify','ContainerInherit,ObjectInherit','None','Allow')
	$LogRootPathACL = (Get-Item $path) | Get-ACL
	$LogRootPathACL.AddAccessRule($ACE)
	$LogRootPathACL | Set-ACL

	# Enable NTFS compression to save disk space
	$Query = "select * from CIM_Directory where name = `"$($path.Replace('\','\\'))`""
	$Results = Invoke-CimMethod -Query $Query -MethodName Compress
}

# Loop through Chanell form the InputCSV
ForEach ($Channel in $CustomChannels) {
	# --- Setup the Event Channels ---
	# Bind to the Event Channel
	$EventChannel = Get-WinEvent -ListLog $Channel.ChannelName -ErrorAction "SilentlyContinue"
	If ($EventChannel -eq $Null) {
		Write-Host "`nError: Event channel not loaded:`"$($Channel.ChannelName)`"" -ForeGroundColor Red
		Write-Host "`nEnsure the manifest and dll has been loaded with wevtutil.exe im <path to manifest.man>`n" -foregroundColor Green
		Exit
	}

	# Disable the channel to allow changes
	If ($EventChannel.IsEnabled) {
		$EventChannel.IsEnabled = $False
		$EventChannel.SaveChanges()
	}
	
	# Update the channel to our requried Values
	$EventChannel.LogFilePath = $Channel.LogRootPath + "\" + ([string]$Channel.ChannelName).Replace('/','%4') + ".evtx"
	$EventChannel.LogMode = "Circular"
	$EventChannel.MaximumSizeInBytes = $Channel.MaximumSizeInBytes
	$EventChannel.SaveChanges()

	# Enable the Log
	$EventChannel.IsEnabled = $True
	$EventChannel.SaveChanges()
}
