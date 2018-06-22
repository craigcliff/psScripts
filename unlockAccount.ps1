import-module ActiveDirectory

 $domains = @("Something","Something")

 foreach ($domain in $domains) {
    
   Unlock-ADAccount -identity shadlia -Server $domain
   write-host "unlocked on" $domain
 }




