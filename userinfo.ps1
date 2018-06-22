Get-ADUser -SearchBase ‘OU=Something’ -filter * -Properties SamAccountName,displayName,Surname,GivenName,mail | Select-Object SamAccountName,Name,displayName,Surname,GivenName,mail | ConvertTo-Json
