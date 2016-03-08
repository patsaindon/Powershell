$adcomputer= import-csv 'C:\Scripts\ADCLeanup\OldComputers.csv'

foreach ($comp in $adcomputer)
{
 
$distinguishedname= $comp.distinguishedname
 
Remove-ADObject -Identity "$distinguishedname" -Recursive -Verbose -WhatIf | Export-Csv 'C:\Scripts\ADCLeanup\deleted.csv' -NoTypeInformation 
 
}
