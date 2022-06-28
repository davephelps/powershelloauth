#Install-Module -Name MSAL.PS -RequiredVersion 4.2.1.3
#Import-Module MSAL.PS
#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$tenandId="<your tenant id>"
$clientid="<your client id>"
$accessToken=Get-MsalToken -ClientId $clientid -TenantId $tenandId -Interactive -Scope 'https://dptestadi.onmicrosoft.com/account/.default'| Select-Object -Property AccessToken

$uri="https://davephelps.azure-api.net/account/customeraccount"
$headers = @{
    Authorization = "Bearer " + $accessToken.AccessToken
    'Ocp-Apim-Subscription-Key' = '97ee1cc2682944a282597a864626c4d6'
}

Invoke-RestMethod -Uri $uri -Method Get -Headers $headers -Body $body
