param (
    [Parameter(Mandatory = $true)]
    [string] $username,
    [string] $company,
[string] $firstname,
[string] $lastname,
[string] $department,
[string] $office,
[string] $description,
[string] $manager,
[string] $job

)

#Constants:
$password = 'Password'| ConvertTo-SecureString -AsPlainText -Force
$ou = 'OU=safdfafadffafd'
$ugSiwifi = 'UG-Something-SIMMobility-SiWiFi'
$ugOuVis = 'UG-Something-OUVisibility'
$ugStaff = 'UG-Something-Staff'
$ugInternet = 'UG-Something-Internet'
$domain = '@something.internal.co.za'

#Variables:

$principal = $username + $domain





If ($company -eq 'Something') {
$abr = '(SI)'
$script = 'Something'


}

elseif ($company -eq 'SPW SA' -And $office -eq 'Something'){
$abr = '(Something)'
$script = 'Something\Something.bat'

}

elseif ($company -eq 'SPW SA' -And $office -eq 'Durban'){
$abr = '(Something)'
$script = 'Something\Something.bat'

}

elseif ($company -eq 'SPW SA' -And $office -eq 'George'){
$abr = '(SPW)'
$script = 'Something\Something.bat'

}

elseif ($company -eq 'SPW SA' -And $office -eq 'Knysna'){
$abr = '(SPW)'
$script = 'Something\Something.bat'

}

elseif ($company -eq 'SPW SA' -And $office -eq 'PTA'){
$abr = '(SPW)'
$script = 'Something\Something.bat'

}

elseif ($company -eq 'SPW SA' -And $office -eq 'JHB'){
$abr = '(SPW)'
$script = 'Something\Something.bat'

}

elseif ($company -eq 'Sanlam Investments' -And $office -eq 'JHB'){
$abr = '(SPW)'
$script = 'Something\Something.bat'

}



elseif ($company -eq 'Sanlam Something Solutions'){
$abr = '(Sanlam Something Something)'
$script = 'Something\Something.bat'
}

elseif ($company -eq 'Something'){
$abr = '(Something)'
$script = 'Something\Something.bat'
}

elseif ($company -eq 'Something'){
$abr = '(Something)'
$script = 'Something\Something.bat'
}

elseif ($company -eq 'Denker'){
$abr = '(Something)'
$script = 'Something\Something.bat'
}

elseif ($company -eq 'Something Properties'){
$abr = '(Something Properties)'
$script = 'Something\Something.bat'
}

elseif ($company -eq 'Something FP'){
$abr = '(Something)'
$script = ''
}

elseif ($company -eq 'Graviton WM'){
$abr = '(Something)'
$script = ''
}

else {
$abr = ''
$script = ''
}



$displayName = "$firstname $lastname $abr"



$dname = "$firstname $lastname"
Import-Module ActiveDirectory



New-ADUser -Name $dname `
-GivenName $firstname  `
-Surname $lastname `
-DisplayName $displayName  `
-SamAccountName $username `
-UserPrincipalName $principal `
-Path $ou `
-AccountPassword $Password -ChangePasswordAtLogon $False -Enabled $True `
-Company $company `
-Department $department `
-Description $description `
-ScriptPath $script `
-Office $office `
-Manager $manager `
-Title $job

Add-ADGroupMember -Identity $ugSiwifi $username
Add-ADGroupMember -Identity $ugOuVis $username
Add-ADGroupMember -Identity $ugStaff $username
Add-ADGroupMember -Identity $ugInternet $username
