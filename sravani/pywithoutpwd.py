import requests
import json
from urllib.parse import urlencode

# Salesforce OAuth endpoints
auth_url = 'https://login.salesforce.com/services/oauth2/authorize'
token_url = 'https://login.salesforce.com/services/oauth2/token'

# Your connected app's client ID and client secret
client_id = '3MVG94Jqh209Cp4Qf2v94foIOnnSwZjVlccAU.fY0.4X9CJO8Z4IvTA4XTyF3oRC0R_MKrNeSuNF2s2qnbW0j'  # Consumer Key from Connected App
client_secret = 'EDBCF2E31B13457A4B022E32356E9014633999BBCC4BF7E316AA9A2EB2BF7088'  # Consumer Secret from Connected App
redirect_uri = 'http://localhost:8080'  # Your redirect URI

# Step 1: Redirect the user to Salesforce's authorization URL
auth_params = {
    'response_type': 'code',
    'client_id': client_id,
    'redirect_uri': redirect_uri
}
auth_redirect_url = f"{auth_url}?{urlencode(auth_params)}"
print(f"Go to the following URL to authorize: {auth_redirect_url}")

# Once the user authorizes, Salesforce will redirect to your callback URL with a code
auth_code = input("Enter the code from the URL: ")

# Step 2: Exchange the authorization code for an access token
token_params = {
    'grant_type': 'authorization_code',
    'code': auth_code,
    'client_id': client_id,
    'client_secret': client_secret,
    'redirect_uri': redirect_uri
}

# Sending the POST request to get the access token
response = requests.post(token_url, data=token_params)
auth_data = response.json()

# Step 3: Check if we successfully got the access token
if 'access_token' in auth_data:
    access_token = auth_data['access_token']
    instance_url = auth_data['instance_url']
    print(f"Successfully authenticated. Access token: {access_token}")

    # Step 4: Use the access token to make API requests to Salesforce
    query_url = f"{instance_url}/services/data/v53.0/query"
    query = "SELECT Id, Name FROM Account LIMIT 10"
    headers = {'Authorization': f'Bearer {access_token}'}

    api_response = requests.get(query_url, headers=headers, params={'q': query})
    api_data = api_response.json()

    # Step 5: Process the retrieved data
    if 'records' in api_data:
        for record in api_data['records']:
            print(record['Name'])
    else:
        print("No records found.")
else:
    # If there's an error with authentication, print the error
    print(f"Authentication failed: {auth_data.get('error_description', 'Unknown error')}")
