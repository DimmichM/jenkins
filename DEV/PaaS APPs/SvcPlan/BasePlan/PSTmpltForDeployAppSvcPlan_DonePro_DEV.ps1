$ResourceGroup = "SvapsDEV"

$AppServicePlanName = "SvapsDevAppSvcPlan01"
$AppServicePlanWorkersCount = 1
$Environment = "Dev"

#Select Azure Account Subscription
Select-AzureRmSubscription -SubscriptionId 2484ab0c-add2-4bf3-8d64-8c1b415b72f8 #VEETECH-KORZAN
Select-AzureRmSubscription -SubscriptionId 40dde5bb-748a-4489-9e50-53a5e656eb5c #CI-CD


New-AzureRmResourceGroupDeployment `
    -Name AppServicePlanForDoneProDEV `
    -ResourceGroupName $ResourceGroup `
    -Environment $Environment `
    -TemplateFile " $env:jenkinspath\DEV\PaaS APPs\SvcPlan\BasePlan\DoneProSvcPlan_DEV.json" `
    -AppServicePlanName $AppServicePlanName `
    -WorkersCount $AppServicePlanWorkersCount `
    -Verbose
