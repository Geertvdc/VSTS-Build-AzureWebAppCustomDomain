Trace-VstsEnteringInvocation $MyInvocation

$ConnectedServiceName = Get-VstsInput -Name ConnectedServiceName -Require
$WebAppName = Get-VstsInput -Name WebAppName -Require
$ResourceGroupName = Get-VstsInput -Name ResourceGroupName -Require
$DeployToSlotFlag = Get-VstsInput -Name DeployToSlotFlag -Require
$SlotName = Get-VstsInput -Name SlotName -Require
$DomainName = Get-VstsInput -Name DomainName -Require

# Initialize Azure.
Import-Module $PSScriptRoot\ps_modules\VstsAzureHelpers_
Initialize-Azure
Write-Output "Azure Initialized"

$newHosts = @($DomainName)

if($DeployToSlotFlag){
	#deploy to web app slot
	$slot = Get-AzureRmWebAppSlot -ResourceGroupName "$ResourceGroupName" -name "$WebAppName" -slot "$SlotName"
	$defaultHostname = $slot.DefaultHostName
	$hostnames=@{"hostNames"=@($defaultHostname, $DomainName)}

	Set-AzureRmResource -ResourceType "Microsoft.Web/sites/slots" -ResourceGroupName $ResourceGroupName -ResourceName "$WebAppName/$SlotName" -propertyobject $hostnames -ApiVersion 2015-08-01 -force
}
else {
	#deploy to main web app (no slot)
	$result = Set-AzureRmWebApp -name "$WebAppName" -HostNames $newHosts
}

