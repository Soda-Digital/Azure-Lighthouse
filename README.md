
# Azure Lighthouse

> With Azure Lighthouse, service providers can deliver managed services using comprehensive and robust tooling built into the Azure platform. Customers maintain control over who has access to their tenant, which resources they can access, and what actions can be taken.

-- https://learn.microsoft.com/en-us/azure/lighthouse/overview


## What this does

Running this process will provide a means for a "Group" within the Soda Digital tenant to have delegated, restricted access, to a subscription within your tenant.

Specifically the roles that will provided are:

* Contributor Role
  - Allows access to the subscription to perform most operations
* Managed Services Registration assignment Delete Role
  - Allows Soda to remove itself from Lighthouse
* User Access Administrator
  - This role is _different_ when operating in the context of Lighthouse. It does not allow us to adminsister users, instead it allows a scoped subset of roles to be associated with Managed Identities required to operate the services we deploy. Those roles include:
  - Contributor
  - Storage Blob Data Contributor
  - Storage Blob Data Owner
  - AcrPull
  - AcrPush
  - Key Vault Administrator
  - Key Vault Contributor
  - Key Vault Crypto Service Encryption User
  - Key Vault Secrets User
  - Communication and Email Service Owner

## Setup
To roll out the Azure Lighthouse implementation, you'll need to use the `az`​ Azure CLI tooling (you cannot deploy subscription level resources via the Portal UI). You can install this on Windows with winget via ` winget install Microsoft.AzureCLI` or there are install instructions here: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest

## Authenticate with the Azure tenant:

You will need to authenticate with an account with appropriate access.

`az login --tenant {tenant}`

## Create a subscription-level resource deployment 

Once authenticated, run the below script but replace the `{subscriptionId}` placeholder value below with the new subscription Id we will be working against​:

`az deployment sub create --location "australiaeast" --template-uri "https://raw.githubusercontent.com/Soda-Digital/Azure-Lighthouse/main/lighthouse.json" --subscription "{subscriptionId}"`

You will be prompted for a `principalId` - use the value provided by Soda Digital.
