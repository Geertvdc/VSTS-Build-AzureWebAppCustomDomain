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

	$result = Set-AzureRmWebApp -name "$WebAppName" -slot $SlotName -ResourceGroupName $ResourceGroupName -HostNames $newHosts
}
else {
	$result = Set-AzureRmWebApp -name "$WebAppName" -HostNames $newHosts
}

