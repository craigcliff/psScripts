param (
    [Parameter(Mandatory = $true)]
    [string] $make,
   [Parameter(Mandatory = $true)]
[string] $model


)

$fullname = 'hello there ' + $make + ' ' + $model;
write-host $fullname;