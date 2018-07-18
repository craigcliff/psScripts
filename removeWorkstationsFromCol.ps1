import-module 'C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\ConfigurationManager.psd1' | Out-Null
cd C00:

$ParentFolderName = @("Base")


#Get all collections in specified folder above - This can be more than one folder
$List =  @(foreach ($pa in $ParentFolderName) {Get-WmiObject -Namespace "root\sms\Site_$SiteCode" -query "
	select Name, Comment, CollectionID,CurrentStatus,CollectionType,MemberClassName from SMS_Collection
		inner join SMS_ObjectContainerItem on SMS_ObjectContainerItem.InstanceKey = SMS_Collection.CollectionID
		inner join SMS_ObjectContainerNode on SMS_ObjectContainerNode.ContainerNodeID = SMS_ObjectContainerItem.ContainerNodeID
Where

	SMS_Collection.collectionID like '$SiteCode%'
	and
	SMS_ObjectContainerItem.ObjectType = 5000
	and
	SMS_ObjectContainerNode.sourcesite = '$SiteCode'
	and
	SMS_ObjectContainerNode.Name = '$Pa'


" -computername $SiteServer

})

#Add all collections ID's from above to variable
$list1 =  @($List | Select-Object -Property CollectionID | Sort-Object Name )
write-host $list1.CollectionID



# iterate through each Collection and Resource ID in Collection then delete Resource ID from collection
foreach ($li in $list1){
$Collections = Get-CMCollection  -CollectionId $li.CollectionID | Get-CMCollectionMember 
write-host $Collections

foreach ($Collection in $Collections){
Remove-CMDeviceCollectionDirectMembershipRule -CollectionId $li.CollectionID  -ResourceId $Collection.ResourceID -Force
write-host $Collection.ResourceID ' removed from ' $li.CollectionID
}

}