#export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/
import sys
from BeautifulSoup import BeautifulSoup as Soup
import requests
import MySQLdb
import re

problems = set()

con = MySQLdb.connect(host='localhost', user='root', passwd='230163',db='mc536db07')

c = con.cursor()
c.execute('SELECT artistic_name FROM MusicalArtist WHERE image_small IS NULL')

artist_name = c.fetchone()
while(artist_name):
	if(artist_name[0] != None):
		page = "http://ws.audioscrobbler.com/2.0/?method=artist.getInfo&api_key=8c091f990cef371a42d1c92a25f8cef8&artist="
		page = requests.get(page+artist_name[0])

		soup = Soup(page.text)
		if(soup.artist != None):
			small = soup.artist.findAll('image',attrs={"size":"small"})[0].string
			medium = soup.artist.findAll('image',attrs={"size":"medium"})[0].string
			large = soup.artist.findAll('image',attrs={"size":"large"})[0].string
			mega = soup.artist.findAll('image',attrs={"size":"mega"})[0].string

		if(small != None and medium != None and large != None and mega != None):
			print "UPDATE MusicalArtist SET "+"image_small=\""+small.encode('utf-8')+"\", "+"image_medium=\""+medium.encode('utf-8')+"\", "+"image_large=\""+large.encode('utf-8')+"\", "+"image_mega=\""+mega.encode('utf-8')+"\" WHERE artistic_name=\""+artist_name[0]+"\";"

	artist_name = c.fetchone()