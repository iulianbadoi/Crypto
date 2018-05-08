from urllib.request import urlopen
from bs4 import BeautifulSoup
import re
def upperOnly(s):
    onlyCaps = ""
    wasGood = False
    for char in s:
        if char == '(':
            wasGood = True
        if char.isupper() == True and wasGood:
            onlyCaps += char

    return onlyCaps
def cleanhtml(raw_html):
  cleanr = re.compile('<.*?>')
  cleantext = re.sub(cleanr, '', raw_html)
  return cleantext
quote_page = "https://www.upfolio.com/100-coins-explained"
page = urlopen(quote_page)


soup = BeautifulSoup(page, "html.parser")
coin_name_box = soup.find_all("h3", attrs={"class": "coinname"})
coin_summary_box = soup.find_all("p", attrs={"class":"cointext"})

T = len(coin_name_box)
for i in range(0, T, 1 ):
    newname = upperOnly(str(coin_name_box[i]))
    newsummary = cleanhtml(str(coin_summary_box[i]))
    format_string = "summaries.put('{}', '{}');".format( newname, newsummary)
    print (format_string)

