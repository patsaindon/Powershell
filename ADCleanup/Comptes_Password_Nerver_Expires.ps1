Import-Module ActiveDirectory

###############
## Variables ##
###############

$sourceOU = "OU=Users,DC=company,DC=local"

$emailFrom = "email@company.com"
$emailTo = "email@company.com"
$subject = "Comptes Password Nerver Expires"
$smtpServer = "mailserver.company.local"

$fileDate = (Get-Date).tostring("yyyyMMdd")
$filename = 'C:\Scripts\ADCleanup\' + $fileDate + '_Comptes_Password_Nerver_Expires.csv'

Search-ADAccount –PasswordNeverExpires –SearchBase $sourceOU | Where-Object {$_.Enabled -eq $True} | Select-Object name, LastLogonDate, Samaccountname | export-csv $filename –noclobber -Encoding UTF8

############################################
## Assemble et envoi le courriel complété ##
############################################

Send-MailMessage -To $emailTo -From $emailFrom -Subject $subject -Attachments $filename -SmtpServer $smtpServer
