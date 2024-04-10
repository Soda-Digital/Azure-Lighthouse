targetScope = 'subscription'

param principalId string

@description('Specify the name of the offer from the Managed Service Provider')
var mspOfferName = 'Soda Digital'

@description('Name of the Managed Service Provider offering')
var mspOfferDescription = 'Azure Services Managed By Soda Digital'

@description('Specify the tenant id of the Managed Service Provider')
var managedByTenantId = '2b6c67b1-5293-40a7-8aea-0dcc01491bf7'

@description('Specify an array of objects, containing tuples of Azure Active Directory principalId, a Azure roleDefinitionId, and an optional principalIdDisplayName. The roleDefinition specified is granted to the principalId in the provider\'s Active Directory and the principalIdDisplayName is visible to customers.')
var authorizations = [
  {
    principalId: principalId
    principalIdDisplayName: 'Soda Digital Contributor'
    roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
  }
  {
    principalId: principalId
    principalIdDisplayName: 'Soda Digital User Access Administrator'
    roleDefinitionId: '18d7d88d-d35e-4fb5-a5c3-7773c20a72d9'
    delegatedRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
      'ba92f5b4-2d11-453d-a403-e96b0029c9fe'
    ]
  }
]

var mspRegistrationName = guid(mspOfferName)
var mspAssignmentName = guid(mspOfferName)

resource mspRegistration 'Microsoft.ManagedServices/registrationDefinitions@2022-10-01' = {
  name: mspRegistrationName

  properties: {
    registrationDefinitionName: mspOfferName
    description: mspOfferDescription
    managedByTenantId: managedByTenantId
    authorizations: authorizations
  }
}

resource mspAssignment 'Microsoft.ManagedServices/registrationAssignments@2022-10-01' = {
  name: mspAssignmentName
  properties: {
    registrationDefinitionId: mspRegistration.id
  }
}

output mspOfferName string = 'Managed by ${mspOfferName}'
output authorizations array = authorizations
