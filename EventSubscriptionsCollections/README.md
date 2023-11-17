# Windows Event Subscriptions
Windows Event Forwarding or WEF is a subscription-based methodology to push events of interest to a Windows Event Collector. Subscriptions can be either source-initiated (push) or collector-initiated (pull). Subscriptions rely on subscriber clients to have logging and WinRM turned on locally for the subscription request.

## List of Subscriptions collections
- **[Event Categories Based Subscriptions](EventCategoriesBased/)**

## Editing:
Make any changes to the `EventCollectorSubscriptions.csv` configuration file. Ensure the following settings are observed:

- All specified channels are already configured.
- All queries paths lead to existing XML files.
- Subscription Type, Transport Name, Content Format fields are within allowed values.
- Allowed Source Domain Computers items exist in domain.

Bear in mind, that in some columns of `EventCollectorSubscriptions.csv` files, mainly `AllowedSourceDomainComputers`, `AllowedIssuerCAList` and `AllowedSubjectList`, you can specify several values separated by semicolon `;` symbol, e.g:

| ChannelName					| ... | AllowedSourceDomainComputers			| AllowedIssuerCAList 						| AllowedSubjectList						|
| ----------------------------- | --- | --------------------------------------- | ----------------------------------------- | ----------------------------------------- |
| WEC-Domain-Servers/Events		| ... | MSK-Domain-Members;SPB-Domain-Members	|											|											|
| WEC-NonDomain-Servers/Events	| ... |											| 073F4797D54776167C9199B2C36EAA01F1502C3F	| \*.security.contoso.com;\*.contoso.com	|

## Deployment:
Deploy event subscriptions with [`New-WECSubscriptions.ps1`](./New-WECSubscriptions.ps1) script:
```powershell
.\New-WECSubscriptions.ps1 -ConfigurationFilePath .\EventSubscriptionsCollections\...\EventCollectorSubscriptions.csv
```

## Windows Event Collector Utility 101
You can use Windows builtin utility `wecutil` to perform basic management of subscriptions.

Create a subscription or all the subscriptions:
```cmd
wecutil cs subscription.xml

C:\SubscriptionsDir> for /r %i in (*.xml) do wecutil cs %i
```

Delete a subscription or all the subscriptions:

**WARNING:** You're better off disabling the subscriptions first for server/eventvwr stability.
```cmd
wecutil ds SubscriptionID

C:\SubscriptionsDir> for /r %i in (*.xml) do wecutil ds %~ni
```

See XML details and subscribers:
```cmd
wecutil gs SubscriptionID
```
