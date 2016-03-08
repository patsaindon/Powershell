Import-Module ActiveDirectory

###############
## Variables ##
###############

$sourceOU = "OU=Users,OU=azm,DC=siq,DC=local"

$emailFrom = "psaindon85.consultant@sqi.gouv.qc.ca"
$emailTo = "psaindon85.consultant@sqi.gouv.qc.ca"
$subject = "Comptes Password Nerver Expires"
$smtpServer = "fermexcv01-pro.siq.local"

$fileDate = (Get-Date).tostring("yyyyMMdd")
$filename = 'C:\Scripts\ADCleanup\' + $fileDate + '_Comptes_Password_Nerver_Expires.csv'

Search-ADAccount –PasswordNeverExpires –SearchBase $sourceOU | Where-Object {$_.Enabled -eq $True} | Select-Object name, LastLogonDate, Samaccountname | export-csv $filename –noclobber -Encoding UTF8

############################################
## Assemble et envoi le courriel complété ##
############################################

Send-MailMessage -To $emailTo -From $emailFrom -Subject $subject -Attachments $filename -SmtpServer $smtpServer