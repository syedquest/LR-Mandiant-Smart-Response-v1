[CmdletBinding()]
param(
[Parameter(Mandatory=$true)][string]$APIKey,
[Parameter(Mandatory=$true)][string]$APISecret
)

# Function to fetch token for the provided API key and API secret

	$endpoint = "https://api.intelligence.mandiant.com/token"
	#$apiKey = ""
	#$apiSecret = ""
	$Header = @{
		"Content-Type" = "application/x-www-form-urlencoded"
		"Accept" = "application/json"
		"X-App-Name" = "Mandiant Threat Intel"
	}

	# Create the base64-encoded credentials string
 	$credentials = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$($apiKey):$($apiSecret)"))
 	$Header["Authorization"] = "Basic $credentials"
    
	# Create the request body data
	$bodyData = "grant_type=client_credentials"

	# Send the request using Invoke-RestMethod
	$response = Invoke-RestMethod -Uri $endpoint -Method POST -Headers $Header -Body $bodyData -UserAgent "Mozilla/5.0"

	# Output the response
	write-host $response
