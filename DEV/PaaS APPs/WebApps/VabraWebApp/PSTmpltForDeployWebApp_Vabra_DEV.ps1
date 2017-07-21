﻿$ResourceGroup = "SvapsDEV"

$AppServicePlanName = "SvapsDevAppSvcPlan01"
$WebAppName = "SvapsDevVabraWebApp01"
$Environment = "Dev"

#Select Azure Account Subscription
Select-AzureRmSubscription -SubscriptionId 2484ab0c-add2-4bf3-8d64-8c1b415b72f8 #VEETECH-KORZAN
Select-AzureRmSubscription -SubscriptionId 40dde5bb-748a-4489-9e50-53a5e656eb5c #CI-CD


New-AzureRmResourceGroupDeployment `
    -Name ApiAppForVabraWebAppDEV `
    -ResourceGroupName $ResourceGroup `
    -Environment $Environment `
    -TemplateFile "$env:jenkinspath\DEV\PaaS APPs\WebApps\VabraWebApp\VabraWebApp_DEV.json" `
    -AppServicePlanName $AppServicePlanName `
    -WebAppName $WebAppName `
    -Verbose
