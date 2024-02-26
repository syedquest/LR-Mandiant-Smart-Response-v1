param(
[Parameter(Mandatory=$true)][string]$tokenBearer,
[Parameter(Mandatory=$true)][string]$hash,
[string]$endpoint = "https://api.intelligence.mandiant.com/v4/indicator"
)

# Function to fetch hash details for the provided token bearer
$Header = @{
	"Authorization" = "Bearer $tokenBearer"
	"Accept" = "application/json"
	"X-App-Name" = "Mandiant Threat Intel"
}

# Send the request using Invoke-RestMethod
$response = Invoke-RestMethod -Uri "$endpoint/ipv4/$hash" -Method GET -Headers $Header 

# Output the response
write-host $response
