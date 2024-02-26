param(
[Parameter(Mandatory=$true)][string]$tokenBearer,
[Parameter(Mandatory=$true)][string]$IPAddress,
[string]$endpoint = "https://api.intelligence.mandiant.com/v4/indicator"
)

#Function to fetch IP address details for the provided token bearer
$Header = @{
	"Authorization" = "Bearer $tokenBearer"
	"Accept" = "application/json"
	"X-App-Name" = "Mandiant Threat Intel"
}

# Send the request using Invoke-RestMethod
$response = Invoke-RestMethod -Uri "$endpoint/ipv4/$IPAddress" -Method GET -Headers $Header 

# Output the response
write-host $response
