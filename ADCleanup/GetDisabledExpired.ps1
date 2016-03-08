$date = Get-Date             
$now = $date.ToFileTime()            
$ou = "DC=siq,DC=local"            
                      
Search-ADAccount -AccountExpired | Format-Table Name, DistinguishedName, AccountExpirationDate -AutoSize | Out-File "C:\Scripts\ADCleanup\ComptesSuspendusDateExpiration.txt" -enc utf8            

##Assembles and sends completion email with DL information##
$emailFrom = "email@company.com"
$emailTo = "email@company.com"
$smtpServer = "mailserver.company.local"
$subject = "Rapports comptes utilisateurs avec date d'expiration"
$attachment1 = "C:\Scripts\ADCleanup\ComptesSuspendusDateExpiration.txt"


Send-MailMessage -To $emailTo -From $emailFrom -Subject $subject -Attachments $attachment1  -SmtpServer $smtpServer

Remove-Item "C:\Scripts\ADCleanup\ComptesSuspendusDateExpiration.txt"      
