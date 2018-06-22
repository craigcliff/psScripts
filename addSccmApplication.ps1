

param (
    [Parameter(Mandatory = $true)]
    [string] $DeviceName,
     [Parameter(Mandatory = $true)]
    [string] $Application)

    $arrays = $Application.split(",")
    
    

import-module 'C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\ConfigurationManager.psd1' | Out-Null
cd C00:
Function Get-SCCMDeviceResourceID {
Try{
Get-WmiObject -Namespace "Root\SMS\Site_$('C00')" -Class 'SMS_R_SYSTEM' -Filter "Name='$DeviceName'" -ComputerName 'srv003679.mud.internal.co.za'

}
Catch{
$_.Exception.Message
}
}

$Resource = (Get-SCCMDeviceResourceID  -DeviceName $DeviceName).ResourceID
foreach ($array in $arrays) {
Try {
 
Add-CMDeviceCollectionDirectMembershipRule -CollectionName $array -ResourceId $Resource
write-host $array  ': ' " Success - Software has been pushed"

}
CAtch {
$array  + ' - ' + $_.Exception.Message

}
}
