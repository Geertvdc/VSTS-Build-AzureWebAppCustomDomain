# Azure WebApp Hostname
VSTS build &amp; release task to add custom domain hostname to your web app

## introduction
This task will help you add a custom domain to your web app in Azure. Just add this task to your build or release workflow and select the web app that you want to add a custom domain to.
note: existing custom domain will be removed

 ![screenshot](https://raw.githubusercontent.com/Geertvdc/VSTS-Build-AzureWebAppCustomDomain/master/geertvdc.vsts.azurewebappcostumdomain.extension/images/3.png)

to use the task you have to insert the following information:
 
 - Azure RM subscription
 - Web app name
 - Resource group name 
 - (optionally) select a web app slot
 - Hostname you want to add

 ![screenshot](https://raw.githubusercontent.com/Geertvdc/VSTS-Build-AzureWebAppCustomDomain/master/geertvdc.vsts.azurewebappcostumdomain.extension/images/2.png)

## open source
This task is open source and hosted on Github here: https://github.com/Geertvdc/VSTS-Build-AzureWebAppCustomDomain if you have any issues file a bug. Pull requests welcome!