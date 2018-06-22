Import-Module ActiveDirectory





Get-ADGroup -Filter * -Properties whenCreated,Description | ForEach {

    If ($_.whenCreated -gt (Get-Date 8/7/2017) ) {

        $props = @{
            Name = $_.Name
            WhenCreated = $_.whenCreated

        }

        New-Object PsObject -Property $props

    }

} | ConvertTo-JSON -Compress
