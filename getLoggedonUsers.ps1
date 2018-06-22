$Computers = 'lap09989', 'dst00186', 'dst00071', 'DST17983','LAP05044', 'lap0122'

$Objects = $Computers |
    foreach {
        $AD = Get-ADComputer -Filter { Name -eq $_ } -Property Name,OperatingSystem,OperatingSystemServicePack,OperatingSystemVersion
       
        

        # Set $properties in HashTable
        $properties = @{
           
            Enabled = $AD.Enabled
            WorstationID = $AD.Name
            
            OperatingSystem = $AD.OperatingSystem
            OperatingSystemServicePack = $AD.OperatingSystemServicePack
            OperatingSystemVersion = $AD.OperatingSystemVersion
            
            
        }
        # create custom objects
        New-Object -TypeName PSObject -Property $properties
}
# Return Results
$Objects | ConvertTo-Json
