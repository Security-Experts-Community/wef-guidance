# Event Categories Based Event Subscriptions
Subscriptions, provided in this collection, are not intended for in depth security analysis and incident detection within event collector itself. Rather than that, they are defined as such to use along side enterprise SIEM system, so you can choose which category of events you want to collect and store on the collectors side and/or the SIEMs side. If that is not suitable for you, feel free to modify any of them to fit your goals or take ready to deploy alternatives from any other project, available on the internet.

This subscriptions collection is based on [Michel de CREVOISIER](https://github.com/mdecrevoisier) **Microsoft-eventlog-mindmap** project.  
Original work can be found here: https://github.com/mdecrevoisier/Microsoft-eventlog-mindmap
## List of WEF Subscriptions
- **[10-Network](#10-network)**: Network services and firewall events.
- **[11-Remote management](#11-remote-management)**: Remote management services events.
- **[20-System activity](#20-system-activity)**: System activity, modification and configuration events.
- **[21-Software & Updates](#21-software-updates)**: Software and AppLocker events.
- **[22-Task & Service](#22-task-service)**: Task scheduler and service control events.
- **[23-User & Group management](#23-user-group-management)**: User and group management events.
- **[31-System security](#31-system-security)**: System security events.
- **[32-Image & external device](#32-image-external-device)**: External device and drivers events.
- **[40-Powershell](#40-powershell)**: powershell events.
- **[50-Authentication](#50-authentication)**: AAA events.
- **[Active Directory](#active-directory)**: AD services events.
- **[Server Roles](#server-roles)**: Non AD windows server roles services events.
## Event Mapping
This is a table of all events, collected by all subscriptions, provided with this collection.
### 10-Network
| Event Log | Default State | Event Code | Event Name |
| --------- | ------------- | ---------- | ---------- |
| Security	| Enabled		| [4944](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4944) | The following policy was active when the Windows Firewall started (S) |
| Security	| Enabled		| [4945](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4945) | A rule was listed when the Windows Firewall started (S) |
| Security	| Enabled		| [4946](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4946) | A change has been made to Windows Firewall exception list. A rule was added (S) |
| Security	| Enabled		| [4947](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4947) | A change has been made to Windows Firewall exception list. A rule was modified (S) |
| Security	| Enabled		| [4948](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4948) | A change has been made to Windows Firewall exception list. A rule was deleted (S) |
| Security	| Enabled		| [4949](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4949) | Windows Firewall settings were restored to the default values (S) |
| Security	| Enabled		| [4950](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4950) | A Windows Firewall setting has changed (S) |
| Security	| Enabled		| [4951](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4951) | A rule has been ignored because its major version number wasn't recognized by Windows Firewall (F) |
| Security	| Enabled		| [4952](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4952) | Parts of a rule have been ignored because its minor version number was not recognized by Windows Firewall. The other parts of the rule will be enforced (F) |
| Security	| Enabled		| [4953](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4953) | Windows Firewall ignored a rule because it couldn't be parsed (F) |
| Security	| Enabled		| [4954](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4954) | Windows Firewall Group Policy settings have changed. The new settings have been applied (S) |
| Security	| Enabled		| [4956](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4956) | Windows Firewall has changed the active profile (S) |
| Security	| Enabled		| [4957](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4957) | Windows Firewall did not apply the following rule (F) |
| Security	| Enabled		| [4958](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4958) | Windows Firewall did not apply the following rule because the rule referred to items not configured on this computer (F) |
| Security	| Enabled		| [5031](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5031) | The Windows Firewall Service blocked an application from accepting incoming connections on the network (F) |
| Security	| Enabled		| [5040](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-filtering-platform-policy-change) | A change has been made to IPsec settings. An Authentication Set was added (S) |
| Security	| Enabled		| [5041](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-filtering-platform-policy-change) | A change has been made to IPsec settings. An Authentication Set was modified (S) |
| Security	| Enabled		| [5042](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-filtering-platform-policy-change) | A change has been made to IPsec settings. An Authentication Set was deleted (S) |
| Security	| Enabled		| [5043](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-filtering-platform-policy-change) | A change has been made to IPsec settings. A Connection Security Rule was added (S) |
| Security	| Enabled		| [5044](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-filtering-platform-policy-change) | A change has been made to IPsec settings. A Connection Security Rule was modified (S) |
| Security	| Enabled		| [5045](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-filtering-platform-policy-change) | A change has been made to IPsec settings. A Connection Security Rule was deleted (S) |
| Security	| Enabled		| [5046](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-filtering-platform-policy-change) | A change has been made to IPsec settings. A Crypto Set was added (S) |
| Security	| Enabled		| [5047](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-filtering-platform-policy-change) | A change has been made to IPsec settings. A Crypto Set was modified (S) |
| Security	| Enabled		| [5048](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-filtering-platform-policy-change) | A change has been made to IPsec settings. A Crypto Set was deleted (S) |
| Security	| Enabled		| [5140](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5140) | A network share object was accessed (S, F) |
| Security	| Enabled		| [5142](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5142) | A network share object was added (S) |
| Security	| Enabled		| [5143](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5143) | A network share object was modified (S) |
| Security	| Enabled		| [5144](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5144) | A network share object was deleted (S) |
| Security	| Enabled		| [5145](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5145) | A network share object was checked to see whether client can be granted desired access (S, F) |
| Security	| Enabled		| 5146		  | The Windows Filtering Platform blocked a packet (-) |
| Security	| Enabled		| 5147		  | A more restrictive Windows Filtering Platform filter has blocked a packet (-) |
| Security	| Enabled		| [5148](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5148) | The Windows Filtering Platform has detected a DoS attack and entered a defensive mode; packets associated with this attack will be discarded (F) |
| Security	| Enabled		| [5149](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5149) | The DoS attack has subsided and normal processing is being resumed (F) |
| Security	| Enabled		| [5150](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5150) | The Windows Filtering Platform blocked a packet (-) |
| Security	| Enabled		| [5151](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5151) | A more restrictive Windows Filtering Platform filter has blocked a packet (-) |
| Security	| Enabled		| [5152](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5152) | The Windows Filtering Platform blocked a packet (F) |
| Security	| Enabled		| [5153](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5153) | A more restrictive Windows Filtering Platform filter has blocked a packet (S) |
| Security	| Enabled		| [5154](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5154) | The Windows Filtering Platform has permitted an application or service to listen on a port for incoming connections (S) |
| Security	| Enabled		| [5155](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5155) | The Windows Filtering Platform has blocked an application or service from listening on a port for incoming connections (F) |
| Security	| Enabled		| [5156](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5156) | The Windows Filtering Platform has permitted a connection (S) |
| Security	| Enabled		| [5157](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5157) | The Windows Filtering Platform has blocked a connection (F) |
| Security	| Enabled		| [5158](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5158) | The Windows Filtering Platform has permitted a bind to a local port (S) |
| Security	| Enabled		| [5159](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5159) | The Windows Filtering Platform has blocked a bind to a local port (F) |
| Security	| Enabled		| [5168](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5168) | SPN check for SMB/SMB2 failed (F) |
| Security	| Enabled		| [5446](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-filtering-platform-policy-change) | A Windows Filtering Platform callout has been changed (S) |
| Security	| Enabled		| [5448](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-filtering-platform-policy-change) | A Windows Filtering Platform provider has been changed (S) |
| Security	| Enabled		| [5449](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-filtering-platform-policy-change) | A Windows Filtering Platform provider context has been changed (S) |
| Security	| Enabled		| [5450](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-filtering-platform-policy-change) | A Windows Filtering Platform sub-layer has been changed (S) |
| Microsoft-Windows-Bits-Client/Operational | Enabled | 3  | BITS created a task |
| Microsoft-Windows-Bits-Client/Operational | Enabled | 4  | BITS transfer completed |
| Microsoft-Windows-Bits-Client/Operational | Enabled | 59 | BITS transfer job started with URL [URL] |
| Microsoft-Windows-Bits-Client/Operational | Enabled | 60 | BITS transfer job stopped with URL [URL] |
| Microsoft-Windows-Dhcp-Client/Operational | Disabled | 50086 | IP conflict detection complete on interface [interface] for IP [IP] |
| Microsoft-Windows-Dhcpv6-Client/Operational | Disabled | * | -- |
| Microsoft-Windows-DNS-Client/Operational | Disabled | 3008 | DNS query complete |
| Microsoft-Windows-DNS-Client/Operational | Disabled | 3020 | DNS responce complete |
| Microsoft-Windows-NetworkProfile/Operational | Enabled | 10000 | Network connected to domain [domain] |
| Microsoft-Windows-SMBClient/Connectivity | Enabled | 30800 | The server name cannot be resolved |
| Microsoft-Windows-SMBClient/Connectivity | Enabled | 30803 | Failed to establish a network connection |
| Microsoft-Windows-SMBClient/Connectivity | Enabled | 30804 | A network connection was disconnected |
| Microsoft-Windows-SMBClient/Connectivity | Enabled | 30805 | The client lost its session to the server |
| Microsoft-Windows-SMBClient/Connectivity | Enabled | 30806 | The client re-established its session to the server |
| Microsoft-Windows-SMBClient/Operational | Enabled | 30622 | UNC/mapped drive successful connection |
| Microsoft-Windows-SMBClient/Operational | Enabled | 30624 | UNC/mapped drive successful connection |
| Microsoft-Windows-SMBClient/Security | Enabled | 31010 | A process has requested access to an object, but has not been granted those access rights |
| Microsoft-Windows-SMBClient/Security | Enabled | 31017 | Rejected an insecure guest logon |
| Microsoft-Windows-SMBClient/Security | Enabled | 31018 | Administrator has enabled insecure guest |
| Microsoft-Windows-SMBClient/Security | Enabled | 32000 | SMB1 negotiate responce received from a remote device when SMB1 cannot be negotiated by the local computer |
| Microsoft-Windows-SMBServer/Audit | Enabled | 3000 | Client attempt to use SMB1 |
| Microsoft-Windows-SMBServer/Operational | Enabled | 1001 | Client attempt to use SMB1 |
| Microsoft-Windows-SMBServer/Security | Enabled | 551  | SMB Session Authentication Failure |
| Microsoft-Windows-SMBServer/Security | Enabled | 1006 | Share access denied |
| Microsoft-Windows-Sysmon/Operational | -- | 3  | Network connection |
| Microsoft-Windows-Sysmon/Operational | -- | 22 | DNSEvent (DNS query) |
| Microsoft-Windows-Windows Firewall With Advanced Security/Firewall | Enabled | 2002 | A setting has changed |
| Microsoft-Windows-Windows Firewall With Advanced Security/Firewall | Enabled | 2003 | A setting has changed in profile [X] |
| Microsoft-Windows-Windows Firewall With Advanced Security/Firewall | Enabled | 2004 | A rule was added |
| Microsoft-Windows-Windows Firewall With Advanced Security/Firewall | Enabled | 2005 | A rule was modified |
| Microsoft-Windows-Windows Firewall With Advanced Security/Firewall | Enabled | 2006 | A rule was deleted |
| Microsoft-Windows-Windows Firewall With Advanced Security/Firewall | Enabled | 2009 | Failed to load Group Policy |
| Microsoft-Windows-Windows Firewall With Advanced Security/Firewall | Enabled | 2033 | All rules have been deleted |
| Microsoft-Windows-WinINet-Config/ProxyConfigChanged | Enabled | 5600 | Proxy configuration obtained [Proxy URL] |
| Microsoft-Windows-Winsock-WS2HELP/Operational | Enabled | 1 | Protocol entry added to Winsock catalog |
| Microsoft-Windows-Winsock-WS2HELP/Operational | Enabled | 2 | Protocol entry removed from Winsock catalog |
| Microsoft-Windows-Winsock-WS2HELP/Operational | Enabled | 3 | Protocol entry disabled from Winsock catalog |
| Microsoft-Windows-Winsock-WS2HELP/Operational | Enabled | 4 | Winsock catalog was reset |
| Microsoft-Windows-Wired-AutoConfig/Operational | Enabled | 15510 | A network adapter was added to the system |
| Microsoft-Windows-WLAN-AutoConfig/Operational | Enabled | 12011 | Wireless 802.1x authentication started |
| Microsoft-Windows-WLAN-AutoConfig/Operational | Enabled | 12012 | Wireless 802.1x authentication succeeded |
| Microsoft-Windows-WLAN-AutoConfig/Operational | Enabled | 20019 | A client has associated with the hosted network |
| Microsoft-Windows-WLAN-AutoConfig/Operational | Enabled | 20020 | A client has successfully authenticated with the hosted network |

### 11-Remote management
| Event Log | Default State | Event Code | Event Name |
| --------- | ------------- | ---------- | ---------- |
| OpenSSH/Operational | Enabled | 4 | sshd: [message] |
| Microsoft-Windows-RemoteDesktopServices-RdpCoreTS/Operational | Enabled | 104 | Client timezone is [h] hour from UTC |
| Microsoft-Windows-RemoteDesktopServices-RdpCoreTS/Operational | Enabled | 131 | The server accepted a new UDP/TCP connection from client [IP]:[PORT] |
| Microsoft-Windows-RemoteDesktopServices-RdpCoreTS/Operational | Enabled | 168 | The resolution requested by the client: Monitor 1: [X x Y] |
| Microsoft-Windows-RemoteDesktopServices-RdpCoreTS/Operational | Enabled | 169 | The client operating system type is (1, 3) > Server [SERVER] |
| Microsoft-Windows-TerminalServices-LocalSessionManager/Operational | Enabled | 21 | Session logon succeeded |
| Microsoft-Windows-TerminalServices-LocalSessionManager/Operational | Enabled | 22 | Shell start notification received |
| Microsoft-Windows-TerminalServices-LocalSessionManager/Operational | Enabled | 23 | Session logoff succeeded |
| Microsoft-Windows-TerminalServices-LocalSessionManager/Operational | Enabled | 24 | Session has been disconnected |
| Microsoft-Windows-TerminalServices-LocalSessionManager/Operational | Enabled | 25 | Session reconnection succeeded |
| Microsoft-Windows-TerminalServices-LocalSessionManager/Operational | Enabled | 39 | Session <A\> has been disconnected by session <B\> |
| Microsoft-Windows-TerminalServices-LocalSessionManager/Operational | Enabled | 40 | Session <A\> has been disconnected, reason code <B\> |
| Microsoft-Windows-TerminalServices-RemoteConnectionManager/Admin | Enabled | * | -- |
| Microsoft-Windows-TerminalServices-RemoteConnectionManager/Operational | Enabled | 1149  | User authentication succeeded |
| Microsoft-Windows-TerminalServices-RemoteConnectionManager/Operational | Enabled | 20503 | Shadow View session started |
| Microsoft-Windows-TerminalServices-RemoteConnectionManager/Operational | Enabled | 20504 | Shadow View session stopped |
| Microsoft-Windows-TerminalServices-RemoteConnectionManager/Operational | Enabled | 20508 | Shadow View permission granted |
| Microsoft-Windows-TerminalServices-RDPClient/Operational | Enabled | 1024 | Outbound TS Connect Attempt |
| Microsoft-Windows-TerminalServices-RDPClient/Operational | Enabled | 1029 | Base64(SHA1(UserName)) |
| Microsoft-Windows-TerminalServices-RDPClient/Operational | Enabled | 1102 | Outbound multi-transport Connect Attempt |
| Microsoft-Windows-Windows Remote Management/Operational | Enabled | 6   | Creating WSMan Session - Client |
| Microsoft-Windows-Windows Remote Management/Operational | Enabled | 91  | Creating WSMan Session - Server |
| Microsoft-Windows-Windows Remote Management/Operational | Enabled | 169 | User [user]: got authenticated using [auth] |

### 20-System activity
| Event Log | Default State | Event Code | Event Name |
| --------- | ------------- | ---------- | ---------- |
| Application | Enabled | 1    | Search indexing Service for [user] removed in responce to user profile deletion |
| Application | Enabled | 1511 | User logon with temporary profile |
| Application | Enabled | 1518 | Cannot create profile, using temporary profile |
| Security | Enabled | [1100](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-1100) | The event logging service has shut down (S) |
| Security | Enabled | 1101		   | Events has been dropped (-) |
| Security | Enabled | [1102](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-1102) | The audit log was cleared (S) |
| Security | Enabled | [1104](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-1104) | The security log is now full (S) |
| Security | Enabled | [1105](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-1105) | Event log automatic backup (S) |
| Security | Enabled | 1107		   | Event log service encountered an error from [publisher] (-) |
| Security | Enabled | [1108](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-1108) | The event logging service encountered an error while processing an incoming event published from %1 (S) |
| Security | Enabled | [4608](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4608) | Windows is starting up (S) |
| Security | Enabled | [4616](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4616) | The system time was changed (S) |
| Security | Enabled | [4621](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4621) | Administrator recovered system from CrashOnAuditFail (S) |
| Security | Enabled | [4739](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4739) | Domain Policy was changed (S) |
| Security | Enabled | [4826](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4826) | Boot Configuration Data loaded (S) |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-DistributedCOM']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-GroupPolicy']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-Kernel-Boot']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-Time-Service']` |
| System | Enabled | 1    | The system time was changed |
| System | Enabled | 6    | FS Filter Driver loaded |
| System | Enabled | 12   | The operating system started at system time [time] |
| System | Enabled | 13   | The operating system is shutting down at system time [time] |
| System | Enabled | 41   | The system has rebooted without cleaning shutting down first |
| System | Enabled | 104  | Evenl log [log] was cleared |
| System | Enabled | 109  | The kernel power manager has initiated a shutdown transition |
| System | Enabled | 1074 | [process] has initiated the restart of [host] on behalf of [user] for the following [reason] |
| System | Enabled | 1076 | Reason supplied by [user] for the last unexpected shutdown is: [reason] |
| System | Enabled | 6005 | Event log service was started |
| System | Enabled | 6006 | Event log service was stopped |
| System | Enabled | 6008 | Previous system shutdown was not planned |
| System | Enabled | 6013 | System uptime is [seconds] |
| Microsoft-Windows-DateTimeControlPanel/Operational | Enabled | 20000 | System was activated with the following setting [year, month, hour, minute] |
| Microsoft-Windows-EventCollector/Operational | Disabled | * | -- |
| Microsoft-Windows-Forwarding/Operational | Enabled | * | -- |
| Microsoft-Windows-GroupPolicy/Operational | Enabled | * | -- |
| Microsoft-Windows-Security-Audit-Configuration-Client/Operational | Enabled | * | -- |
| Microsoft-Windows-Shell-Core/Operational | Enabled | 9707 | Boot start: execution for [app -parameter] |
| Microsoft-Windows-Sysmon/Operational | -- | 19 | WmiEvent (WmiEventFilter activity detected) |
| Microsoft-Windows-Sysmon/Operational | -- | 20 | WmiEvent (WmiEventConsumer activity detected) |
| Microsoft-Windows-Sysmon/Operational | -- | 21 | WmiEvent (WmiEventConsumerToFilter activity detected) |
| Microsoft-Windows-Time-Service/Operational | Enabled | * | -- |
| Microsoft-Windows-WMI-Activity/Operational | Enabled | 5857 | Provider started |
| Microsoft-Windows-WMI-Activity/Operational | Enabled | 5858 | Provider error |
| Microsoft-Windows-WMI-Activity/Operational | Enabled | 5860 | Registration of Temporary Event Consumer |
| Microsoft-Windows-WMI-Activity/Operational | Enabled | 5861 | Registration of Permanent Event Consumer |

### 21-Software & Updates
| Event Log | Default State | Event Code | Event Name |
| --------- | ------------- | ---------- | ---------- |
| Application | Enabled | *  | `Provider[@Name='Microsoft-WindowsSoftwareRestrictionPolices']` |
| Application | Enabled | 1000  | Applicatio crash / error |
| Application | Enabled | 1001  | WER |
| Application | Enabled | 1002  | Application hang |
| Application | Enabled | 1022  | Product: [product] - Update '[update]' installed successfully |
| Application | Enabled | 1033  | Product: [product]. Version: [version]. Language: [language]. Manufacturer: [manufacturer]. Installation completed with status: [status]. |
| Application | Enabled | 1034  | Product: [product]. Version: [version]. Language: [language]. Manufacturer: [manufacturer]. Deletion completed with status: [status]. |
| Application | Enabled | 1036  | Product: [product]. Version: [version]. Language: [language]. Manufacturer: [manufacturer]. Update completed with status: [status]. |
| Application | Enabled | 1038  | Product: [product]. Version: [version]. Language: [language]. Manufacturer: [manufacturer]. Rebbot type [type] required with reason [reason]. |
| Application | Enabled | 11707 | Product [product] – Installation operation completed successfully |
| System | Enabled | 1001 | BSOD |
| OAlerts | Enabled | 300 | Microsoft Office Alert |
| Microsoft-Windows-Application-Experience/Program-Compatibility-Assistant | Enabled | 17 | Program Compatibility Assistant execution |
| Microsoft-Windows-Application-Experience/Program-Inventory | Enabled | 903 | Program installed on the system |
| Microsoft-Windows-Application-Experience/Program-Inventory | Enabled | 904 | Program installed on the system |
| Microsoft-Windows-Application-Experience/Program-Inventory | Enabled | 907 | Program removed from the system |
| Microsoft-Windows-Application-Experience/Program-Inventory | Enabled | 908 | Program removed from the system |
| Microsoft-Windows-Application-Experience/Program-Telemetry | Enabled | 500 | Compatibility fix applied to [app path] |
| Microsoft-Windows-AppLocker/EXE and DLL | Enabled | 8002 | [application] was allowed to run |
| Microsoft-Windows-AppLocker/EXE and DLL | Enabled | 8003 | [application] was prevented from running |
| Microsoft-Windows-AppLocker/EXE and DLL | Enabled | 8004 | [application] was not allowed to run |
| Microsoft-Windows-AppLocker/MSI and Script | Enabled | 8005 | [application] was allowed to run |
| Microsoft-Windows-AppLocker/MSI and Script | Enabled | 8006 | [application] was prevented from running |
| Microsoft-Windows-AppLocker/MSI and Script | Enabled | 8007 | [application] was not allowed to run |
| Microsoft-Windows-AppLocker/Packaged app-Execution | Enabled | 8020 | Packaged app allowed |
| Microsoft-Windows-AppLocker/Packaged app-Execution | Enabled | 8021 | Packaged app audited |
| Microsoft-Windows-AppLocker/Packaged app-Execution | Enabled | 8022 | Packaged app disabled |
| Microsoft-Windows-AppLocker/Packaged app-Deployment | Enabled | 8023 | Packaged app installation allowed |
| Microsoft-Windows-AppLocker/Packaged app-Deployment | Enabled | 8024 | Packaged app installation audited |
| Microsoft-Windows-AppLocker/Packaged app-Deployment | Enabled | 8025 | Packaged app installation disabled |
| Microsoft-Windows-AppModel-Runtime/Admin | Enabled | 201 | Process creation [ID] for [application] of [package]. Finish package activation |
| Microsoft-Windows-AppXDeployment/Operational | Enabled | 327 | The following [packages] will be installed. The following ones will be deleted [package] |
| Microsoft-Windows-AppXDeploymentServer/Operational | Enabled | 400 | [Operation] on [volume] for [package] from [source] finished |
| Microsoft-Windows-AppXDeploymentServer/Operational | Enabled | 401 | [Operation] on [volume] for [package] from [source] failed with [error] |
| Microsoft-Windows-AppXDeploymentServer/Operational | Enabled | 441 | Package deployement blocked by policy |
| Microsoft-Windows-AppXDeploymentServer/Operational | Enabled | 442 | Package deployement blocked by policy |
| Microsoft-Windows-AppXDeploymentServer/Operational | Enabled | 453 | Package deployement blocked by policy |
| Microsoft-Windows-AppXDeploymentServer/Operational | Enabled | 454 | Package deployement blocked by policy |
| Microsoft-Windows-AppXDeploymentServer/Operational | Enabled | 478 | Deployement registration on [volume] with [package] finished |
| Microsoft-Windows-AppXDeploymentServer/Operational | Enabled | 854 | Added URL to process: [x-windowsupdate: //] / [file path] ... |
| Microsoft-Windows-Shell-Core/AppDefaults | Enabled | 62443 | Association=[.pdf], ProgId=[App path], U=[User SID] |

### 22-Task & Service
| Event Log | Default State | Event Code | Event Name |
| --------- | ------------- | ---------- | ---------- |
| Security | Enabled | [4697](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4697) | A service was installed in the system (S) |
| Security | Enabled | [4698](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4698) | A scheduled task was created (S) |
| Security | Enabled | [4699](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4699) | A scheduled task was deleted (S) |
| Security | Enabled | [4700](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4700) | A scheduled task was enabled (S) |
| Security | Enabled | [4701](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4701) | A scheduled task was disabled (S) |
| Security | Enabled | [4702](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4702) | A scheduled task was updated (S) |
| System | Enabled | 7000 | EVENT_SERVICE_START_FAILED |
| System | Enabled | 7001 | EVENT_SERVICE_START_DEPENDENCY_FAILED |
| System | Enabled | 7009 | EVENT_CONNECTION_TIMEOUT |
| System | Enabled | 7011 | EVENT_TRANSACT_TIMEOUT |
| System | Enabled | 7016 | EVENT_BAD_SERVICE_STATE |
| System | Enabled | 7021 | EVENT_SEVERE_SERVICE_FAILED |
| System | Enabled | 7022 | EVENT_SERVICE_START_HUNG |
| System | Enabled | 7023 | EVENT_SERVICE_EXIT_FAILED |
| System | Enabled | 7024 | EVENT_SERVICE_EXIT_FAILED_SPECIFIC |
| System | Enabled | 7030 | EVENT_SERVICE_NOT_INTERACTIVE |
| System | Enabled | 7031 | EVENT_SERVICE_CRASH |
| System | Enabled | 7032 | EVENT_SERVICE_RECOVERY_FAILED |
| System | Enabled | 7034 | EVENT_SERVICE_CRASH_NO_ACTION |
| System | Enabled | 7035 | EVENT_SERICE_CONTROL_SUCCESS |
| System | Enabled | 7036 | EVENT_SERVICE_STATUS_SUCCESS |
| System | Enabled | 7037 | EVENT_SERVICE_CONFIG_BACKOUT_FAILED |
| System | Enabled | 7038 | EVENT_FIRST_LOGON_FAILED_II |
| System | Enabled | 7040 | EVENT_SERVICE_START_TYPE_CHANGED |
| System | Enabled | 7041 | EVENT_SERVICE_LOGON_TYPE_NOT_GRANTED |
| System | Enabled | 7042 | EVENT_SERVICE_STOP_SUCCESS_WITH_REASON |
| System | Enabled | 7043 | EVENT_SERVICE_STOP_FAILURE_PRESHUTDOWN |
| System | Enabled | 7045 | New service installed |
| Microsoft-Windows-TaskScheduler/Operational | Enabled | 106 | The user "[user]" registered the Task Scheduler task "[task]" |
| Microsoft-Windows-TaskScheduler/Operational | Enabled | 129 | Task Scheduler launched the "[instance]" instance of the "[task]" task with process ID [ID] |
| Microsoft-Windows-TaskScheduler/Operational | Enabled | 140 | User "[user]" updated Task Scheduler task "[task]" |
| Microsoft-Windows-TaskScheduler/Operational | Enabled | 141 | User "[user]" deleted Task Scheduler task "[task]" |
| Microsoft-Windows-TaskScheduler/Operational | Enabled | 142 | User "[user]" disabled Task Scheduler task "[task]" |
| Microsoft-Windows-TaskScheduler/Operational | Enabled | 200 | Task Scheduler launched the "[action]" action in the "[instance]" instance of task "[task]" |
| Microsoft-Windows-TaskScheduler/Operational | Enabled | 201 | Task Scheduler successfully completed task "[task]", instance "[instance]" , and action "[action]" |

### 23-User & Group management
| Event Log | Default State | Event Code | Event Name |
| --------- | ------------- | ---------- | ---------- |
| Security | Enabled | [4627](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4627) | Group membership information (S) |
| Security | Enabled | [4703](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4703) | A user right (privilege) was adjusted (S) |
| Security | Enabled | [4704](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4704) | A user right (privilege) was assigned (S) |
| Security | Enabled | [4705](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4705) | A user right (privilege) was removed (S) |
| Security | Enabled | [4717](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4717) | System security access was granted to an account (S) |
| Security | Enabled | [4718](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4718) | System security access was removed from an account (S) |
| Security | Enabled | [4720](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4720) | A user account was created (S) |
| Security | Enabled | [4722](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4722) | A user account was enabled (S) |
| Security | Enabled | [4723](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4723) | An attempt was made to change an account's password (S, F) |
| Security | Enabled | [4724](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4724) | An attempt was made to reset an account's password (S, F) |
| Security | Enabled | [4725](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4725) | A user account was disabled (S) |
| Security | Enabled | [4726](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4726) | A user account was deleted (S) |
| Security | Enabled | [4727](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-security-group-management) | A security-enabled global group was created (S) |
| Security | Enabled | [4728](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-security-group-management) | A member was added to a security-enabled global group (S) |
| Security | Enabled | [4729](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-security-group-management) | A member was removed from a security-enabled global group (S) |
| Security | Enabled | [4730](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-security-group-management) | A security-enabled global group was deleted (S) |
| Security | Enabled | [4731](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4731) | A security-enabled local group was created (S) |
| Security | Enabled | [4732](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4732) | A member was added to a security-enabled local group (S) |
| Security | Enabled | [4733](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4733) | A member was removed from a security-enabled local group (S) |
| Security | Enabled | [4734](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4734) | A security-enabled local group was deleted (S) |
| Security | Enabled | [4735](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4735) | A security-enabled local group was changed (S) |
| Security | Enabled | [4737](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-security-group-management) | A security-enabled global group was changed (S) |
| Security | Enabled | [4738](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4738) | A user account was changed (S) |
| Security | Enabled | [4740](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4740) | A user account was locked out (S) |
| Security | Enabled | [4741](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4741) | A computer account was created (S) |
| Security | Enabled | [4742](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4742) | A computer account was changed (S) |
| Security | Enabled | [4743](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4743) | A computer account was deleted (S) |
| Security | Enabled | [4744](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-distribution-group-management) | A security-disabled local group was created (S) |
| Security | Enabled | [4745](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-distribution-group-management) | A security-disabled local group was changed (S) |
| Security | Enabled | [4746](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-distribution-group-management) | A member was added to a security-disabled local group (S) |
| Security | Enabled | [4747](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-distribution-group-management) | A member was removed from a security-disabled local group (S) |
| Security | Enabled | [4748](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-distribution-group-management) | A security-disabled local group was deleted (S) |
| Security | Enabled | [4749](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4749) | A security-disabled global group was created (S) |
| Security | Enabled | [4750](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4750) | A security-disabled global group was changed (S) |
| Security | Enabled | [4751](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4751) | A member was added to a security-disabled global group (S) |
| Security | Enabled | [4752](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4752) | A member was removed from a security-disabled global group (S) |
| Security | Enabled | [4753](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4753) | A security-disabled global group was deleted (S) |
| Security | Enabled | [4754](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-security-group-management) | A security-enabled universal group was created (S) |
| Security | Enabled | [4755](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-security-group-management) | A security-enabled universal group was changed (S) |
| Security | Enabled | [4756](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-security-group-management) | A member was added to a security-enabled universal group (S) |
| Security | Enabled | [4757](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-security-group-management) | A member was removed from a security-enabled universal group (S) |
| Security | Enabled | [4758](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-security-group-management) | A security-enabled universal group was deleted (S) |
| Security | Enabled | [4759](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-distribution-group-management) | A security-disabled universal group was created (S) |
| Security | Enabled | [4760](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-distribution-group-management) | A security-disabled universal group was changed (S) |
| Security | Enabled | [4761](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-distribution-group-management) | A member was added to a security-disabled universal group (S) |
| Security | Enabled | [4762](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-distribution-group-management) | A member was removed from a security-disabled universal group (S) |
| Security | Enabled | [4763](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-distribution-group-management) | A security-disabled universal group was deleted (S) |
| Security | Enabled | [4767](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4767) | A user account was unlocked (S) |
| Security | Enabled | [4781](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4781) | The name of an account was changed (S) |
| Security | Enabled | [4782](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4782) | The password hash of an account was accessed (S) |
| Security | Enabled | [4793](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4793) | The Password Policy Checking API was called (S) |
| Security | Enabled | [4798](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4798) | A user's local group membership was enumerated (S) |
| Security | Enabled | [4799](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4799) | A security-enabled local group membership was enumerated (S) |

### 31-System security
| Event Log | Default State | Event Code | Event Name |
| --------- | ------------- | ---------- | ---------- |
| Application | Enabled | * | `Provider[@Name='EMET']` |
| Application | Enabled | 1 | Possible detection for [CVE] |
| Security | Enabled | [4610](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4610) | An authentication package has been loaded by the Local Security Authority (S) |
| Security | Enabled | [4611](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4611) | A trusted logon process has been registered with the Local Security Author (S) |
| Security | Enabled | [4614](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4614) | A notification package has been loaded by the Security Account Manager (S) |
| Security | Enabled | [4622](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4622) | A security package has been loaded by the Local Security Authority (S) |
| Security | Enabled | [4656](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4656) | A handle to an object was requested (S, F) |
| Security | Enabled | [4657](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4657) | A registry value was modified (S) |
| Security | Enabled | [4658](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4658) | The handle to an object was closed (S) |
| Security | Enabled | [4660](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4660) | An object was deleted (S) |
| Security | Enabled | [4661](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4661) | A handle to an object was requested (AD/SAM object) (S, F) |
| Security | Enabled | [4663](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4663) | An attempt was made to access an object (S) |
| Security | Enabled | [4664](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4664) | An attempt was made to create a hard link (S) |
| Security | Enabled | [4670](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4670) | Permissions on an object were changed (S) |
| Security | Enabled | [4673](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4673) | A privileged service was called (S, F) |
| Security | Enabled | [4674](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4674) | An operation was attempted on a privileged object (S, F) |
| Security | Enabled | [4688](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4688) | A new process has been created (S) |
| Security | Enabled | [4689](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4689) | A process has exited (S) |
| Security | Enabled | [4690](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4690) | An attempt was made to duplicate a handle to an object (S) |
| Security | Enabled | [4692](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4692) | Backup of data protection master key was attempted (S, F) |
| Security | Enabled | [4693](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4693) | Recovery of data protection master key was attempted (S, F) |
| Security | Enabled | [4694](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4694) | Protection of auditable protected data was attempted (S, F) |
| Security | Enabled | [4695](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4695) | Unprotection of auditable protected data was attempted (S, F) |
| Security | Enabled | [4696](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4696) | A primary token was assigned to process (S) |
| Security | Enabled | [4715](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4715) | The audit policy (SACL) on an object was changed (S) |
| Security | Enabled | [4719](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4719) | System audit policy was changed (S) |
| Security | Enabled | [4817](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4817) | Auditing settings on object were changed (S) |
| Security | Enabled | [4826](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4826) | Boot Configuration Data loaded (S) |
| Security | Enabled | [4902](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4902) | The Per-user audit policy table was created (S) |
| Security | Enabled | [4904](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4904) | An attempt was made to register a security event source (S) |
| Security | Enabled | [4905](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4905) | An attempt was made to unregister a security event source (S) |
| Security | Enabled | [4906](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4906) | The CrashOnAuditFail value has changed (S) |
| Security | Enabled | [4907](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4907) | Auditing settings on object were changed (S) |
| Security | Enabled | [4908](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4906) | Special Groups Logon table modified (S) |
| Security | Enabled | [4912](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4912) | Per User Audit Policy was changed (S) |
| Security | Enabled | [4985](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4985) | The state of a transaction has changed (S) |
| Security | Enabled | [5038](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5038) | Code integrity determined that the image hash of a file is not valid. The file could be corrupt due to unauthorized modification or the invalid hash could indicate a potential disk device error (F) |
| Security | Enabled | [5376](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5376) | Credential Manager credentials were backed up (S) |
| Security | Enabled | [5377](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5377) | Credential Manager credentials were restored from a backup (S) |
| Security | Enabled | 5379		   | Credential Manager credentials were read (S) |
| Security | Enabled | 5380		   | Vault Find Credentials (S) |
| Security | Enabled | 5381		   | Vault credentials were enumerated (S) |
| Security | Enabled | 5382		   | Vault credentials were read (S) |
| Security | Enabled | [5712](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5712) | A Remote Procedure Call (RPC) was attempted (S) |
| Security | Enabled | [6281](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-6281) | Code Integrity determined that the page hashes of an image file aren't valid. The file could be improperly signed without page hashes or corrupt due to unauthorized modification. The invalid hashes could indicate a potential disk device error (F) |
| Security | Enabled | [6410](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-6410) | Code integrity determined that a file does not meet the security requirements to load into a process (F) |
| Setup | Enabled | 2   | Package [KBx] was successfully changed to the installed state |
| Setup | Enabled | 4   | A reboot is necessary before package [KBx] can be changed to the installed state |
| Setup | Enabled | 7   | Initiating changes to turn on update [feature/update] on package Microsoft-Windows-Lxss-Optional |
| Setup | Enabled | 8   | Initiating changes to turn on update [feature/update] off package Microsoft-Windows-Lxss-Optional |
| Setup | Enabled | 9   | Selectable update [update] of package [package] was successfully turned on |
| Setup | Enabled | 10  | Selectable update [module/feature] was successfully turned off |
| Setup | Enabled | 13  | A reboot is necessary before the selectable update [update] of package [package] can be turned on |
| Setup | Enabled | 14  | A reboot is necessary before the selectable update [update] of package [package] can be turned off |
| Setup | Enabled | 109 | Hotpatching Failed |
| System | Enabled | 1     | Possible detection for [CVE] |
| System | Enabled | 11    | Custom dynamic link libraries are being loaded for every application |
| System | Enabled | 12    | LSA started as a protected process |
| System | Enabled | 19    | Installation successfull: [package] |
| System | Enabled | 20    | Installation failure |
| System | Enabled | 16962 | A remote call to the SAM database has been denied |
| System | Enabled | 16965 | Remote calls to the SAM database have been denied in the past 900 seconds throttling window |
| System | Enabled | 16968 | The following client would have been normally been denied access to the SAM database |
| System | Enabled | 16969 | Remote calls to the SAM database are being restricted using the default security descriptor (Win10 or >) |
| System | Enabled | 16963 | Remote calls to the SAM database are being restricted |
| System | Enabled | 16964 | The registry security descriptor is malformed: %1.%n Remote calls to the SAM database are being restricted |
| System | Enabled | 16966 | Audit only mode is now enabled for remote calls to the SAM database |
| System | Enabled | 16967 | Audit only mode is now disabled for remote calls to the SAM database |
| Microsoft-Windows-BitLocker/BitLocker Management | Enabled | * | -- |
| Microsoft-Windows-BitLocker/BitLocker Operational | Disabled | * | -- |
| Microsoft-Windows-CAPI2/Operational | Disabled | 11 | Certificate build chain |
| Microsoft-Windows-CAPI2/Operational | Disabled | 30 | Verify certificate chain policy |
| Microsoft-Windows-CAPI2/Operational | Disabled | 70 | Acquire certificate private key |
| Microsoft-Windows-CAPI2/Operational | Disabled | 81 | Verify certificat etrust |
| Microsoft-Windows-CAPI2/Operational | Disabled | 90 | X509 object |
| Microsoft-Windows-CertificateServicesClient-LifeCycle-User/Operational | Enabled | 1006 | A new certificate has been installed |
| Microsoft-Windows-CertificateServicesClient-LifeCycle-User/Operational | Enabled | 1007 | A certificate has been exported |
| Microsoft-Windows-CertificateServicesClient-LifeCycle-System/Operational | Enabled | 1001 | Certificate replaced |
| Microsoft-Windows-CertificateServicesClient-LifeCycle-System/Operational | Enabled | 1002 | Certificate expired |
| Microsoft-Windows-CertificateServicesClient-LifeCycle-System/Operational | Enabled | 1003 | Certificate close to expiration |
| Microsoft-Windows-CertificateServicesClient-LifeCycle-System/Operational | Enabled | 1004 | Certificate removed |
| Microsoft-Windows-CertificateServicesClient-LifeCycle-System/Operational | Enabled | 1006 | A new certificate has been installed |
| Microsoft-Windows-CertificateServicesClient-LifeCycle-System/Operational | Enabled | 1007 | A certificate has been exported |
| Microsoft-Windows-CodeIntegrity/Operational | Enabled | 3001 | Unsigned drivers loaded on the system |
| Microsoft-Windows-CodeIntegrity/Operational | Enabled | 3002 | Unable to verify the image integrity of the [FILE] because the set of per-page image hashes could not be found |
| Microsoft-Windows-CodeIntegrity/Operational | Enabled | 3003 | Unable to verify the image integrity of the [FILE] because ... The image is allowed to load because kernel mode debugger is attached |
| Microsoft-Windows-CodeIntegrity/Operational | Enabled | 3004 | Unable to verify the image integrity of the [FILE] because file hash could not be found |
| Microsoft-Windows-CodeIntegrity/Operational | Enabled | 3033 | Code integrity determined that [process] attempted to load [FILE] that did not meet the signing level requirements |
| Microsoft-Windows-CodeIntegrity/Operational | Enabled | 3063 | Code integrity determined that [process] attempted to load [FILE] that did not meet the signing level requirements |
| Microsoft-Windows-CodeIntegrity/Operational | Enabled | 3065 | Code integrity determined that [process] attempted to load [FILE] that did not meet the signing level requirements |
| Microsoft-Windows-CodeIntegrity/Operational | Enabled | 3066 | Code integrity determined that [process] attempted to load [FILE] that did not meet the signing level requirements |
| Microsoft-Windows-DeviceGuard/Operational | Enabled | * | -- |
| Microsoft-Windows-LSA/Operational | Disabled | * | -- |
| Microsoft-Windows-Security-Mitigations/KernelMode | Enabled | 12 | [process] was blocked from loading non Microsoft binary [DLL] |
| Microsoft-Windows-Security-Mitigations/UserMode | Enabled | * | -- |
| Microsoft-Windows-Sysmon/Operational | -- | 1   | Process creation |
| Microsoft-Windows-Sysmon/Operational | -- | 2   | A process changed a file creation time |
| Microsoft-Windows-Sysmon/Operational | -- | 4   | Sysmon service state changed |
| Microsoft-Windows-Sysmon/Operational | -- | 5   | Process terminated |
| Microsoft-Windows-Sysmon/Operational | -- | 6   | Driver loaded |
| Microsoft-Windows-Sysmon/Operational | -- | 7   | Image loaded |
| Microsoft-Windows-Sysmon/Operational | -- | 8   | CreateRemoteThread |
| Microsoft-Windows-Sysmon/Operational | -- | 9   | RawAccessRead |
| Microsoft-Windows-Sysmon/Operational | -- | 10  | ProcessAccess |
| Microsoft-Windows-Sysmon/Operational | -- | 11  | FileCreate |
| Microsoft-Windows-Sysmon/Operational | -- | 12  | RegistryEvent (Object create and delete) |
| Microsoft-Windows-Sysmon/Operational | -- | 13  | RegistryEvent (Value Set) |
| Microsoft-Windows-Sysmon/Operational | -- | 14  | RegistryEvent (Key and Value Rename) |
| Microsoft-Windows-Sysmon/Operational | -- | 15  | FileCreateStreamHash |
| Microsoft-Windows-Sysmon/Operational | -- | 16  | ServiceConfigurationChange |
| Microsoft-Windows-Sysmon/Operational | -- | 17  | PipeEvent (Pipe Created) |
| Microsoft-Windows-Sysmon/Operational | -- | 18  | PipeEvent (Pipe Connected) |
| Microsoft-Windows-Sysmon/Operational | -- | 23  | FileDelete (File Delete archived) |
| Microsoft-Windows-Sysmon/Operational | -- | 24  | ClipboardChange (New content in the clipboard) |
| Microsoft-Windows-Sysmon/Operational | -- | 25  | ProcessTampering (Process image change) |
| Microsoft-Windows-Sysmon/Operational | -- | 26  | FileDeleteDetected (File Delete logged) |
| Microsoft-Windows-Sysmon/Operational | -- | 27  | FileBlockExecutable |
| Microsoft-Windows-Sysmon/Operational | -- | 28  | FileBlockShredding |
| Microsoft-Windows-Sysmon/Operational | -- | 29  | FileExecutableDetected |
| Microsoft-Windows-Sysmon/Operational | -- | 255 | Error |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 1006 | Malware found |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 1007 | Malware action taken |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 1008 | Malware action taken failed |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 1009 | Item restored from quarantine |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 1013 | Malware history deletion |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 1014 | Malware history deletion |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 1116 | Threat detected (no action taken yet) |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 1117 | Threat detected (action taken with success) |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 1118 | Threat detected (action taken failed) |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 1119 | Threat detected (action taken critically failed) |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 1151 | Health report (inc. last update time) |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 3002 | Real time protection has encountered an error and failed |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 3007 | Real time protection recovered |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 5000 | Real time protection enabled |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 5001 | Real time protection disabled |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 5004 | Real time protection feature configured |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 5007 | Configuration changed (reports exclusions) |
| Microsoft-Windows-Windows Defender/Operational | Enabled | 5008 | Malware engine failure |
| Microsoft-Windows-Windows Defender/WHC | Enabled | * | -- |
| Microsoft-Windows-WindowsUpdateClient/Operational | Enabled | 20 | Installation failure |
| Microsoft-Windows-WindowsUpdateClient/Operational | Enabled | 24 | Update failed |
| Microsoft-Windows-WindowsUpdateClient/Operational | Enabled | 25 | Update failed |
| Microsoft-Windows-WindowsUpdateClient/Operational | Enabled | 31 | Update failed |
| Microsoft-Windows-WindowsUpdateClient/Operational | Enabled | 34 | Update failed |
| Microsoft-Windows-WindowsUpdateClient/Operational | Enabled | 35 | Update failed |
| Microsoft-Windows-WindowsUpdateClient/Operational | Enabled | 41 | An update was downloaded: <title, KB, GUID, revision\> |

### 32-Image & external device
| Event Log | Default State | Event Code | Event Name |
| --------- | ------------- | ---------- | ---------- |
| Security | Enabled | [6416](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-6416) | A new external device was recognized by the System (S) |
| Security | Enabled | [6419](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-6419) | A request was made to disable a device (S) |
| Security | Enabled | [6420](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-6420) | A device was disabled (S) |
| Security | Enabled | [6421](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-6421) | A request was made to enable a device (S) |
| Security | Enabled | [6422](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-6422) | A device was enabled (S) |
| Security | Enabled | [6423](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-6423) | The installation of this device is forbidden by system policy (S) |
| Security | Enabled | [6424](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-6424) | The installation of this device was allowed after having previously been forbidden by policy (S) |
| System | Enabled | 219 | Failed to load Kernel Driver [driver] |
| HardwareEvents | Enabled | * | -- |
| Microsoft-Windows-DriverFrameworks-UserMode/Operational | Disabled | 1003 | USB media connected |
| Microsoft-Windows-DriverFrameworks-UserMode/Operational | Disabled | 1008 | USB media disconnected |
| Microsoft-Windows-DriverFrameworks-UserMode/Operational | Disabled | 2004 | User-Mode drivers loaded |
| Microsoft-Windows-Kernel-PnP/Configuration | Enabled | 400 | Device [device] was configured |
| Microsoft-Windows-Kernel-PnP/Configuration | Enabled | 401 | Device [device] failed to be configured |
| Microsoft-Windows-Kernel-PnP/Configuration | Enabled | 410 | Device [device] was initiated |
| Microsoft-Windows-Partition/Diagnostic | Enabled | 1006 | Disk/device information |
| Microsoft-Windows-PrintService/Admin | Enabled | 354 | Failed to initialize [printer] from [DLL] |
| Microsoft-Windows-PrintService/Admin | Enabled | 808 | Printer spooler failed to load module [DLL] |
| Microsoft-Windows-PrintService/Admin | Enabled | 823 | Changing default printer to [printer] |
| Microsoft-Windows-PrintService/Operational | Disabled | 307 | Printer job |
| Microsoft-Windows-PrintService/Operational | Disabled | 848 | Printer share created |
| Microsoft-Windows-PrintService/Operational | Disabled | 849 | Printer share deleted |
| Microsoft-Windows-TerminalServices-ClientUSBDevices/Operational | Enabled | * | -- |
| Microsoft-Windows-TerminalServices-PnPDevices/Operational | Enabled | * | -- |
| Microsoft-Windows-TerminalServices-ServerUSBDevices/Operational | Enabled | * | -- |
| Microsoft-Windows-VHDMP-Operational | Enabled | 1  | The VHD [.iso, .vhd] has come online as disk number [n] |
| Microsoft-Windows-VHDMP-Operational | Enabled | 2  | The VHD [.iso, .vhd] has been removed as disk number [n] |
| Microsoft-Windows-VHDMP-Operational | Enabled | 12 | Handle for virtual disk [\*.iso] created successfully |

### 40-Powershell
| Event Log | Default State | Event Code | Event Name |
| --------- | ------------- | ---------- | ---------- |
| PowerShellCore/Operational | Enabled | 4103 | PowerShell execute block |
| PowerShellCore/Operational | Enabled | 4104 | Remote Command |
| PowerShellCore/Operational | Enabled | 4105 | Start Command |
| PowerShellCore/Operational | Enabled | 4106 | Stop Command |
| Windows PowerShell | Enabled | 400 | Engine state changed from None to Available |
| Windows PowerShell | Enabled | 403 | Engine state changed from Available to Stopped |
| Windows PowerShell | Enabled | 501 | Command executed |
| Windows PowerShell | Enabled | 600 | Provider [provider] is started |
| Windows PowerShell | Enabled | 800 | Pipeline execution details for command line: [command] |
| Microsoft-Windows-DSC/Operational | Enabled | * | -- |
| Microsoft-Windows-PowerShell/Operational | Enabled | 4103 | PowerShell execute block |
| Microsoft-Windows-PowerShell/Operational | Enabled | 4104 | Remote Command |
| Microsoft-Windows-PowerShell/Operational | Enabled | 4105 | Start Command |
| Microsoft-Windows-PowerShell/Operational | Enabled | 4106 | Stop Command |
| Microsoft-Windows-PowerShell-DesiredStateConfiguration-FileDownloadManager/Operational | Enabled | * | -- |

### 50-Authentication
| Event Log | Default State | Event Code | Event Name |
| --------- | ------------- | ---------- | ---------- |
| Security | Enabled | [4624](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4624) | An account was successfully logged on (S) |
| Security | Enabled | [4625](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4625) | An account failed to log on (F) |
| Security | Enabled | [4634](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4634) | An account was logged off (S) |
| Security | Enabled | [4648](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4648) | A logon was attempted using explicit credentials (S) |
| Security | Enabled | [4672](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4672) | Special privileges assigned to new logon (S) |
| Security | Enabled | [4774](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4774) | An account was mapped for logon (S, F) |
| Security | Enabled | [4775](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4775) | An account could not be mapped for logon (F) |
| Security | Enabled | [4776](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4776) | The computer attempted to validate the credentials for an account (S, F) |
| Security | Enabled | [4777](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4777) | The domain controller failed to validate the credentials for an account (F) |
| Security | Enabled | [4778](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4778) | A session was reconnected to a Window Station (S) |
| Security | Enabled | [4779](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4779) | A session was disconnected from a Window Station (S) |
| Security | Enabled | 4822		   | NTLM authentication failed because the account was a member of the Protected User group (-) |
| Security | Enabled | 4823		   | NTLM authentication failed because access control restrictions are required (-) |
| Security | Enabled | [4964](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4964) | Special groups have been assigned to a new logon (S) |
| Microsoft-Windows-AAD/Operational | Enabled | * | -- |
| Microsoft-Windows-Authentication/ProtectedUser-Client | Disabled | 104 | The security package on the client does not contain the credentials |
| Microsoft-Windows-Authentication/ProtectedUser-Client | Disabled | 304 | The security package does not store the Protected User's credentials |
| Microsoft-Windows-NTLM/Operational | Enabled | 8001 | NTLM client blocked audit: Audit outgoing NTLM authentication traffic that would be blocked |
| Microsoft-Windows-NTLM/Operational | Enabled | 8002 | NTLM traffic that would be blocked |
| Microsoft-Windows-NTLM/Operational | Enabled | 8003 | NTLM server blocked in the domain audit: Audit authentication in this domain |
| Microsoft-Windows-NTLM/Operational | Enabled | 8004 | Domain Controller blocked audit: Audit NTLM authentication to this Domain Controller |
| Microsoft-Windows-SmartCard-Audit/Authentication | Enabled | * | -- |

### Active Directory
| Event Log | Default State | Event Code | Event Name |
| --------- | ------------- | ---------- | ---------- |
| Application | Enabled | 325 | The database engine created a new database |
| Application | Enabled | 326 | The database engine attached a new database |
| Application | Enabled | 327 | The database engine detached a new database |
| Security | Enabled | [4649](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4649) | A replay attack was detected (S) |
| Security | Enabled | [4662](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4662) | An operation was performed on an object (S, F) |
| Security | Enabled | [4706](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4706) | A new trust was created to a domain (S) |
| Security | Enabled | [4707](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4707) | A trust to a domain was removed |
| Security | Enabled | [4713](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4713) | Kerberos Policy was changed (S) |
| Security | Enabled | [4716](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4716) | Trusted domain information was modified (S) |
| Security | Enabled | [4764](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4764) | A group’s type was changed (S) |
| Security | Enabled | [4765](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4765) | SID History was added to an account (S) |
| Security | Enabled | [4766](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4766) | An attempt to add SID History to an account failed (F) |
| Security | Enabled | [4768](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4768) | A Kerberos authentication ticket (TGT) was requested (S, F) |
| Security | Enabled | [4769](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4769) | A Kerberos service ticket was requested (S, F) |
| Security | Enabled | [4770](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4770) | A Kerberos service ticket was renewed (S) |
| Security | Enabled | [4771](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4771) | Kerberos pre-authentication failed (F) |
| Security | Enabled | [4772](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4772) | A Kerberos authentication ticket request failed (F) |
| Security | Enabled | [4773](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4773) | A Kerberos service ticket request failed (F) |
| Security | Enabled | [4780](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4780) | The ACL was set on accounts which are members of administrators groups (S) |
| Security | Enabled | [4794](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4794) | An attempt was made to set the DSRM administrator password (S, F) |
| Security | Enabled | 4820		   | A Kerberos Ticket-granting-ticket (TGT) was denied because the device does not meet the access control restrictions (-) |
| Security | Enabled | 4821		   | A Kerberos service ticket was denied because the user, device, or both does not meet the access control restrictions (-) |
| Security | Enabled | 4824		   | Kerberos pre-authentication by using DES or RC4 failed because the account was a member of the Protected User group (-) |
| Security | Enabled | [4864](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4864) | A namespace collision was detected (S) |
| Security | Enabled | [4865](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4865) | A trusted forest information entry was added (S) |
| Security | Enabled | [4866](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4866) | A trusted forest information entry was removed (S) |
| Security | Enabled | [4867](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4867) | A trusted forest information entry was modified (S) |
| Security | Enabled | [4928](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4928) | An Active Directory replica source naming context was established (S, F) |
| Security | Enabled | [4929](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4929) | An Active Directory replica source naming context was removed (S, F) |
| Security | Enabled | [4930](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4930) | An Active Directory replica source naming context was modified (S, F) |
| Security | Enabled | [4931](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4931) | An Active Directory replica destination naming context was modified (S, F) |
| Security | Enabled | [4932](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4932) | Synchronization of a replica of an Active Directory naming context has begun (S) |
| Security | Enabled | [4933](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4933) | Synchronization of a replica of an Active Directory naming context has ended (S, F) |
| Security | Enabled | [4934](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4934) | Attributes of an Active Directory object were replicated (S) |
| Security | Enabled | [4935](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4935) | Replication failure begins (F) |
| Security | Enabled | [4936](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4936) | Replication failure ends (S) |
| Security | Enabled | [4937](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-4937) | A lingering object was removed from a replica (S) |
| Security | Enabled | [5136](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5136) | A directory service object was modified (S) |
| Security | Enabled | [5137](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5137) | A directory service object was created (S) |
| Security | Enabled | [5138](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5138) | A directory service object was undeleted (S) |
| Security | Enabled | [5139](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5139) | A directory service object was moved (S) |
| Security | Enabled | [5141](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/event-5141) | A directory service object was deleted (S) |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-DirectoryServices-DSROLE-Server']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-Kerberos-Key-Distribution-Center']` |
| System | Enabled | 5805 | A machine account failed to authenticate |
| System | Enabled | 5827 | The Netlogon service denied a vulnerable Netlogon secure channel connection from a machine account |
| System | Enabled | 5828 | The Netlogon service denied a vulnerable Netlogon secure channel connection using a trust account |
| System | Enabled | 5829 | The Netlogon service allowed a vulnerable Netlogon secure channel connection |
| System | Enabled | 5830 | The Netlogon service allowed a vulnerable Netlogon secure channel connection because the machine account is allowed in the group policy |
| System | Enabled | 5831 | The Netlogon service allowed a vulnerable Netlogon secure channel connection because the trust account is allowed in the group policy |
| Directory Service | Enabled | 1138 | Function [func] entered |
| Directory Service | Enabled | 1174 | LDAP search with bad password |
| Directory Service | Enabled | 1644 | A client issued a search operation with the following options |
| Directory Service | Enabled | 2946 | Call successfully fetched the password of a gMSA account |
| Directory Service | Enabled | 2947 | Call failed to fetch the password of a gMSA account |
| DNS Server | Enabled | 150  | DNS Server could not load or initialize the plug-in DLL |
| DNS Server | Enabled | 770  | DNS Server plug-in DLL jas been loaded |
| DNS Server | Enabled | 6004 | DNS Server received a zone transfer request from [IP] for a non-existent or non-authoritative zone |
| Microsoft-Windows-Authentication/AuthenticationPolicyFailures-DomainController | Disabled | 101 | An NTLM sign-in failure occurs because access control restrictions are required, and those restrictions cannot be applied to NTLM |
| Microsoft-Windows-Authentication/AuthenticationPolicyFailures-DomainController | Disabled | 105 | A Kerberos restriction failure occurs because the authentication from a particular device was not permitted |
| Microsoft-Windows-Authentication/AuthenticationPolicyFailures-DomainController | Disabled | 106 | A Kerberos restriction failure occurs because the user or device was not allowed to authenticate to the server |
| Microsoft-Windows-Authentication/AuthenticationPolicyFailures-DomainController | Disabled | 305 | A potential Kerberos restriction failure might occur because the authentication from a particular device was not permitted |
| Microsoft-Windows-Authentication/AuthenticationPolicyFailures-DomainController | Disabled | 306 | A Kerberos restriction failure might occur because the user or device was not allowed to authenticate to the server |
| Microsoft-Windows-Authentication/ProtectedUserFailures-DomainController | Disabled | 100 | An NTLM sign-in failure occurs for an account that is in the Protected Users security group |
| Microsoft-Windows-Authentication/ProtectedUserFailures-DomainController | Disabled | 104 | DES or RC4 encryption types are used for Kerberos authentication and a sign-in failure occurs for a user in the Protected User security group |
| Microsoft-Windows-Authentication/ProtectedUserSuccesses-DomainController | Disabled | 303 | A Kerberos ticket-granting-ticket (TGT) was successfully issued for a member of the Protected User group |
| Microsoft-Windows-DNSServer/Audit | Enabled | 512-582 | -- |

### Server Roles
| Event Log | Default State | Event Code | Event Name |
| --------- | ------------- | ---------- | ---------- |
| Application | Enabled | * | `Provider[@Name='Docker']` |
| Application | Enabled | * | `Provider[@Name='Microsoft-Windows-CertificationAuthority']` |
| Application | Enabled | * | `Provider[@Name='Microsoft-Windows-NetworkDeviceEnrollmentService']` |
| Application | Enabled | * | `Provider[@Name='Microsoft-Windows-OnlineResponder']` |
| Application | Enabled | * | `Provider[@Name='Microsoft-Windows-OnlineResponderRevocationProvider']` |
| Application | Enabled | * | `Provider[@Name='Microsoft-Windows-OnlineResponderWebProxy']` |
| Application | Enabled | * | `Provider[@Name='MSExchange Autodiscover']` |
| Application | Enabled | * | `Provider[@Name='MSExchange Control Panel']` |
| Application | Enabled | * | `Provider[@Name='MSExchangeIS Mailbox Store']` |
| Application | Enabled | * | `Provider[@Name='MSSQLSERVER']` |
| Application | Enabled | * | `Provider[@Name='Windows Server Update Services']` |
| Security | Enabled | [4646](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-main-mode) | Security ID: %1 (S) |
| Security | Enabled | [4650](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-main-mode) | An IPsec Main Mode security association was established. Extended Mode was not enabled. Certificate authentication was not used (S) |
| Security | Enabled | [4651](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-main-mode) | An IPsec Main Mode security association was established. Extended Mode was not enabled. A certificate was used for authentication (S) |
| Security | Enabled | [4652](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-main-mode) | An IPsec Main Mode negotiation failed (F) |
| Security | Enabled | [4653](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-main-mode) | An IPsec Main Mode negotiation failed (F) |
| Security | Enabled | [4654](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor) | An IPsec Quick Mode negotiation failed (F) |
| Security | Enabled | [4655](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-main-mode) | An IPsec Main Mode security association ended (S) |
| Security | Enabled | [4665](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-application-generated) | An attempt was made to create an application client context (-) |
| Security | Enabled | [4666](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-application-generated) | An application attempted an operation (-) |
| Security | Enabled | [4667](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-application-generated) | An application client context was deleted (-) |
| Security | Enabled | [4668](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-application-generated) | An application was initialized (-) |
| Security | Enabled | [4868](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | The certificate manager denied a pending certificate request (-) |
| Security | Enabled | [4869](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services received a resubmitted certificate request (-) |
| Security | Enabled | [4870](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services revoked a certificate (-) |
| Security | Enabled | [4871](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services received a request to publish the certificate revocation list (CRL) (-) |
| Security | Enabled | [4872](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services published the certificate revocation list (CRL) (-) |
| Security | Enabled | [4873](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | A certificate request extension changed (-) |
| Security | Enabled | [4874](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | One or more certificate request attributes changed (-) |
| Security | Enabled | [4875](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services received a request to shut down (-) |
| Security | Enabled | [4876](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services backup started (-) |
| Security | Enabled | [4877](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services backup completed (-) |
| Security | Enabled | [4878](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services restore started (-) |
| Security | Enabled | [4879](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services restore completed (-) |
| Security | Enabled | [4880](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services started (-) |
| Security | Enabled | [4881](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services stopped (-) |
| Security | Enabled | [4882](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | The security permissions for Certificate Services changed (-) |
| Security | Enabled | [4883](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services retrieved an archived key (-) |
| Security | Enabled | [4884](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services imported a certificate into its database (-) |
| Security | Enabled | [4885](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | The audit filter for Certificate Services changed (-) |
| Security | Enabled | [4886](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services received a certificate request (-) |
| Security | Enabled | [4887](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services approved a certificate request and issued a certificate (-) |
| Security | Enabled | [4888](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services denied a certificate request (-) |
| Security | Enabled | [4889](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services set the status of a certificate request to pending (-) |
| Security | Enabled | [4890](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | The certificate manager settings for Certificate Services changed (-) |
| Security | Enabled | [4891](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | A configuration entry changed in Certificate Services (-) |
| Security | Enabled | [4892](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | A property of Certificate Services changed (-) |
| Security | Enabled | [4893](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services archived a key (-) |
| Security | Enabled | [4894](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services imported and archived a key (-) |
| Security | Enabled | [4895](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services published the CA certificate to Active Directory Domain Services (-) |
| Security | Enabled | [4896](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | One or more rows have been deleted from the certificate database (-) |
| Security | Enabled | [4897](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Role separation enabled (-) |
| Security | Enabled | [4898](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-certification-services) | Certificate Services loaded a template (-) |
| Security | Enabled | [4899](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/dn786423(v=ws.11)) | A Certificate Services template was updated (-) |
| Security | Enabled | [4900](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/dn786423(v=ws.11)) | Certificate Services template security was updated (-) |
| Security | Enabled | [4960](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-driver) | IPsec dropped an inbound packet that failed an integrity check (S) |
| Security | Enabled | [4961](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-driver) | IPsec dropped an inbound packet that failed a replay check (S) |
| Security | Enabled | [4962](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-driver) | IPsec dropped an inbound packet that failed a replay check (S) |
| Security | Enabled | [4963](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-driver) | IPsec dropped an inbound clear text packet that should have been secured (S) |
| Security | Enabled | [4965](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-driver) | IPsec received a packet from a remote computer with an incorrect Security Parameter Index (SPI) (S) |
| Security | Enabled | [4976](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-main-mode) | During Main Mode negotiation, IPsec received an invalid negotiation packet. If this problem persists, it could indicate a network issue or an attempt to modify or replay this negotiation (S) |
| Security | Enabled | [4977](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-quick-mode) | During Quick Mode negotiation, IPsec received an invalid negotiation packet (S) |
| Security | Enabled | [4978](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-extended-mode) | During Extended Mode negotiation, IPsec received an invalid negotiation packet (S) |
| Security | Enabled | [4979](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-extended-mode) | IPsec Main Mode and Extended Mode security associations were established (S) |
| Security | Enabled | [4980](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-extended-mode) | IPsec Main Mode and Extended Mode security associations were established (S) |
| Security | Enabled | [4981](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-extended-mode) | IPsec Main Mode and Extended Mode security associations were established (S) |
| Security | Enabled | [4982](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-extended-mode) | IPsec Main Mode and Extended Mode security associations were established (S) |
| Security | Enabled | [4983](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-extended-mode) | An IPsec Extended Mode negotiation failed. The corresponding Main Mode security association has been deleted (S) |
| Security | Enabled | [4984](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-extended-mode) | An IPsec Extended Mode negotiation failed. The corresponding Main Mode security association has been deleted (S) |
| Security | Enabled | [5049](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-main-mode) | An IPsec Security Association was deleted (S) |
| Security | Enabled | [5120](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor) | OCSP Responder Service Started (-) |
| Security | Enabled | [5121](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor) | OCSP Responder Service Stopped (-) |
| Security | Enabled | [5122](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor) | A Configuration entry changed in the OCSP Responder Service (-) |
| Security | Enabled | [5123](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor) | A configuration entry changed in the OCSP Responder Service (-) |
| Security | Enabled | [5124](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor) | A security setting was updated on OCSP Responder Service (-) |
| Security | Enabled | [5125](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor) | A request was submitted to OCSP Responder Service (-) |
| Security | Enabled | [5126](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor) | Signing Certificate was automatically updated by the OCSP Responder Service (-) |
| Security | Enabled | [5127](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor) | The OCSP Revocation Provider successfully updated the revocation information (-) |
| Security | Enabled | [5451](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-quick-mode) | An IPsec Quick Mode security association was established (S) |
| Security | Enabled | [5452](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-quick-mode) | An IPsec Quick Mode security association ended (S) |
| Security | Enabled | [5453](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-main-mode) | An IPsec negotiation with a remote computer failed because the IKE and AuthIP IPsec Keying Modules (IKEEXT) service is not started (S) |
| Security | Enabled | [5478](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-driver) | IPsec Services has started successfully (S) |
| Security | Enabled | [5479](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-driver) | IPsec Services has been shut down successfully (S) |
| Security | Enabled | [5480](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-driver) | IPsec Services failed to get the complete list of network interfaces on the computer (F) |
| Security | Enabled | [5483](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-driver) | IPsec Services failed to initialize RPC server. IPsec Services could not be started (F) |
| Security | Enabled | [5484](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-driver) | IPsec Services has experienced a critical failure and has been shut down (F) |
| Security | Enabled | [5485](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-ipsec-driver) | IPsec Services failed to process some IPsec filters on a plug-and-play event for network interfaces (F) |
| Security | Enabled | [6272](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-network-policy-server) | Network Policy Server granted access to a user (-) |
| Security | Enabled | [6273](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-network-policy-server) | Network Policy Server denied access to a user (-) |
| Security | Enabled | [6274](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-network-policy-server) | Network Policy Server discarded the request for a user (-) |
| Security | Enabled | [6275](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-network-policy-server) | Network Policy Server discarded the accounting request for a user (-) |
| Security | Enabled | [6276](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-network-policy-server) | Network Policy Server quarantined a user (-) |
| Security | Enabled | [6277](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-network-policy-server) | Network Policy Server granted access to a user but put it on probation because the host did not meet the defined health policy (-) |
| Security | Enabled | [6278](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-network-policy-server) | Network Policy Server granted full access to a user because the host met the defined health policy (-) |
| Security | Enabled | [6279](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-network-policy-server) | Network Policy Server locked the user account due to repeated failed authentication attempts (-) |
| Security | Enabled | [6280](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/audit-network-policy-server) | Network Policy Server unlocked the user account (-) |
| System | Enabled | * | `Provider[@Name='NPS']` |
| System | Enabled | * | `Provider[@Name='HRA']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-Dhcp-Server']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-HCAP']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-IIS-APPHOSTSVC']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-IIS-Configuration']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-IIS-FTP']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-IIS-Logging']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-IIS-W3SVC']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-IIS-W3SVC-WP']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-IIS-WMSVC']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-TerminalServices-Licensing']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-TerminalServices-RemoteConnectionManager']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-TerminalServices-SessionBroker-Client']` |
| System | Enabled | * | `Provider[@Name='Microsoft-Windows-W3LOGSVC']` |
| System | Enabled | 20063 |  |
| System | Enabled | 20088 |  |
| System | Enabled | 20103 |  |
| System | Enabled | 20106 |  |
| System | Enabled | 20249 |  |
| System | Enabled | 20250 |  |
| System | Enabled | 20252 |  |
| System | Enabled | 20253 |  |
| System | Enabled | 20255 |  |
| System | Enabled | 20258 |  |
| System | Enabled | 20266 |  |
| System | Enabled | 20271 |  |
| System | Enabled | 20272 |  |
| System | Enabled | 20274 |  |
| System | Enabled | 20275 |  |
| AD FS/Admin | Enabled | * | `Provider[@Name='AD FS']` |
| DhcpAdminEvents | Enabled | * | -- |
| DRS/Admin | Enabled | * | `Provider[@Name='Device Registration Service']` |
| Microsoft ATA | Enabled | * | -- |
| MSExchange Management | Enabled | 1 | Success command operation |
| MSExchange Management | Enabled | 6 | Failed command operation |
| Microsoft-IIS-Configuration/Administrative | Disabled | * | -- |
| Microsoft-IIS-Configuration/Operational | Disabled | 29 | Changes to [xxx] has successfully been committed (module) |
| Microsoft-IIS-Configuration/Operational | Disabled | 50 | Changes to [xxx] has successfully been committed (Webconfig) |
| Microsoft-Windows-Backup | Enabled | * | -- |
| Microsoft-Windows-Base-Filtering-Engine-Connections/Operational | Disabled | * | -- |
| Microsoft-Windows-Base-Filtering-Engine-Resource-Flows/Operational | Disabled | * | -- |
| Microsoft-Windows-Containers-Wcifs/Operational | Enabled | * | -- |
| Microsoft-Windows-Containers-Wcnfs/Operational | Enabled | * | -- |
| Microsoft-Windows-Dhcp-Server/FilterNotifications | Enabled | * | -- |
| Microsoft-Windows-Dhcp-Server/Operational | Enabled | * | -- |
| Microsoft-Windows-DhcpNap/Operational | Enabled | * | -- |
| Microsoft-Windows-EnrollmentPolicyWebService/Admin | Enabled | * | `Provider[@Name='Microsoft-Windows-EnrollmentPolicyWebService']` |
| Microsoft-Windows-EnrollmentWebService/Admin | Enabled | * | `Provider[@Name='Microsoft-Windows-EnrollmentWebService']` |
| Microsoft-Windows-FederationServices-Deployment/Operational | Enabled | * | -- |
| Microsoft-Windows-Hyper-V-Compute-Admin | Enabled | * | -- |
| Microsoft-Windows-Hyper-V-Compute-Operational | Enabled | * | -- |
| Microsoft-Windows-Iphlpsvc/Operational | Disabled | * | -- |
| Microsoft-Windows-RemoteApp and Desktop Connection Management/Operational | Enabled | * | -- |
| Microsoft-Windows-TerminalServices-Gateway/Operational | Enabled | * | -- |
| Microsoft-Windows-TerminalServices-Licensing/Operational | Enabled | * | -- |
| Microsoft-Windows-TerminalServices-SessionBroker/Operational | Enabled | * | -- |
| Microsoft-Windows-TerminalServices-SessionBroker-Client/Operational | Enabled | * | -- |
| Microsoft-Windows-WinNat/Oper | Disabled | * | -- |
