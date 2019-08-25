# This app should be able to be changed once I actually have a program to run
$app = '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]

[xml]$ToastTemplate = ([Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($Template).GetXml())

# This XML actually defines the body of the toast
# Can find at https://docs.microsoft.com/en-us/previous-versions/windows/apps/hh761494(v=win.10)
[xml]$ToastTemplate = @"
<toast>
    <visual>
        <binding template="ToastText01">
            <text id="1">Hello Toast!</text>
        </binding>  
    </visual>
</toast>
"@

# Actually load the XML above into a Windows displayable document
$ToastXml = New-Object -TypeName Windows.Data.Xml.Dom.XmlDocument
$ToastXml.LoadXml($ToastTemplate.OuterXml)

# Show the toast
$notify = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($app)
$notify.Show($ToastXml)