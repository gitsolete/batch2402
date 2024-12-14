import requests

# Salesforce OAuth endpoint
auth_url = 'https://login.salesforce.com/services/oauth2/token'

# Your Salesforce Connected App credentials
client_id = 'your_consumer_key'  # From your Connected App
client_secret = 'your_consumer_secret'  # From your Connected App
username = 'your_salesforce_username'
password = 'your_salesforce_password'
security_token = 'your_security_token'  # Reset this if you haven't done so

# Step 1: Get the access token (OAuth 2.0 flow)
payload = {
    'grant_type': 'password',
    'client_id': client_id,
    'client_secret': client_secret,
    'username': username,
    'password': f"{password}{security_token}",
}

response = requests.post(auth_url, data=payload)
auth_data = response.json()

# Extract the access token and instance URL
access_token = auth_data['access_token']
instance_url = auth_data['instance_url']

# Step 2: Make an API request (e.g., to query Salesforce data)
query_url = f"{instance_url}/services/data/v53.0/query"
query = "SELECT Id, Name FROM Account LIMIT 10"
headers = {'Authorization': f'Bearer {access_token}'}

response = requests.get(query_url, headers=headers, params={'q': query})
data = response.json()

# Step 3: Process the retrieved data
for record in data['records']:
    print(record['Name'])
