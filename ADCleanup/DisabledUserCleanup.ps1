Import-Module activedirectory 
 
$oldDate = [DateTime]::Today.AddDays(-30) 
$warnDate = [DateTime]::Today.AddDays(-23) 
$AMSearchBase = "DC=siq,DC=local" 

$delUsers = @() 
$warnUsers = @() 
$wlistUsers = @() 
$30daysUsers = @() 
 
$disabledUsers = Get-ADUser -filter {(Enabled -eq $False)} -Properties Name,SID,Enabled,LastLogonDate,Modified,info,description 
 
foreach ($name in $disabledUsers) { 
    if ($name.info -ne "WHITELIST" -and $name.modified -le $oldDate) { 
        #Remove-ADUser -id $name.SID -confirm:$false 
        $delUsers = $delUsers + $name 
        } 
    elseif ($name.info -eq "WHITELIST") { 
        Write-Host $name.name " en liste blanche" 
        $wlistUsers = $wlistUsers + $name 
        } 
        elseif ($name.info -ne "WHITELIST"-and $name.modified -le $warnDate) { 
        Write-Host $name.name "  supprimé la semaine prochaine" 
        $warnUsers = $warnUsers + $name 
        } 
    else { 
        Write-Host $name.name " modifié au cours des 30 derniers jours" 
        $30daysUsers = $30daysUsers + $name 
        } 
} 
 
$report = "C:\Scripts\ADCleanup\Rapport_Comptes_Desactives.htm"  
##Clears the report in case there is data in it 
Clear-Content $report 
##Builds the headers and formatting for the report 
Add-Content $report "<html>"  
Add-Content $report "<head>"  
Add-Content $report "<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>"  
Add-Content $report '<title>COMPANY Terminated User Cleanup Script</title>'  
add-content $report '<STYLE TYPE="text/css">'  
add-content $report  "<!--"  
add-content $report  "td {"  
add-content $report  "font-family: Tahoma;"  
add-content $report  "font-size: 11px;"  
add-content $report  "border-top: 1px solid #999999;"  
add-content $report  "border-right: 1px solid #999999;"  
add-content $report  "border-bottom: 1px solid #999999;"  
add-content $report  "border-left: 1px solid #999999;"  
add-content $report  "padding-top: 0px;"  
add-content $report  "padding-right: 0px;"  
add-content $report  "padding-bottom: 0px;"  
add-content $report  "padding-left: 0px;"  
add-content $report  "}"  
add-content $report  "body {"  
add-content $report  "margin-left: 5px;"  
add-content $report  "margin-top: 5px;"  
add-content $report  "margin-right: 0px;"  
add-content $report  "margin-bottom: 10px;"  
add-content $report  ""  
add-content $report  "table {"  
add-content $report  "border: thin solid #000000;"  
add-content $report  "}"  
add-content $report  "-->"  
add-content $report  "</style>"  
Add-Content $report "</head>"  
add-Content $report "<body>"  
 
##This section adds tables to the report with individual content 
##Table 1 for deleted users 
add-content $report  "<table width='100%'>"  
add-content $report  "<tr bgcolor='#CCCCCC'>"  
add-content $report  "<td colspan='7' height='25' align='center'>"  
add-content $report  "<font face='tahoma' color='#003399' size='4'><strong>Les utilisateurs suivants ont été supprimés ( rapport uniquement)</strong></font>"  
add-content $report  "</td>"  
add-content $report  "</tr>"  
add-content $report  "</table>"  
add-content $report  "<table width='100%'>"  
Add-Content $report "<tr bgcolor=#CCCCCC>"  
Add-Content $report  "<td width='20%' align='center'>Compte</td>"  
Add-Content $report "<td width='10%' align='center'>Modifié</td>"   
Add-Content $report "<td width='50%' align='center'>Description</td>"   
Add-Content $report "</tr>"  
if ($delUsers -ne $null){ 
    foreach ($name in $delUsers) { 
        $AccountName = $name.name 
        $LastChgd = $name.modified 
        $UserDesc = $name.Description 
        Add-Content $report "<tr>"  
        Add-Content $report "<td>$AccountName</td>"  
        Add-Content $report "<td>$LastChgd</td>"  
        add-Content $report "<td>$UserDesc</td>" 
    } 
} 
else { 
    Add-Content $report "<tr>"  
    Add-Content $report "<td>No Accounts match</td>"  
} 
Add-content $report  "</table>"  
 
##Table 2 for warning users 
add-content $report  "<table width='100%'>"  
add-content $report  "<tr bgcolor='#CCCCCC'>"  
add-content $report  "<td colspan='7' height='25' align='center'>"  
add-content $report  "<font face='tahoma' color='#003399' size='4'><strong>Les utilisateurs suivants seront supprimés la semaine prochaine</strong></font>"  
add-content $report  "</td>"  
add-content $report  "</tr>"  
add-content $report  "</table>"  
add-content $report  "<table width='100%'>"  
Add-Content $report "<tr bgcolor=#CCCCCC>"  
Add-Content $report  "<td width='20%' align='center'>Compte</td>"  
Add-Content $report "<td width='10%' align='center'>Modifié</td>"   
Add-Content $report "<td width='50%' align='center'>Description</td>"   
Add-Content $report "</tr>" 
if ($warnUsers -ne $null){ 
    foreach ($name in $warnUsers) { 
        $AccountName = $name.name 
        $LastChgd = $name.modified 
        $UserDesc = $name.Description 
        Add-Content $report "<tr>"  
        Add-Content $report "<td>$AccountName</td>"  
        Add-Content $report "<td>$LastChgd</td>"  
        add-Content $report "<td>$UserDesc</td>" 
    } 
} 
else { 
    Add-Content $report "<tr>"  
    Add-Content $report "<td>No Accounts match</td>"  
} 
Add-content $report  "</table>"  
 
##Table 3 for whitelisted users 
add-content $report  "<table width='100%'>"  
add-content $report  "<tr bgcolor='#CCCCCC'>"  
add-content $report  "<td colspan='7' height='25' align='center'>"  
add-content $report  "<font face='tahoma' color='#003399' size='4'><strong>Les utilisateurs suivants sont en liste blanche</strong></font>"  
add-content $report  "</td>"  
add-content $report  "</tr>"  
add-content $report  "</table>"  
add-content $report  "<table width='100%'>"  
Add-Content $report "<tr bgcolor=#CCCCCC>"  
Add-Content $report  "<td width='20%' align='center'>Compte</td>"  
Add-Content $report "<td width='10%' align='center'>Modifié</td>"   
Add-Content $report "<td width='50%' align='center'>Description</td>"   
Add-Content $report "</tr>" 
if ($wlistUsers -ne $null){ 
    foreach ($name in $wlistUsers) { 
        $AccountName = $name.name 
        $LastChgd = $name.modified 
        $UserDesc = $name.Description 
        Add-Content $report "<tr>"  
        Add-Content $report "<td>$AccountName</td>"  
        Add-Content $report "<td>$LastChgd</td>"  
        add-Content $report "<td>$UserDesc</td>" 
    } 
} 
else { 
    Add-Content $report "<tr>"  
    Add-Content $report "<td>No Accounts match</td>"  
} 
Add-content $report  "</table>"  
 
##Table 4 for recently modified users 
add-content $report  "<table width='100%'>"  
add-content $report  "<tr bgcolor='#CCCCCC'>"  
add-content $report  "<td colspan='7' height='25' align='center'>"  
add-content $report  "<font face='tahoma' color='#003399' size='4'><strong>Les utilisateurs suivants ont été modifiés au cours des 30 derniers jours</strong></font>"  
add-content $report  "</td>"  
add-content $report  "</tr>"  
add-content $report  "</table>"  
add-content $report  "<table width='100%'>"  
Add-Content $report "<tr bgcolor=#CCCCCC>"  
Add-Content $report  "<td width='20%' align='center'>Compte</td>"  
Add-Content $report "<td width='10%' align='center'>Modifié</td>"   
Add-Content $report "<td width='50%' align='center'>Description</td>"    
Add-Content $report "</tr>"  
if ($30daysUsers -ne $null){ 
    foreach ($name in $30daysUsers) { 
        $AccountName = $name.name 
        $LastChgd = $name.modified 
        $UserDesc = $name.Description 
        Add-Content $report "<tr>"  
        Add-Content $report "<td>$AccountName</td>"  
        Add-Content $report "<td>$LastChgd</td>"  
        add-Content $report "<td>$UserDesc</td>" 
    } 
} 
else { 
    Add-Content $report "<tr>"  
    Add-Content $report "<td>No Accounts match</td>"  
} 
Add-content $report  "</table>"  
 
##This section closes the report formatting 
Add-Content $report "</body>"  
Add-Content $report "</html>"  
 
##Assembles and sends completion email with DL information##
$emailFrom = "email@company.com"
$emailTo = "email@company.com"
$smtpServer = "mailserver.company.local"
$subject = "Comptes utilisateurs inactifs" 
$body = Get-Content $report | Out-String 
 
Send-MailMessage -To $emailTo -From $emailFrom -Subject $subject -BodyAsHtml -Body $body -SmtpServer $smtpServer 
