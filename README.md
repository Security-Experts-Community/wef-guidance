# Windows Event Collector Guidance
```
	██╗    ██╗███████╗███████╗     ██████╗ ██╗   ██╗██╗██████╗  █████╗ ███╗   ██╗ ██████╗███████╗
	██║    ██║██╔════╝██╔════╝    ██╔════╝ ██║   ██║██║██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝
	██║ █╗ ██║█████╗  █████╗      ██║  ███╗██║   ██║██║██║  ██║███████║██╔██╗ ██║██║     █████╗  
	██║███╗██║██╔══╝  ██╔══╝      ██║   ██║██║   ██║██║██║  ██║██╔══██║██║╚██╗██║██║     ██╔══╝  
	╚███╔███╔╝███████╗██║         ╚██████╔╝╚██████╔╝██║██████╔╝██║  ██║██║ ╚████║╚██████╗███████╗
	 ╚══╝╚══╝ ╚══════╝╚═╝          ╚═════╝  ╚═════╝ ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝
```
## About This Repository
### Windows Event Forwarding Limitations
Windows Event Forwarding (WEF) has proved to be a powerful and reliable log forwarding solution since it was introdused with Microsoft Vista. And, as it is integrated within all modern versions of Microsoft Windows, it becomes an easy choice, when it comes to centralized collection of Windows system and security events. But, as stated in \[[1](https://learn.microsoft.com/en-us/windows/security/threat-protection/use-windows-event-forwarding-to-assist-in-intrusion-detection#what-are-the-wec-servers-limitations)\] and \[[2](https://learn.microsoft.com/en-us/troubleshoot/windows-server/admin-development/configure-eventlog-forwarding-performance#limitation-and-system-requirement)\], that choice comes with several limitations, mainly being:

- In large environments you are expected to deploy several collectors with 2,000 to not more than 4,000 clients per each. By default WEF does not provide any builtin solution to balance the load over all collectors, so typically it falls to you to implement such solution yourself.
- Each unique device, connected to any subscription, gets its own registry key to store bookmark and source heartbeat information, as an event source. Those keys are not removed automatically, when the device stops being an active event source, so you are expected to review and remove them yourself to negate potential performance issues in the future.
- All events, received from all event sources, are logged to a single local event log file on the collector's side. No logs segregation solution is available by default for remote events storage. To get such segregation, better performance, retention, sorting, etc. you are given the ability to deploy custom event channels, which you would need to prepare first, using Windows SDK.

### This Repository Features
From previous section rises the main purpose of this project: to attempt to solve limitations mentioned and provide the community with configurable tools, that require minimal adjustments before being deployed to various environments.
The main features of this project are as follows:

- Predefined, ready to deploy custom event channels, allowing for better organising and segregation of event log files.
- Predefined, ready to deploy event subscriptions, divided into several categories for better visibility and analysis.
- Generation of own custom event channels manifest to use with Windows SDK.
- Automatic generation, configuration and deployment of custom event channels and subscriptions.
- Automatic synchronization of domain security groups with domain organizational units.
- Automatic removal of registry keys, belonging to inactive domain event sources.

## Repository Layout
This repository is organized as follows:
```
.
├── DSG.json
├── New-WECManifest.ps1
├── New-WECSubscriptions.ps1
├── OptionalScripts.md
├── README.md
├── Remove-StaleWECSubscribers.ps1
├── Set-DSGMembership.ps1
├── Set-WECEventChannels.ps1
├── EventChannelsCollections
│   ├── README.md
│   └── <Event Channels Collection>
│       ├── EventCollectorChannels.csv
│       ├── EventCollectorChannels.dll
│       ├── EventCollectorChannels.man
│       └── README.md
├── EventSubscriptionsCollections
│   ├── README.md
│   └── <Event Subscriptions Collection>
│       ├── [Query] ....xml
│       ├── ...
│       ├── [Query] ....xml
│       ├── EventCollectorSubscriptions.csv
│       └── README.md
└── GroupPolicyObjects
    ├── README.md
    ├── Windows Event Collector.md
    └── Windows Event Forwarding.md
```

- [`./GroupPolicyObjects`](/GroupPolicyObjects) -- some GPO recommendations
- [`./EventChannelsCollections/`](/EventChannelsCollections) -- collections of predefined custom event channels manifest and DLL files
- [`./EventSubscriptionsCollections/`](/EventSubscriptionsCollections) -- collections of XML files with xPath queries for subscriptions
- [`./DSG.json`](DSG.json) -- input data for the [`./Set-DSGMembership.ps1`](Set-DSGMembership.ps1) script
- [`./New-WECManifest.ps1`](New-WECManifest.ps1) -- main script for generation of custom event channels manifest file
- [`./Set-WECEventChannels.ps1`](Set-WECEventChannels.ps1) -- main script for generation, configuration and deployment of custom event channels
- [`./New-WECSubscriptions.ps1`](New-WECSubscriptions.ps1) -- main script for generation, configuration and deployment of custom event subscriptions
- [`./Remove-StaleWECSubscribers.ps1`](Remove-StaleWECSubscribers.ps1) -- optional script for automatic removal of registry keys, belonging to inactive domain event sources
- [`./Set-DSGMembership.ps1`](Set-DSGMembership.ps1) -- optional script for automatic synchronization of managed security groups with current state of associated organizational units

### Using This Repository
**Note**: Make sure to thoroughly test all configurations, scripts, subscriptions, etc. in a lab environment before deploying any of them to a production environment.

1. Deploy at least minimum required audit and WEF policies to your environment (see [Microsoft documentation](https://learn.microsoft.com/en-us/windows/security/threat-protection/use-windows-event-forwarding-to-assist-in-intrusion-detection)).
2. Make required adjustments to chosen cannels and subscriptions configuration files (see [Configuration](#configuration) section below).
3. Make sure that required domain security groups for target WEC server(s) to accept as its subscribers exist in domain.
4. Deploy custom event channels to the target WEC server(s) (see [EventChannelsCollections](EventChannelsCollections/) subdirectory).
5. Deploy custom event subscriptions to the target WEC server(s) (see [EventSubscriptionsCollections](EventSubscriptionsCollections/) subdirectory).
6. (Optional) Deploy scheduled task to run [`Remove-StaleWECSubscribers.ps1`](Remove-StaleWECSubscribers.ps1) script to the target WEC server(s) (see [Optional Scripts](OptionalScripts.md)).
7. (Optional) Deploy scheduled task to run [`Set-DSGMembership.ps1`](Set-DSGMembership.ps1) script to the target WEC server(s) (see [Optional Scripts](OptionalScripts.md)).

## Configuration
There are 3 types of configuration files, provided with this repository:

- **Custom event channels configuration files**: Configuration files, that define layout of custom event channels, intended to store events from subscriptions clients. Those files are provided with each custom channels collection within [EventChannelsCollections](EventChannelsCollections/) subdirectory and typically have a name: `EventCollectorChannels.csv`. You can find out more information about each collection and a layout, that it implements, by looking into that collection's directory. Refer to [these](EventChannelsCollections/) instructions, if you want to edit any of them or create your own.
- **Custom event subscriptions configuration files**: Configuration files, that define data, related to configuring and deploying event subscriptions. Those files are provided with each custom subscriptions collection within [EventSubscriptionsCollections](EventSubscriptionsCollections/) subdirectory and typically have a name: `EventCollectorSubscriptions.csv`. You can find out more information about each collection and subscriptions, that it sets up, by looking into that collection's directory. Refer to [these](EventSubscriptionsCollections/) instructions, if you want to edit any of them or create your own.
- **Security groups and OUs synchronization configuration file**: Configuration file, that define which security groups are going to be associated with which organizational units based on which LDAP filter. It works as an input to [`Set-DSGMembership.ps1`](Remove-StaleWECSubscribers.ps1) script and nothing else. Only one such configuration file is provided with this repository, being [`DSG.json`](DSG.json). That file's content is very specific to every environment it can be deployed to. So make sure to put only suitable for your environment data into that file. Also, consider to protect it from unauthorised access, as every time script [`Set-DSGMembership.ps1`](Remove-StaleWECSubscribers.ps1) runs, it uses this configuration file as an input.

**Note**: Before running any script, make sure that chosen configuration files contain correct up-to-date information.

For more information, see Microsoft documentation \[[1](https://learn.microsoft.com/en-us/windows/win32/wes/using-windows-event-log)\], \[[2](https://learn.microsoft.com/en-us/windows/win32/wec/using-windows-event-collector)\].

## Contributing
Contributions, fixes, and improvements can be submitted directly against this project as a GitHub issue or pull request. When contributing an update to CustomEventChannels.man, please do not include the compiled .DLL for security reasons. Once your pull request has been merged, we will compile the updated manifest into a DLL and add it to the repository.

## References and Acknowledgements
Many open source publications were referenced for the development of this project, and we wish to acknowledge those who have contributed to this effort.
### Recommended Windows audit polices:
- [Use Windows Event Forwarding to help with intrusion detection](https://learn.microsoft.com/en-us/windows/security/threat-protection/use-windows-event-forwarding-to-assist-in-intrusion-detection)
- [Microsoft Audit Policy Recommendations](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/plan/security-best-practices/audit-policy-recommendations)
- [NSA Cybersecurity Directorate Event Forwarding Guidance](https://github.com/nsacyber/Event-Forwarding-Guidance/tree/master/Events)
- [ACSC Windows Event Logging and Forwarding](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-monitoring/windows-event-logging-and-forwarding)
- [Malware Archaeology Cheat Sheets](https://www.malwarearchaeology.com/cheat-sheets)
- [Microsoft-eventlog-mindmap](https://github.com/mdecrevoisier/Microsoft-eventlog-mindmap)
- [Sysmon - DFIR](https://github.com/MHaggis/sysmon-dfir)

### Other similar projects:
- [Project Sauron](https://github.com/russelltomkins/Project-Sauron)
- [Palantir's Windows Event Forwarding Guidance](https://github.com/palantir/windows-event-forwarding)
- [WEC Pepped](https://github.com/ElasticSA/wec_pepped)
- [Andreas Bellstedt WindowsEventForwarding PS package](https://www.powershellgallery.com/packages/WindowsEventForwarding/)
