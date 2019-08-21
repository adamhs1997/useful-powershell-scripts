# Script to get the uptime of this system

# Get the actual starttime of the system
$StartTime = Get-WmiObject Win32_OperatingSystem | Select-Object LastBootUpTime

# Get difference between now and the start date
$TimeDifference = (Get-Date) - 
    [System.Management.ManagementDateTimeConverter]::ToDateTime($StartTime.LastBootUpTime)

# Format prettily
"System Uptime: {0} days, {1} hours, {2} minutes, {3} seconds" `
    -f $TimeDifference.Days,$TimeDifference.Hours,
    $TimeDifference.Minutes,$TimeDifference.Seconds
