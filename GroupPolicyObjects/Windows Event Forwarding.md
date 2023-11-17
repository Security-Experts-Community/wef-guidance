# Windows Event Forwarding

**Description**: This policy enables the Event Forwarding mechanism. It is applied to all domain members, which should forward their events to the specified collector server, and will configure the following settings:

- Appropriate Event Log Readers group membership for WEF.
- Appropriate Security log access for WEF.
- Target Subscription Manager (Event Collector).
- Forwarding rate and Refresh interval for WEF.

**Where to Link**: Domain Clients / Member Servers / Domain Controllers OUs. Choose depending on number and placement of Event Collector servers in your environment.

**WMI Filter**: None.

## Configuration

Set the following setting `Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Restricted Groups` to:

- **BUILTIN\Event Log Readers**: NT AUTHORITY\NETWORK SERVICE

**Note**: Add to **BUILTIN\Event Log Readers** other groups/users, that should have remote access to local logs.

&nbsp;

Set the following setting `Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security -> Configure log access` to:

- **Log Access**: O:BAG:SYD:(A;;0xf0005;;;SY)(A;;0x5;;;BA)(A;;0x1;;;S-1-5-32-573)(A;;0x1;;;S-1-5-20)

&nbsp;

Set the following setting `Computer Configuration -> Administrative Templates -> Windows Components -> Event Forwarding -> Configure forwarder resource usage` to:

- **The maximum forwarding rate ( events/sec ) allowed for the forwarder**: [X]

**Note**: **X** is a number of events/per second sent to the Event Collector per each event source. Value too low would make the collector to fall behind it's event sources, value too high would make the collector's event log to overflood and erase previos events, before you can analyze them or collect them to your SIEM. You should test this setting in your environment and choose the value, that works for you.

&nbsp;

Set the following setting `Computer Configuration -> Administrative Templates -> Windows Components -> Event Forwarding -> Configure target Subscription Manager` to:

- **SubscriptionManagers**: Server=[proto]://[server]:[port]/wsman/SubscriptionManager/WEC,Refresh=[ref]

**Note**:

- **proto**: http / https.
- **server**: target event collector's FQDN.
- **port**: 5985 / 5986.
- **ref**: indicates how frequently the client connects to the /WEC URL to enumerate the available subscriptions.
