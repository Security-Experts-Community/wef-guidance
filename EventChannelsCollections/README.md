# Windows Event Channels
As described in the blog post [Creating Custom Windows Event Forwarding Logs](https://blogs.technet.microsoft.com/russellt/2016/05/18/creating-custom-windows-event-forwarding-logs/), WEF can be extended with additional custom event channels. Extending the number of event channels available provides a few primary benefits:

- Each event channel can have an independent maximum size and rotation strategy.
- Each event channel can be used as a unique identifier for tagging data for ingestion into a SIEM.
- Event channels may be placed on different disks or storage devices for improving disk I/O.

Once the Event Channel Instrumentation Manifest has been compiled into a DLL, it is loaded onto the WEC server, where it will register and create the appropriate channels and log files.

If you're like us and don't trust random DLLs, feel free to use our manifest file and build your own.

## List of Channels collections
- **[Host Roles Based Event Channels](HostRolesBased/)**

## Pre-Requisites:
You will need the following software to build the DLL:

- Windows 10 SDK (Note that ecmangen.exe has been removed from the SDK as at version 10.0.16299.15)

> From [Microsoft](https://developer.microsoft.com/en-US/windows/downloads/windows-10-sdk): "Developers who rely on ecmangen for event manifest creation are advised to install the [Windows Creators Edition of the SDK](https://developer.microsoft.com/en-us/windows/downloads/sdk-archive) to obtain the file"

- Windows Workstation

## Editing:
Make any changes to the chosen `EventCollectorChannels.csv` configuration file. Ensure the following settings are observed:

- All GUIDs are unique for each provider.
- No more than 8 channels are added to each provider.
- Maximum size is specified for each channel.
- Symbols use underscores and not hyphens.

**Note:** If you've added a new channel provider or modified an existing one, please generate a new unique GUID for it as well. You can use PowerShell to do that:
```powershell
[guid]::NewGuid()
```

Generate new Instrumentation Manifest file with [`New-WECManifest.ps1`](./New-WECManifest.ps1) script:
```powershell
.\New-WECManifest.ps1 -ConfigurationFilePath .\EventChannelsCollections\...\EventCollectorChannels.csv
```

## Compiling:
To compile, perform the following from a cmd.exe shell:
```cmd
"C:\Program Files (x86)\Windows Kits\10\bin\x64\mc.exe" EventCollectorChannels.man
"C:\Program Files (x86)\Windows Kits\10\bin\x64\mc.exe" -css EventCollectorChannels.DummyEvent EventCollectorChannels.man
"C:\Program Files (x86)\Windows Kits\10\bin\x64\rc.exe" EventCollectorChannels.rc
"C:\Windows\Microsoft.NET\Framework64\v4.x.x\csc.exe" /win32res:EventCollectorChannels.res /unsafe /target:library /out:EventCollectorChannels.dll EventCollectorChannels.cs
```

## Deployment:
For each collector server you need to deploy this to, perform the following:

1. Disable the Windows Event Collector Service:
	```cmd
	net stop Wecsvc
	```
2. Disable all current WEF subscriptions.
3. Unload the current Instrumentation Manifest:
	```cmd
	wevtutil um C:\windows\system32\CustomEventChannels.man
	```
4. Place new Instrumentation Manifest and DLL files to `C:\Windows\System32\`:
	```cmd
	copy EventCollectorChannels.man C:\Windows\System32\EventCollectorChannels.man
	copy EventCollectorChannels.dll C:\Windows\System32\EventCollectorChannels.dll
	```
5. Register new Instrumentation Manifest:
	```cmd
	wevtutil im C:\Windows\System32\EventCollectorChannels.man
	```
6. Configure custom event channels with [`Set-WECEventChannels.ps1`](./Set-WECEventChannels.ps1) script:
	```powershell
	.\Set-WECEventChannels.ps1 -ConfigurationFilePath EventCollectorChannels.csv
	```
7. Re-enable the WEF subscriptions.
8. Restart the Windows Event Collector Service:
	```cmd
	net start Wecsvc
	```
