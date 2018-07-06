$workstations =  'DST00011'



foreach($workstation in $workstations) {

   if (-not (Test-Connection -comp $workstation -quiet)){
                Write-host "unable to ping $workstation" -ForegroundColor Red
            } Else {




#Machine Policy Retrieval
Invoke-WMIMethod -ComputerName $workstation -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000021}"

#Machine Policy Evaluation Cycle
Invoke-WMIMethod -ComputerName $workstation -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000022}"

#Application Deployment Evaluation Cycle
Invoke-WMIMethod -ComputerName $workstation -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000121}"
}


}