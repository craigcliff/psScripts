$workstations =  @('Lap11656')






foreach($workstation in $workstations) {

Try{

 if (Test-Connection -comp $workstation -ErrorAction SilentlyContinue  ){
 #Machine Policy Retrieval
Invoke-WMIMethod -ComputerName $workstation -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000021}"

#Machine Policy Evaluation Cycle
Invoke-WMIMethod -ComputerName $workstation -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000022}"

#Application Deployment Evaluation Cycle
Invoke-WMIMethod -ComputerName $workstation -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000121}"

write-host 'SCCM Actions have been submitted on'  $workstation


            }


   
}Catch{
 Write-host "unable to ping $workstation"


}


}