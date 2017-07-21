$ResourceGroup = 'SvapsDEV'
$AdminName = "DoneProDevPaas1SqlAdm"
$DBCollation = "Cyrillic_General_CI_AS"
$StorageAccountName = "svapsdevdgnstor01"
$EmailAddresses = "cd.done.pro@outlook.com"
$Environment = "Dev"

#Admin Password - FcisD4%vi@3dP

#Select Azure Account Subscription
Select-AzureRmSubscription -SubscriptionId 2484ab0c-add2-4bf3-8d64-8c1b415b72f8 #VEETECH-KORZAN
Select-AzureRmSubscription -SubscriptionId 40dde5bb-748a-4489-9e50-53a5e656eb5c #CI-CD

#Create SQL DB (PaaS)

New-AzureRmResourceGroupDeployment `
    -Name SqlPaaSForDoneproDEV `
    -ResourceGroupName $ResourceGroup `
    -Environment $Environment `
    -TemplateFile "$env:jenkinspath\DEV\PaaS SQL\DonePro\DoneProSqlPaaS_DEV.json" `
    -adminUsername $AdminName `
    -DBCollation $DBCollation `
    -StorageAccountname $StorageAccountName `
    -EmailAddresses $EmailAddresses `
    -Verbose

