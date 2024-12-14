from simple_salesforce import Salesforce
import os

# Step 1: Set your Salesforce credentials and Connected App info
sf_username = 'batch2402@awco.in'
sf_password = 'salesforce12345'
sf_security_token = 'Zs6YG61zhR8gennPjsa9GBJM9'  # Reset this if you haven't done so
sf_client_id = '3MVG94Jqh209Cp4Qf2v94foIOnnSwZjVlccAU.fY0.4X9CJO8Z4IvTA4XTyF3oRC0R_MKrNeSuNF2s2qnbW0j'  # From your Connected App
sf_client_secret = 'EDBCF2E31B13457A4B022E32356E9014633999BBCC4BF7E316AA9A2EB2BF7088'  # From your Connected App

# Step 2: Authenticate using simple_salesforce (OAuth is handled internally)
sf = Salesforce(username=sf_username, password=sf_password, security_token=sf_security_token)

# Step 3: Query Salesforce data (e.g., Account records)
accounts = sf.query("SELECT Id, Name FROM Account LIMIT 10")
for account in accounts['records']:
    print(account['Name'])
