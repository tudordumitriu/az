$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = 'westeurope'#Read-Host -Prompt "Enter the location (i.e. centralus)"
$resourceGroupName = 'AZExtensive' #+ $resourceGroupName


New-AzResourceGroup -Name $resourceGroupName -Location $location
Test-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile .\azureDeployFunctionTemplate.json -TemplateParameterFile .\azureDeployFunctionParameters.json
 
$continueDeployment = Read-Host -Prompt "Continue Deployment (Y/N)"

If ($continueDeployment -eq 'y') {
	New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile .\azureDeployFunctionTemplate.json -TemplateParameterFile .\azureDeployFunctionParameters.json
}
Else {
     #Remove-AzureRmResourceGroup -Name $resourceGroupName -Location $location
}