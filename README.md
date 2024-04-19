
# Azure Lighthouse

To roll out the Azure Lighthouse implementation, you'll need to use the `az`​ Azure CLI tooling (you cannot deploy subscription level resources via the Portal UI).

## Authenticate with the Azure tenant:

You will need to authenticate with an account with appropriate access.

`az login --tenant {tenant}`

## Create a subscription-level resource deployment 

Once authenticated, run the below but replace the `{subscriptionId}` placeholder value below with the subscription Id we will be working on​:

`az deployment sub create --location "australiaeast" --template-uri "https://raw.githubusercontent.com/Soda-Digital/Azure-Lighthouse/main/lighthouse.json" --subscription "{subscriptionId}"`

You will be prompted for a `principalId` - copy the value provided by Soda Digital.
