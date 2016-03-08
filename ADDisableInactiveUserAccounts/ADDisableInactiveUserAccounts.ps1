<#
.SYNOPSIS
    Script used to find all innactive accounts in Active Directory and disable them 

    2/29/2016: Version 1.0

.DESCRIPTION
    Script used to find all inactive accounts in Active Directory and disable them 
    All configuration is stored in ADDisableInactiveUserAccountsConfig.xml file located in the same directory as the script. The configuration may include:
    - Excluded accounts
    - Excluded accounts in specific groups
    - Included object properties
    - Email properties
    - CSV report properties
    - Logs folder

    See attached XML file for details.

.NOTES
    Author       : Adam W. Mrowicki
    File Name    : ADDisableInactiveUserAccounts.ps1

    Version History:
    1.0 - 2/29/2016
        - Initial release

.EXAMPLE
    .\ADDisableInactiveUserAccounts.ps1
#>

function ParseConfig([string]$filename){
    try{
	    $file = Get-Item -Path $filename
		if($file.Exists){
			$cfg = [xml] (Get-Content -Path $filename)
			return $cfg.config
		}
		else{
			Write-Host "The configuration file "$filename" does not exist" -ForegroundColor Red
		}
	}
	catch{
		Write-Host "Cannot load configuration file "$filename -ForegroundColor Red
	}
	return $null
}

function GetLastLogon([string]$userName){
    if($cfg.Server -eq $null){
        $controllers = (Get-ADDomainController -Filter *).hostname
    }
    else{
        $controllers = (Get-ADDomainController -Filter * -Server $cfg.Server).hostname
    }

    $time = $null

    foreach($dc in $controllers){
        try{
            $user = Get-ADUser -Identity $userName -Server $dc -Properties LastLogon| select-object Name, LastLogon
            if($user.LastLogon -gt $time){
                $time = $user.LastLogon
            }
        }catch{
        Out-File -FilePath $script:operationlog -Append -Encoding $cfg.OperationLogEncoding -InputObject ("Error while getting user $userName last logon date on $dc : "+$Error[0])
        }
    }
    return ([DateTime]::FromFileTime($time)).ToString('g')
}

function SetProperties(){
    $propertiesOutput = $propertiesSelect = $cfg.IncludedProperties.PropertyName

    if($propertiesOutput -eq $Null){
        $propertiesOutput = $propertiesSelect = @('Name', 'DistinguishedName', 'samAccountName', 'whenCreated', 'lastlogontimestamp', 'enabled')
    }

    if($cfg.IncludedProperties.Parent -eq $true){
        $parent = @{n='Parent';e={$($_ -split '(?<![\\]),')[1..$(($_ -split '(?<![\\]),').Count-1)] -join ','}}
        $propertiesSelect += $parent
    }

    $LastLogon = @{n='LastLogon';e={$(GetLastLogon $_.samaccountname)}}
    $LastLogonTimestampDateTime += @{n='LastLogonTimestampDateTime';e={$([DateTime]::FromFileTime($_.LastlogonTimestamp)).ToString('g')}}
    $propertiesSelect += $LastLogon
    $propertiesSelect += $LastLogonTimestampDateTime
    $propertiesOutput += 'memberof'

    return $propertiesOutput, $propertiesSelect
}

function SetFilter(){
    $BaseFilter = 'lastlogontimestamp -le $lastLogonIntervalLimit -and enabled -eq $True'
    $whereFilter = $null

    if($cfg.ExcludedAccount -ne $null){
        foreach($account in $cfg.ExcludedAccount){
            $BaseFilter += " -and samAccountname -ne '$account'"
        }
    }
    
    if($cfg.ExcludedGroups -ne $null){
        foreach($group in $cfg.ExcludedGroups){
            $BaseFilter += " -and memberof -notlike '$group'"
        }
    }

    return $BaseFilter
}

function GetUsers(){

    if($cfg.ResultSetSize -eq 0){
        $ResultSetSize = $null
    }
    else{
        $ResultSetSize = $cfg.ResultSetSize
    }

    if($cfg.SearchBase -eq $null){
        $SearchBase = (Get-ADDomain).DistinguishedName
    }
    else{
        $SearchBase = $cfg.SearchBase
    }

    if($cfg.SearchScope -eq $null){
        $SearchScope = 2
    }
    else{
        $SearchScope = $cfg.SearchScope
    }

    if($cfg.Server -eq $null){
        $Server = [string](Get-ADDomainController -Discover).hostname
    }
    else{
        $Server = $cfg.Server
    }

    $currentDateUtc = $currentDate.ToUniversalTime() 
    $lastLogonTimeStampLimit = $currentDateUtc.AddDays(-$cfg.DaysInactive)
    $lastLogonIntervalLimit = $lastLogonTimeStampLimit.ToFileTime()
    $properties = SetProperties
    $filter = SetFilter

    $users = Get-ADUser -ResultSetSize $ResultSetSize -SearchBase $SearchBase -SearchScope $SearchScope -Server $Server -Properties $properties[0] -Filter $filter | select-object $properties[1]
    $script:accountsToDisable = $users.Count
    return $users
}

Function CSVReport(){
    if($cfg.CSVReport.GenerateCSVReport -eq $True){
        $file = $cfg.LogsFolder+"\InactiveUserAccountsReport_"+($currentDate).ToString('yyyy-MM-dd_hh.mm')+".csv"
        if($users -ne $null){
            $users | Export-Csv -Encoding $cfg.CSVReport.Encoding -NoTypeInformation -Path ($file)
            return $file
        }
        else{
            Out-File -FilePath $file -InputObject 'No inactive user accounts found' -Encoding $cfg.CSVReport.Encoding
            return $file
        }
    }
    else{
        return $null
    }
}

function DisableAccounts(){

    $file = $script:operationlog

    if($cfg.AuditMode -eq $false){

        if($cfg.Server -eq $null){
            $Server = [string](Get-ADDomainController -Discover).hostname
        }
        else{
            $Server = $cfg.Server
        }

        foreach($user in $users){
            try{
                Disable-ADAccount -Identity $user.distinguishedname -Server $Server
                Out-File -FilePath $file -Append -Encoding $cfg.OperationLogEncoding -InputObject ('Account '+$user.distinguishedname+' disabled successfully')
                $script:accountsDisabled = $script:accountsDisabled + 1

            }
            catch{
                Out-File -FilePath $file -Append -Encoding $cfg.OperationLogEncoding -InputObject ('Disabling '+$user.distinguishedname+' failed with exception: '+$Error[0])
                $script:disablingStatus = "Error"
            }
        }
    }
    else{
        Out-File -FilePath $file -Append -Encoding $cfg.OperationLogEncoding -InputObject ("Audit mode, found "+$users.count+" accounts:")
        Out-File -FilePath $file -Append -Encoding $cfg.OperationLogEncoding -InputObject ($users.distinguishedname)
        $script:disablingStatus = "Success - Audit Mode"
    }
}

Function HTMLReport(){
    return ("Found $script:accountsToDisable accounts and $script:accountsDisabled was disabled susscessfully"  | ConvertTo-Html -Head $style)
}

Function EmailReport(){
    if($cfg.EmailReport.SendReport -eq $True){

        if(($cfg.EmailReport.From -ne $null) -and ($cfg.EmailReport.To -ne $null) -and ($cfg.EmailReport.SmtpServer -ne $null)){

            $parameters = @{}

            if($cfg.EmailReport.CustomSubject -eq $null){
                $parameters.Add("Subject", "Active Directory - disabled inactive users accounts: $script:accountsDisabled - $script:disablingStatus")
            }
            else{
                $parameters.Add("Subject", $cfg.EmailReport.CustomSubject+"$script:accountsDisabled - $script:disablingStatus")
            }

            if($cfg.EmailReport.Encoding -eq $null){
                $parameters.Add("Encoding", "ASCII")
            }
            else{
                $parameters.Add("Encoding", $cfg.EmailReport.Encoding)
            }

            if($cfg.EmailReport.Port -eq $null){
                $parameters.Add("port", "25")
            }
            else{
                $parameters.Add("port", $cfg.EmailReport.Port)
            }

            if($cfg.EmailReport.To -ne $null){
                    $parameters.Add("To", $cfg.EmailReport.To)
            }

            if($cfg.EmailReport.CC -ne $null){
                    $parameters.Add("CC", $cfg.EmailReport.CC)
            }

            if($cfg.EmailReport.BCC -ne $null){
                    $parameters.Add("BCC", $cfg.EmailReport.BCC)
            }

            if($cfg.EmailReport.UseSSL -eq 'True'){
                $parameters.Add("UseSSL", $True)
            }

            if($cfg.CSVReport.GenerateCSVReport -eq $True){
                $parameters.Add("Attachments", ($csvReport, $script:operationlog))
            }
            else{
                $parameters.Add("Attachments", $script:operationlog)
            }

            $parameters.Add("BodyAsHTML", $True)
            $parameters.Add("Body", "Found $script:accountsToDisable accounts and $script:accountsDisabled was disabled susscessfully")
            $parameters.Add("SmtpServer", $cfg.EmailReport.SmtpServer)
            $parameters.Add("From", $cfg.EmailReport.From)

            Send-MailMessage @parameters 
        }
        else{
            Write-Host "Required parameters missing" -ForegroundColor Red
        }
    }
}

Try 
{ 
    Import-Module -Name ActiveDirectory -ErrorAction Stop 
} 
Catch 
{ 
    Write-Host "[ERROR]`t ActiveDirectory Module couldn't be loaded. Script will stop!" 
    Exit 1 
}

$cfg = ParseConfig .\ADDisableInactiveUserAccountsConfig.xml
$currentDate = Get-Date
$script:disablingStatus = "Success"
$script:accountsToDisable = 0
$script:accountsDisabled = 0
$script:operationlog = $cfg.LogsFolder+"\InactiveUserAccountsReportOperationLog_"+($currentDate).ToString('yyyy-MM-dd_hh.mm')+".log"

if($cfg -ne $null -or $cfg.AuditMode -ne $null ){
    $users = GetUsers
    $csvReport = CSVReport
    DisableAccounts
    EmailReport
}