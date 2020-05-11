# Azure-Lighthouse

Update the `"principalId": "660af00b-ad7e-4fed-9767-88f6eb523d0c"` in the `parameters.json` file to be Id of the principle in the SD tenant that you want to project into the customers tenant. Then, when logged in as a subscription owner to the customers tenant:

`az deployment create --template-file .\lighthouse-arm.json --parameters .\lighthouse-parameters.json --location "australiaeast"`
