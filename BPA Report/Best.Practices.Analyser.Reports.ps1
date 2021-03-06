﻿# Import Modules
#############################

Import-Module ServerManager
Import-Module BestPractices
Import-Module ActiveDirectory

#Remove old reports
#################################################

Remove-Item 'C:\Scripts\BPA Report\Reports\*.htm'

#Variables
########################################################################

$fileDate = (Get-Date).tostring("yyyyMMdd")
$HTMLPath = 'C:\Scripts\BPA Report\Reports\' + $fileDate + '_Report.htm'
$servername = (Get-WmiObject Win32_Computersystem).name

#Identify installed roles
########################################################
$ModelsToRun = @() 
 
if ((Get-WindowsFeature Application-Server).Installed) { 
$ModelsToRun += "Microsoft/Windows/ApplicationServer" 
} 
 
if ((Get-WindowsFeature AD-Certificate).Installed) { 
$ModelsToRun += "Microsoft/Windows/CertificateServices" 
} 
 
if ((Get-WindowsFeature DHCP).Installed) { 
$ModelsToRun += "Microsoft/Windows/DHCP" 
} 
 
if ((Get-WindowsFeature AD-Domain-Services).Installed) { 
$ModelsToRun += "Microsoft/Windows/DirectoryServices" 
} 
 
if ((Get-WindowsFeature DNS).Installed) { 
$ModelsToRun += "Microsoft/Windows/DNSServer" 
} 
 
if ((Get-WindowsFeature Hyper-V).Installed) { 
$ModelsToRun += "Microsoft/Windows/Hyper-V" 
} 
 
if ((Get-WindowsFeature NPAS).Installed) { 
$ModelsToRun += "Microsoft/Windows/NPAS" 
} 
 
if ((Get-WindowsFeature Remote-Desktop-Services).Installed) { 
$ModelsToRun += "Microsoft/Windows/TerminalServices" 
} 
 
if ((Get-WindowsFeature Web-Server).Installed) { 
$ModelsToRun += "Microsoft/Windows/WebServer" 
} 
 
if ((Get-WindowsFeature OOB-WSUS).Installed) { 
$ModelsToRun += "Microsoft/Windows/WSUS" 
} 
 
foreach ($BestPracticesModelId in $ModelsToRun) { 
 
#Path-variables
#####################################################################

$date = Get-Date -Format "dd-MM-yy_HH-mm" 
$BPAName = $BestPracticesModelId.Replace("Microsoft/Windows/","") 
$CSVPath = $CSVReportPath+$servername+"-"+$BPAName+"-"+$date+".csv" 
$HTMLPath = $HTMLReportPath+$servername+"-"+$BPAName+"-"+$date+".html" 

#HTML-header 
#####################################################################
$Head = " 
<title>BPA Report for $BestPracticesModelId on $servername</title> 
<style type='text/css'>  
   table  { border-collapse: collapse; width: 700px }  
   body   { font-family: Arial }  
   td, th { border-width: 2px; border-style: solid; text-align: left;  
padding: 2px 4px; border-color: black }  
   th     { background-color: grey }  
   td.Red { color: Red }  
</style>"  

# Get BPA Models
###########################################################################

Get-BPAModel -BestPracticesModelId $BestPracticesModelId | Invoke-BpaModel

# Get BPA Results
##################################################################################
 
Get-BpaResult -BestPracticesModelId $BestPracticesModelId | 
    Where-Object {$_.Severity -eq "Erreur" -or $_.Severity -eq “Avertissement" } |
        ConvertTo-Html -Property Severity,Category,Title,Problem,Impact,Resolution,Help -Title "BPA Report for $BestPracticesModelId on $servername" -Body "BPA Report for $BestPracticesModelId on server $servername <HR>" -Head $head | 
            Out-File -FilePath $HTMLPath 
}

# Prepare email
###################################################

$emailFrom = ""email@company.com"
$emailTo = "email@company.com"
$subject = "Best Practices Analyser Reports"
$smtpServer = "mailserver.company.com"
$files = @(get-childitem 'C:\Scripts\BPA Report\Reports\*.*')

Send-MailMessage -To $emailTo -From $emailFrom -Subject $subject -Attachment $files -SmtpServer $smtpServer
