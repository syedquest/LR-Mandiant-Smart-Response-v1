param(
[Parameter(Mandatory=$true)][string]$tokenBearer,
[Parameter(Mandatory=$true)][string]$fqdn,
[string]$endpoint = "https://api.intelligence.mandiant.com/v4/indicator"
)

# Function to fetch FQDN details for the provided token bearer
$Header = @{
	"Authorization" = "Bearer $tokenBearer"
	"Accept" = "application/json"
	"X-App-Name" = "Mandiant Threat Intel"
}

# Send the request using Invoke-RestMethod
$response = Invoke-RestMethod -Uri "$endpoint/fqdn/$fqdn" -Method GET -Headers $Header 

# Output the response
$response
