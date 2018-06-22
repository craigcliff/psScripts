Param (
    [Parameter(Mandatory = $true)]
    [string] $username,
     [Parameter(Mandatory = $true)]
    [string] $group
    
    )

Import-Module ActiveDirectory

$ugSiwifi = 'UG-NAME'
$ugVRAS = 'UG-NAME'
$ugBluePrint = 'UG-NAME'


Try{

If ($group -eq 'SIWIFI') {
Add-ADGroupMember -Identity $ugSiwifi $username
}
elseif ($group -eq 'VRAS'){
Add-ADGroupMember -Identity $ugVRAS $username

}

elseif ($group -eq 'BLUEPRINT-BI'){
Add-ADGroupMember -Identity $ugBluePrint $username

}

write-host "Success"

}
Catch{

$_.Exception.Message

}