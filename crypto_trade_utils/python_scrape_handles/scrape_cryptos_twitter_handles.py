import json
from pprint import pprint
from urllib.request import urlopen
from bs4 import BeautifulSoup
import re


def getValue(data, key):
    if key not in data:
        return "-1"
    else:
        return data[key]

#read json
data = json.load(open('parse.txt'))
print(len(data['data']))
#pprint(data['data'][1])

T = len(data['data'])
for i in range(0, T):
    short = getValue(data['data'][i], 'code')
    announce_id = getValue(data['data'][i], 'announcement')
    facebook = getValue(data['data'][i], 'facebook')
    github = getValue(data['data'][i], 'github')
    hashingAlgorithm = getValue(data['data'][i], 'hashingAlgorithm')
    mineable = getValue(data['data'][i], 'mineable')
    proof = getValue(data['data'][i], 'proof')
    site = getValue(data['data'][i], 'site')
    subreddit = getValue(data['data'][i], 'subreddit')
    twitter = getValue(data['data'][i], 'twitter')
    whitepaper = getValue(data['data'][i], 'whitepaper')


    format_string = "cryptoInfo.put('{}', new CryptoInfo('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}' , '{}', '{}');".format(short, announce_id, facebook,github,hashingAlgorithm, mineable,proof,site,subreddit,twitter,whitepaper)
    print (format_string)
