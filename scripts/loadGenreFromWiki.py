#export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/
from lxml import html
import requests
import MySQLdb
import re

problems = set()

con = MySQLdb.connect(host='localhost', user='root', passwd='230163',db='mc536db07')

c = con.cursor()
c.execute('SELECT wiki_address FROM MusicalArtist')

wiki_address = c.fetchone()
while(wiki_address):
	page = requests.get(wiki_address[0])
	tree = html.fromstring(page.text)

	title = tree.xpath('//h1[@id="firstHeading"]/span/text()')
	vcard = tree.xpath('//table[@class="infobox vcard plainlist"]')
	for v in vcard:
		for tr in v:
			if(len(tr) > 1):
				if len(tr[0]) > 0 and tr[0][0].text == "Genres":
					for genre in tr[1]:
						genre_address = genre.get('href')
						genre_name = genre.text
						if(genre.get('href') == None):
							problems.append(wiki_address[0])
						else:
							print "INSERT IGNORE INTO MusicalGenre (genre_name,wiki_address) VALUES (\""+genre_name+"\", \"http://en.wikipedia.org"+genre_address+"\");"
							print "INSERT IGNORE INTO ArtistGenre (genre_id,artist_id) VALUES ((SELECT id FROM MusicalGenre WHERE wiki_address=\"http://en.wikipedia.org"+genre_address+"\"),(SELECT id FROM MusicalArtist WHERE wiki_address=\""+wiki_address[0]+"\"));"

		#print "UPDATE MusicalArtist SET artistic_name=\""+title[0]+"\", creation_date=\""+active+"\" WHERE wiki_address=\""+wiki_address[0]+"\";"

	wiki_address = c.fetchone()

if(len(problems) > 0):
	print "PROBLEM WITH THE FOLLOWING WIKIS"
	for p in problems:
		print p