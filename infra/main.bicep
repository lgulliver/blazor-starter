param repoUrl string
param repoBranch string
param repoToken string  {
  secure: true
}
param location string = resourceGroup().location
param appLocation string
param apiLocation string
param appArtifactLocation string

var namePrefix = 'lg'

resource staticApp 'Microsoft.Web/staticSites@2019-12-01-preview' = {
  name: '${namePrefix}${uniqueString(resourceGroup().id)}app'
  location: location
  sku: {
      name: 'Free'
      tier: 'Free'
  }
  properties: {
      repositoryUrl: repoUrl
      branch: repoBranch
      repositoryToken: repoToken
      buildProperties: {
        appLocation: appLocation
        apiLocation: apiLocation
        appArtifactLocation: appArtifactLocation
      }
  }
}