# Optional Scripts
Scripts [`Remove-StaleWECSubscribers.ps1`](./Remove-StaleWECSubscribers.ps1) and [`Set-DSGMembership.ps1`](./Set-DSGMembership.ps1) are optional. Ideas behind them are discussed in **[Registry Pruning](#registry-pruning)** and **[Security Groups and Organizational Units synchronization](#security-groups-and-organizational-units-synchronization)** sections below. These scripts are designed to run on a schedule on WEC servers. If you're going to use them, consider specifying `$LogPath` parameter for them (default is `$PSScriptRoot`).

Moreover, scripts [`Remove-StaleWECSubscribers.ps1`](./Remove-StaleWECSubscribers.ps1) and [`Set-DSGMembership.ps1`](./Set-DSGMembership.ps1) can use either **Cmdlets** from **ActiveDirectory** module for Powershell or **Active Directory Searcher Object** from **.NET**, depending on `$UseADModule` parameter. Their performance can vary, depending on a size of an infranstructure and corresponding AD objects, so it is recommended to try both and choose which ever has more performance in your environment.

## Registry Pruning
As a solution to registry overgrough problem we provide [`Remove-StaleWECSubscribers.ps1`](./Remove-StaleWECSubscribers.ps1) script. This script is used to remove all registry keys, that belong to inactive domain client devices, ever subscribed to source-initiated (push) subscriptions and no longer allowed to connect to them. Thereby, if there is a registry key for a client device, that is no longer an active event source, and that device is currently not allowed to connect to the subscription in question, than that key is deleted.

That being said, to run the [`Remove-StaleWECSubscribers.ps1`](./Remove-StaleWECSubscribers.ps1) script, an account requires rights to delete any registry key under `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\EventCollector\Subscriptions` and permissions to list group members of domain groups, allowed to connect to managed source-initiated subscriptions.

Other than that, script [`Remove-StaleWECSubscribers.ps1`](./Remove-StaleWECSubscribers.ps1) itself requires no additional configuration and can be run on a schedule with the task action being:
```cmd
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File <Path_to_script> -LogPath <Path_to_LOGDIR> [-UseADModule]
```

## Security Groups and Organizational Units synchronization
As a solution to load balancing problem and as an additional automation of security groups management we provide [`Set-DSGMembership.ps1`](./Set-DSGMembership.ps1) script. This script is used to associate selected set of organizational units with selected set of security groups and perform synchronization of those security groups memberships with the current state of associated organizational units membership. Thus managed event subscriptions are binded directly to selected organizational units, which allows more flexibility and controllability.

Script [`Set-DSGMembership.ps1`](./Set-DSGMembership.ps1) requires an account with **Read Members** and **Write Members** permissions to specified domain security groups, so it is recommended to use a dedicated gMSA account to run that script on a schedule. Also, take into account, that this script must only be run on one collector, responsible for chosen set of domain security groups (its subscribers). If several collectors are managing the same set of domain security groups, make sure that this script is configured to run only on one of them to avoid conflicts.

Other than that, script [`Set-DSGMembership.ps1`](./Set-DSGMembership.ps1) takes input data from file [`DSG.json`](./DSG.json). All data, related to which security groups are associated with which organizational units based on which LDAP filter, located in that file. Security groups, defined in [`DSG.json`](./DSG.json), should also match security groups, defined in chosen `EventCollectorSubscriptions.csv` configuration file `AllowedSourceDomainComputers` column. Make sure to put correct data into both those files.

### GMSA Account configuration
To configure gMSA account do the following:

1. If KDS Root Key was not created previously, create it:
	```powershell
	Add-KdsRootKey -EffectiveImmediately
	```
2. Create new gMSA account:
	```powershell
	New-ADServiceAccount -Name <gMSA_Name> -DNSHostName <gMSA_FQDN> -KerberosEncryptionType AES128, AES256 -Enabled $True -PrincipalsAllowedToRetrieveManagedPassword <server_hostname>
	```
	 or allow existing one to be used on the target server(s):
	```powershell
	Set-ADServiceAccount -Identity <gMSA_Name> -PrincipalsAllowedToRetrieveManagedPassword <server_1_hostname>,...,<server_n_hostname>
	```
3. Give the gMSA account **Log on as a service** right on the target server(s).
4. Give the gMSA account **Read Members** and **Write Members** permissions to domain security groups, specified in chosen `EventCollectorSubscriptions.csv` and [`DSG.json`](./DSG.json) files.
5. Install the gMSA account on the target server(s):
	```powershell
	Install-ADServiceAccount -Identity <gMSA_Name>
	```

### Scheduled Task configuration
To configure scheduled task do the following:

1. Deploy scheduled task to the target server(s) and configure it to run [`Set-DSGMembership.ps1`](./Set-DSGMembership.ps1) script.
2. Configure `Set-DSGMembership` task to use gMSA account:
	```powershell
	$Principal = New-ScheduledTaskPrincipal -UserID <gMSA_sAMAccountName> -LogonType Password -RunLevel Highest
	Set-ScheduledTask "Set-DSGMembership" -Principal $Principal -ErrorAction Stop
	```
3. Reconfigure `Set-DSGMembership` task action, if needed:
	```powershell
	$Action = New-ScheduledTaskAction -Execute 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe' -Argument '-ExecutionPolicy Bypass -File <Path_to_script> -DSGJSON <Path_to_DSGJSON> -LogPath <Path_to_LOGDIR> [-UseADModule]'
	Set-ScheduledTask "Set-DSGMembership" -Action $Action -ErrorAction Stop
	```
4. Reconfigure `Set-DSGMembership` task trigger, if needed:
	```powershell
	$ScheduleRunTime = (Get-Date).Date + "08:00:00"
	$Trigger = New-ScheduledTaskTrigger -Daily -DaysInterval 1 -At $ScheduleRunTime
	Set-ScheduledTask "Set-DSGMembership" -Trigger $Trigger -ErrorAction Stop
	```
