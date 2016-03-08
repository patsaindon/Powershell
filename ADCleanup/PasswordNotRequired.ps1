Import-Module activedirectory

$sourceOU = 'OU=Users,OU=azm,DC=siq,DC=local'

$emailFrom = "email@company.com"
$emailTo = "email@company.com"
$smtpServer = "mailserver.company.local"
$subject = "Comptes utilisateurs avec l'attribut Password Not Required"

$fileDate = (Get-Date).tostring("yyyyMMdd")
$filename = 'C:\Scripts\ADCleanup\' + $fileDate + '_PasswordNotRequired.csv'

Get-ADUser -Filter * -searchbase $sourceOU | Where-Object { $_.PasswordNotRequired -eq $True } | Select-Object Name,LastLogonDate,Samaccountname |Export-Csv $filename -NoTypeInformation -enc utf8

Send-MailMessage -To $emailTo -From $emailFrom -Subject $subject -Attachments $filename -SmtpServer $smtpServer

Get-ADUser -Filter * -searchbase $sourceOU -PR * | Where-Object {$_.Enabled -eq $True} | Set-ADUser -PasswordNotRequired:$false
