#!/usr/bin/python
import re
import rdflib

class MusicalArtist:

	def __init__(self, givenWikiAddress):
		self.wikiAddress = givenWikiAddress

	def getDBPediaAddress(self):
		return re.sub(r"http://en.wikipedia.org/wiki/", "http://dbpedia.org/resource/", self.wikiAddress)

###
#	Start
###
f = open('insert_likes.sql', 'r')
fileText = f.read()

match = re.findall(r"http://en.wikipedia.org/wiki/[^']+", fileText)

# remove duplicates
match = list(set(match))

artists = list()
for s in match:
	artist = MusicalArtist(s)
	artists.append(artist)

g=rdflib.Graph()
i = 1
for a in artists:
	print str(i)+" of "+str(len(artists))
	old = len(g)
	g.load(a.getDBPediaAddress())
	i = i+1
	if i==11:
		break
print "done loading. Saving..."
g.serialize(destination='artists.txt', format='turtle')

# They have http://sws.geonames.org/2641364/ http://www.geonames.org/ontology#officialName Northern Ireland