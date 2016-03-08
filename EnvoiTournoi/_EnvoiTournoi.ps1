Import-Module .\Resize-Image.psm1 

##############################################################################
# Varriables
############################################################################## 

$Tournoi = (Get-Item .\Output\*.tou ).Basename
$Photos = ".\Temp\Photos"
$Temp = ".\Temp"
$Temp2 = ".\Temp\*"

############################################################################## 
# Rassembler les fichiers
############################################################################## 

md $Photos

copy '.\Output\*.tou' '.\Temp'
  
copy "Calcul des transferts.xls" ".\Temp"

############################################################################## 
# Redimensionner les photos
##############################################################################

Get-ChildItem ".\*.jpg" 

foreach ($file in Get-ChildItem)
{ 
    Resize-Image -inputfile "$file" -outputfile ".\Temp\Photos\$file" -scale 25
}

##############################################################################
#  Compresser les fichiers pour envoi
##############################################################################

if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) {throw "$env:ProgramFiles\7-Zip\7z.exe needed"}

set-alias sz "$env:ProgramFiles\7-Zip\7z.exe"

sz a -tzip "$Tournoi" "$Temp2"

##############################################################################
# Composer le message
##############################################################################

$Fichier = (Get-Item .\*.zip ).Name
$smtpClient = new-object system.net.mail.smtpClient 
$smtpClient.Host = 'smtp.gmail.com'
$smtpClient.Port = 587
$smtpClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("pat.saindon@gmail.com", "Unraid11!!");

$emailfrom = "email@xxxx.com"
$emailto = "email@xxxxxxxx.ca"
$subject = "Fichier du tournoi $Tournoi"
$body = "Bonjour Vincnent, voici les fichiers du tournoi $Tournoi"

##############################################################################
# Envoyer le message
##############################################################################

$emailMessage = New-Object System.Net.Mail.MailMessage
$emailMessage.From = $EmailFrom
$emailMessage.To.Add($EmailTo)
$emailMessage.Subject = $Subject
$emailMessage.Body = $Body
$emailMessage.Attachments.Add("$Fichier")
$SMTPClient.Send($emailMessage)

##############################################################################
# Faire le menage
##############################################################################

rm -r $Temp

##############################################################################
