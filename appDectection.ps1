Set-ExecutionPolicy -ExecutionPolicy Bypass

##Global Variable Declaration

[version]$InstallerVersion = '3.0'
#Application Name as it appears in HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{appGUID}\DisplayName
#Append a * as a wildcard ex. '7-Zip*'
$AppName = 'Lipper*'

##32-Bit Detection

$32BitApp = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | where {$_.displayname -like $AppName}
    Foreach ($item in $32BitApp)
    {
        [version]$InstalledVersion = $item.DisplayVersion
        if ($InstalledVersion -ge $InstallerVersion)
        {
            Write-Host "Installed"
        }
        else
        {
        }
    }
        
##64-Bit Detection

$64BitApp = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | where {$_.displayname -like $AppName}
    Foreach ($item in $64BitApp)
    {
        [version]$InstalledVersion = $item.DisplayVersion
        if ($InstalledVersion -ge $InstallerVersion)
        {
            Write-Host "Installed"
        }
        else
        {
        }
    } 