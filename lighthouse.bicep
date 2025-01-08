targetScope = 'subscription'

@description('Specify the principalId of the object to be projected as the Managed Service Provider')
param principalId string

var mspOfferName = 'Soda Digital'


var mspOfferDescription = 'Azure Services Managed By Soda Digital'


var managedByTenantId = '2b6c67b1-5293-40a7-8aea-0dcc01491bf7'

var authorizations = [
  {
    principalId: principalId
    principalIdDisplayName: 'Soda Digital Contributor'
    roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c' //contributor
  }
  {
    principalId: principalId
    principalIdDisplayName: 'Soda Digital Managed Services Registration assignment Delete Role'
    roleDefinitionId: '91c1777a-f3dc-4fae-b103-61d183457e46' //contributor
  }
  {
    principalId: principalId
    principalIdDisplayName: 'Soda Digital Managed ID RBAC Administrator'
    roleDefinitionId: '18d7d88d-d35e-4fb5-a5c3-7773c20a72d9'
    delegatedRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c' //contributor
      'ba92f5b4-2d11-453d-a403-e96b0029c9fe' //Storage Blob Data Contributor
      '7f951dda-4ed3-4680-a7ca-43fe172d538d' //acrpull
      '8311e382-0749-4cb8-b61a-304f252e45ec' //acrpush
      '00482a5a-887f-4fb3-b363-3b7fe8e74483' //keyvault admin
      'f25e0fa2-a7c8-4377-a976-54943a77a395' //keyvault contributor
      'e147488a-f6f5-4113-8e2d-b22465e65bf6' //Key Vault Crypto Service Encryption User
      '4633458b-17de-408a-b874-0445c86b69e6' //Key Vault Secrets User
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
