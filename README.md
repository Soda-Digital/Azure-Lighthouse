
# Azure-Lighthouse

## Authenticate with the correct Azure tenant:

`az login --tenant {tenant}`

## Create a subscription resource deployment 

`az deployment sub create --location "australiaeast" --subscription {subscriptionId} --template-uri https://raw.githubusercontent.com/Soda-Digital/Azure-Lighthouse/main/lighthouse.bicep`

You will be promted for a `principleId` - copy the value provided by Soda Digital.
