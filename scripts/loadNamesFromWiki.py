from lxml import html
import requests
import MySQLdb
import re

con = MySQLdb.connect(host='localhost', user='root', passwd='230163',db='mc536db07')

c = con.cursor()
c.execute('SELECT wiki_address FROM MusicalArtist WHERE artistic_name is NULL')

wiki_address = c.fetchone()
while(wiki_address):
	page = requests.get(wiki_address[0])
	tree = html.fromstring(page.text)

	title = tree.xpath('//h1[@id="firstHeading"]/span/text()')
	vcard = tree.xpath('//table[@class="infobox vcard plainlist"]')
	
	for v in vcard:
		for tr in v:
			if(len(tr) > 1):
				if(tr[0].text == "Origin" and tr[1] != None):
					locations = tr[1]
					if len(locations) > 0:
						city = locations[0].text
					else:
						city = None
				if(tr[0].text == "Years active" and tr[1].text != None):
					mat = re.match(r"[0-9]+",tr[1].text)
					if(mat != None):
						active = mat.group(0)+"-00-00"

		print "UPDATE MusicalArtist SET artistic_name=\""+title[0]+"\", creation_date=\""+active+"\" WHERE wiki_address=\""+wiki_address[0]+"\";"

	wiki_address = c.fetchone()