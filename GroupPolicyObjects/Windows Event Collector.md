# Windows Event Collector

**Description**: This policy configures Event Collector servers. It is applied to domain member servers with enabled WECSVC service and will configure the following settings:

- Appropriate WinRM access for WEF clients.
- Automatic startup for WinRM service.
- (Optional) Appropriate log on rights for service accounts.
- (Optional) Appropriate Administrators group membership for WEC administrators.
- (Optional) Lesser TcpTimedWaitDelay.
- (Optional) WECSVC Service isolation.
- (Optional) Automatic registry pruning.

**Where to Link**: Member Servers OUs.

**WMI Filter**: SELECT * FROM Win32_Service WHERE Name="Wecsvc" AND StartMode="Auto".

## Configuration

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components -> Windows Remote Management (WinRM)/WinRM Service -> Allow Remote Server Management through WinRM** to:

- **IPV4 filter**: [network ranges]
- **IPv6 filter**: *

**Note**:

- **network ranges**: Ranges of IPv4 addresses allowed to connect via WinRM. Must include addresses of all event sources.
- set **IPv6 filter** to '*' only if the WEC server is going to be an event source to itself.

&nbsp;

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> System Services -> Windows Remote Management (WS-Management)** to:

- **Startup Mode**: Automatic

&nbsp;

Create new service configuration under **Computer Configuration -> Preferences -> Control Panel Settings -> Services** with the following settings:

- **Service name**: WinRM
- **Action**: Start service
- **Startup type**: Automatic
- **First failure**: Restart the service
- **Second failure**: Restart the service
- **Subsequent failures**: Restart the service

## Optional

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Local Polices/User Rights Assignment** to:

- **Log on as a service**: [objects]

**Note**: **objects** is a list of all domain groups and/or accounts allowed to log on the target server as a service.

&nbsp;

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Restricted Groups** to:

- **BUILTIN\Administrators**: [objects]

**Note**: **objects** is a list of all domain groups and/or accounts given the administrator rights on the target server.

&nbsp;

Create new registry key under **Computer Configuration -> Preferences -> Windows Settings -> Registry** with the following settings:

- **Action**: Update
- **Hive**: HKEY_LOCAL_MACHINE
- **Key path**: SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
- **Value name**: TcpTimedWaitDelay
- **Value type**: REG_DWORD
- **Value data**: 30

&nbsp;

Create new task under **Computer Configuration -> Preferences -> Control Panel Settings -> Scheduled Tasks** with the following settings:

- **Task type**: Immediate Task (At least Windows 7)
- **Task**:
	+ **Name**: Isolate the WECSVC Service
	+ **UserId**: NT AUTHORITY\System
	+ **Run with highest privileges**: HighestAvailable
- **Actions**:
	+ **Start a program**:
		+ **Program/script**: C:\Windows\System32\sc.exe
		+ **Arguments**: config wecsvc type=own

&nbsp;

Create new task under **Computer Configuration -> Preferences -> Control Panel Settings -> Scheduled Tasks** with the following settings:

- **Task type**: Scheduled Task (At least Windows 7)
- **Action**: Update
- **Task**:
	- **Name**: Remove-StaleWECSubscribers
	- **UserId**: NT AUTHORITY\System
	- **Run with highest privileges**: HighestAvailable
- **Triggers**:
	+ **Weekly**
- **Actions**:
	+ **Start a program**:
		+ **Program/script**: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
		+ **Arguments**: -ExecutionPolicy Bypass -File [scPath] -LogPath [logPath]

**Note**:

- **scPath**: path to `Remove-StaleWECSubscribers.ps1` script.
- **logPath**: path to directory, where script logs will be written.
