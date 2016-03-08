Import-Module ActiveDirectory

###############
## Variables ##
###############

$DaysInactive = 180
$time = (Get-Date).Adddays(-($DaysInactive))

$CSVFileLocation = 'C:\Scripts\ADCLeanup\Comptes_Ordinateurs_Non_Connectes_depuis_ 180_jours.csv' 

$emailFrom = "cous02@sqi.gouv.qc.ca"
$emailTo = "cous02@sqi.gouv.qc.ca"
$subject = "Comptes ordinateurs non connectes depuis 180 jours"
$smtpServer = "fermexcv01-pro.siq.local"

 
###################################################################
## Liste les vieux comptes ordinateurs non connectés depuis plus ##
## de 180 dans un CSV et l'envoi par courriel au responsable     ## 
###################################################################

Get-ADComputer -Properties * -Filter {LastLogonDate -lt $time} | Where-Object {$_.Name -ne $False} |
    Select-Object Name,LastLogonDate,OperatingSystem |
        Sort-Object OperatingSystem,Name |
            Export-CSV $CSVFileLocation -NoTypeInformation -enc utf8

############################################
## Assemble et envoi le courriel complété ##
############################################

Send-MailMessage -To $emailTo -From $emailFrom -Subject $subject -Attachments $CSVFileLocation -SmtpServer $smtpServer

########################
## Supprime le compte ##
########################

Get-ADComputer -Properties * -Filter {LastLogonDate -lt $time} | Where-Object {$_.Name -ne $False} |
    Remove-ADObject -Recursive -Confirm:$false

