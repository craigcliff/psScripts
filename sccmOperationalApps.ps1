Param (
	[Parameter(Position=0)][string]$SiteServer = 'Something',
	[Parameter(Position=1)][string]$SiteCode = 'C00',
	[Parameter(Position=2)][string[]]$ParentFolderName = 'Base',
[Parameter(Position=2)][string]$ParentFolderName2 = 'Operational'


 )

$arrays = @("Base", "Operational")

#========================================================================================

$List = foreach ($array in $arrays) {





Get-WmiObject -Namespace "root\sms\Site_$SiteCode" -query "
	select Name, CollectionID from SMS_Collection
		inner join SMS_ObjectContainerItem on SMS_ObjectContainerItem.InstanceKey = SMS_Collection.CollectionID
		inner join SMS_ObjectContainerNode on SMS_ObjectContainerNode.ContainerNodeID = SMS_ObjectContainerItem.ContainerNodeID
Where

	SMS_Collection.collectionID like '$SiteCode%'
	and
	SMS_ObjectContainerItem.ObjectType = 5000
	and
	SMS_ObjectContainerNode.sourcesite = '$SiteCode'
	and
	SMS_ObjectContainerNode.Name = '$array'


" -computername $SiteServer

}


	$List | Select-Object -Property Name, CollectionID | Sort-Object Name | ConvertTo-Json