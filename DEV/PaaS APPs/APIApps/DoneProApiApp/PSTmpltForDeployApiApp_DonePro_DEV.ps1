$ResourceGroup = "SvapsDEV"

$AppServicePlanName = "SvapsDevAppSvcPlan01"
$APIAppName = "SvapsDevDoneproApiApp01"
$Environment = "Dev"

#Select Azure Account Subscription
Select-AzureRmSubscription -SubscriptionId 2484ab0c-add2-4bf3-8d64-8c1b415b72f8 #VEETECH-KORZAN
Select-AzureRmSubscription -SubscriptionId 40dde5bb-748a-4489-9e50-53a5e656eb5c #CI-CD

New-AzureRmResourceGroupDeployment `
    -Name ApiAppForDoneproApiAppDEV `
    -ResourceGroupName $ResourceGroup `
    -TemplateFile "$env:jenkinspath\DEV\PaaS APPs\APIApps\DoneProApiApp\DoneProApiApp_DEV.json" `
    -appServicePlanName $AppServicePlanName `
    -Environment $Environment `
    -APIAppName $APIAppName `
    -Verbose
