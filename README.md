
# Azure-Lighthouse

## Authenticate with the correct Azure tenant:

You will need a suitable role (i.e Owner) to deploy.

`az login --tenant {tenant}`

## Create a subscription resource deployment 

`az deployment sub create --location "australiaeast" --template-uri "https://raw.githubusercontent.com/Soda-Digital/Azure-Lighthouse/main/lighthouse.json--subscription "{subscriptionId}"`

You will be promted for a `principalId` - copy the value provided by Soda Digital.
