terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
provider "azurerm" {
  features {
    
  }
}
variable "num_rg" {
  type        = number
  default     = 95
  description = "(optional) describe your variable"
}

resource "azurerm_resource_group" "name" {
  name     = "vinex2212-${count.index + 1}"
  location = "central india"
  count    = var.num_rg
  depends_on = [ azurerm_resource_group.name ]
}




# Add the service principal application ID and secret here
servicePrincipalClientId="7f695afa-1861-405a-b526-ebf700a1b3b3";
servicePrincipalSecret="RNn8Q~hfWFNsWD2pEoBLM1vHJNgiK4tZlFTOxbFs"";


export subscriptionId="f401ada2-3371-47bc-b521-573928f6da57";
export resourceGroup="terraform_state";
export tenantId="57f791d2-2253-4301-8da6-c615707b5a0b";
export location="southeastasia";
export authType="principal";
export correlationId="fb5071e6-c28e-49f5-90d3-64fa402f5955";
export cloud="AzureCloud";
output=$(wget https://aka.ms/azcmagent -O ~/install_linux_azcmagent.sh 2>&1);
if [ $? != 0 ]; then wget -qO- --method=PUT --body-data="{\"subscriptionId\":\"$subscriptionId\",\"resourceGroup\":\"$resourceGroup\",\"tenantId\":\"$tenantId\",\"location\":\"$location\",\"correlationId\":\"$correlationId\",\"authType\":\"$authType\",\"operation\":\"onboarding\",\"messageType\":\"DownloadScriptFailed\",\"message\":\"$output\"}" "https://gbl.his.arc.azure.com/log" &> /dev/null || true; fi;
echo "$output";
bash ~/install_linux_azcmagent.sh;
sudo azcmagent connect --service-principal-id "$servicePrincipalClientId" --service-principal-secret "$servicePrincipalSecret" --resource-group "$resourceGroup" --tenant-id "$tenantId" --location "$location" --subscription-id "$subscriptionId" --cloud "$cloud" --correlation-id "$correlationId";
