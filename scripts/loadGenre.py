#!/usr/bin/python
import re
import rdflib

def getWikiAddress(string):
	return re.sub(r"http://dbpedia.org/resource/","http://en.wikipedia.org/wiki/", string)

g=rdflib.Graph()
g.parse("artists.txt", format="turtle")

print "Finished loading. Start processing..."

queryArtist = """SELECT DISTINCT ?dbpediaAddress ?genre
       WHERE {
          ?dbpediaAddress dbpedia-owl:genre ?genre .
       }"""

qres = g.query(queryArtist)

artists = dict()

for row in qres:
	### LOAD GENRE
	g2 = rdflib.Graph()
	g2.load(str(row[1]))

	# Find triples that indicates hometown
	queryGenre = """SELECT DISTINCT ?name
       WHERE {
          <"""+str(row[1])+"""> foaf:name ?name .
       }"""
	qres = g2.query(queryGenre)
	
	for row2 in qres:
		print "INSERT INTO MusicalGenre (genre_name) VALUES (\""+str(row2[0])+"\");"
		print "INSERT INTO ArtistGenre (genre_id,artist_id) VALUES ((SELECT id FROM MusicalGenre WHERE genre_name=\""+str(row2[0])+"\"),(SELECT id FROM MusicalArtist WHERE wiki_address=\""+getWikiAddress(str(row[0]))+"\");"
