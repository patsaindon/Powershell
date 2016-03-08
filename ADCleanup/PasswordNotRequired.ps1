Import-Module activedirectory

$sourceOU = 'OU=Users,OU=azm,DC=siq,DC=local'

$emailFrom = "cous02@sqi.gouv.qc.ca"
$emailTo = "cous02@sqi.gouv.qc.ca"
$subject = "Comptes utilisateurs avec l'attribut Password Not Required"
$smtpServer = "fermexcv01-pro.siq.local"

$fileDate = (Get-Date).tostring("yyyyMMdd")
$filename = 'C:\Scripts\ADCleanup\' + $fileDate + '_PasswordNotRequired.csv'

Get-ADUser -Filter * -searchbase $sourceOU | Where-Object { $_.PasswordNotRequired -eq $True } | Select-Object Name,LastLogonDate,Samaccountname |Export-Csv $filename -NoTypeInformation -enc utf8

Send-MailMessage -To $emailTo -From $emailFrom -Subject $subject -Attachments $filename -SmtpServer $smtpServer

Get-ADUser -Filter * -searchbase $sourceOU -PR * | Where-Object {$_.Enabled -eq $True} | Set-ADUser -PasswordNotRequired:$false