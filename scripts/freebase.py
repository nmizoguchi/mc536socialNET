import json
import urllib

api_key = "AIzaSyDG00-k7K1XwuaxhHNyi4CycEENhbtdrZ0"
query = 'Iron Maiden'
service_url = 'https://www.googleapis.com/freebase/v1/search'
lang = "en"
params = {
        'query': query,
        'key': api_key,
        'lang' : lang,
       'indent' : 'true',
       'filter' : "(all type:music)"

}
url = service_url + '?' + urllib.urlencode(params)
response = json.loads(urllib.urlopen(url).read())
for result in response['result']:
    print result