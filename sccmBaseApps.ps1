Param (
	[Parameter(Position=0)][string]$SiteServer = 'srv003679.mud.internal.co.za',
	[Parameter(Position=1)][string]$SiteCode = 'C00'

 )

 

$ParentFolderName = @("Operational","Base")


 import-module 'C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\ConfigurationManager.psd1' | Out-Null
cd C00:

#Get-CMApplication | Select-Object DateCreated,NumberOfDeployments,PackageID,PSShowComputerName,SoftwareVersion,SourceSite,LocalizedDisplayName

#========================================================================================

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

 $list1 =  @($List | Select-Object -Property Name, CollectionID,Comment,CurrentStatus,CollectionType,MemberClassName | Sort-Object Name | ConvertTo-Json)






 $list2 =  @(foreach ($Li in $List){

  Get-CMDeployment -CollectionName $Li.Name | Select-Object -Property CollectionName,SoftwareName, CreationTime, DeploymentID,CollectionID,PackageID,SmsProviderObjectPath | ConvertTo-Json
})



Get-CMDeployment -CollectionName $Li.Name | Get-Member -MemberType Property

$m = $list2 | measure
$m.Count

write-host $list2






 
