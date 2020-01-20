$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = 'westeurope'#Read-Host -Prompt "Enter the location (i.e. centralus)"
$resourceGroupName = 'TRG' + $resourceGroupName


New-AzResourceGroup -Name $resourceGroupName -Location $location
# Test-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile .\azureDeployTemplate.json -TemplateParameterFile .\azureDeployParameters.json
 
# $continueDeployment = Read-Host -Prompt "Continue Deployment (Y/N)"

# If ($continueDeployment -eq 'y') { 
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile .\azureDeployTemplate.json -TemplateParameterFile .\azureDeployParameters.json
# }
# Else {
#     #Remove-AzureRmResourceGroup -Name $resourceGroupName -Location $location
# }