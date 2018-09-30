
import requests

# Those paylog were collected from F12 Firefox > Network > Sniffing the params from HTTP POST sent
payload = {
    'userid': 'ID@a.com',
    'password': 'Passwd',
    'SUBMIT.x': '10',
    'SUBMIT.y': '8'
    
}

# Those URLs were collected from the same above HTTP POST for authentication and HTTP GET for download
# .Session() keeps the cookies sent thru connection

with requests.Session() as s:
    p = s.post('https://thegdpr.email/index.html', data=payload, verify=False)
    print (p.text)
    r = s.get('https://thegdpr.email/URI?URI&URI=File')
    print (r.text)
