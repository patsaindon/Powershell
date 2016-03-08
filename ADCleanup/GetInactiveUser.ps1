# Gets time stamps for all User in the domain that have NOT logged in since after specified date
# Mod by Tilo 2013-08-27
import-module activedirectory 
$domain = "domain.siq.local" 
$DaysInactive = 180 
$time = (Get-Date).Adddays(-($DaysInactive))
 
# Get all AD User with lastLogonTimestamp less than our time and set to enable
Get-ADUser -Filter {LastLogonTimeStamp -lt $time -and enabled -eq $true} -Properties LastLogonTimeStamp |
 
# Output Name and lastLogonTimestamp into CSV
select-object Name,@{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp)}} | export-csv C:\Scripts\ADCleanup\OLD_User.csv -notypeinformation