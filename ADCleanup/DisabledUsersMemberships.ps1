Import-Module ActiveDirectory

###############
## Variables ##
###############

#$sourceOU = "OU=SIQ - Comptes suspendus,OU=Users,OU=azm,DC=siq,DC=local"
$sourceOU = "OU=Users groupes et comptes  par région,OU=Users,DC=siq,DC=local"
$nOU = "OU=Voute,OU=Users,DC=siq,DC=local"
$DaysInactive = 365 
$time = (Get-Date).Adddays(-($DaysInactive))

$emailFrom = "email@company.com"
$emailTo = "email@company.com"
$smtpServer = "mailserver.company.local"
$subject = "Memberships des comptes suspendus depuis 365 jours"

$fileDate = (Get-Date).tostring("yyyyMMdd")
$filename = 'C:\Scripts\ADCleanup\' + $fileDate + '_Memberships_Comptes_Suspendus.csv'

#########################################################################
## Recupère l'appartenance à des groupes des comptes suspendus depuis  ##
## plus de 1 an dans un CSV et l'envoi par courriel au responsable     ## 
#########################################################################

Get-Aduser -Filter { LastLogonTimeStamp -lt $time } -searchbase $sourceOU -properties * |
    Where-Object {$_.Enabled -eq $False} |
        Select-Object LastLogonDate,name,samaccountname,emailaddress,office,@{n=’MemberOf’; e= { ( $_.memberof | % { (Get-ADObject $_).Name }) -join “,” }} | 
            Export-Csv $filename -NoTypeInformation -enc utf8

############################################
## Assemble et envoi le courriel complété ##
############################################

Send-MailMessage -To $emailTo -From $emailFrom -Subject $subject -Attachments $filename -SmtpServer $smtpServer

##############################
## Supprime le fichier créé ##
##############################

Remove-Item $filename

####################################################################################
# Supprime l'appartenance à des groupes des comptes suspendus depuis plus de 1 an  #
####################################################################################

Get-Aduser -Filter { LastLogonTimeStamp -lt $time } -searchbase $sourceOU -properties * |
    Where-Object {$_.Enabled -eq $False} |
        Remove-ADGroupMember -Member $user -Confirm:$false |
            Move-ADObject $user -TargetPath $nOU -verbose -WhatIf
