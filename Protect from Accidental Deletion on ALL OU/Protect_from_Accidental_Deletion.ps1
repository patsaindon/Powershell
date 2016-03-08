Get-ADOrganizationalunit -Filter 'Name -like "*"' | Set-AdoOject -ProtectedFromAccidentalDeletion $true
