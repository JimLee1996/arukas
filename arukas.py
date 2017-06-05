
from requests import get
import json


token = ''
secret = ''


url = 'https://app.arukas.io/api/containers'
header = {'Content-Type': 'application/vnd.api+json', 'Accept': 'application/vnd.api+json'}

try:
    r = get(url, auth=(token, secret), headers=header)    
    data_json = r.text
    
    data = json.loads(data_json)['data']
    
except:
    data = []
    
print(data)

