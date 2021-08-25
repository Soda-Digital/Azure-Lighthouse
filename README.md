
# Establish Partner

In MS Partner Network, generate link to onboard new Partner. Need to do this before actioning the below.


# Admin On Behalf Of (AOBO)

When logged in as admin of customer tennant.

`az role assignment create --role owner --assignee-object-id 4c20a97a-a661-4973-b3e1-d11abf11cb53 --scope /subscriptions/{newSubId}`


# Azure-Lighthouse

Update the `"principalId": "660af00b-ad7e-4fed-9767-88f6eb523d0c"` in the `parameters.json` file to be Id of the principle in the SD tenant that you want to project into the customers tenant. Then, when logged in as a subscription owner to the customers tenant:

`az deployment sub create --template-file .\lighthouse-arm.json --parameters .\lighthouse-parameters.json --location "australiaeast"`
