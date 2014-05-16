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
# f = open('insert_likes.sql', 'r')
f = open('missingData', 'r')
fileText = f.read()

#match = re.findall(r"http://en.wikipedia.org/wiki/[^\"]+", fileText)
match = re.findall(r"http://en.wikipedia.org/wiki/[^ ]+", fileText)

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
	if(old == len(g)):
		print a.getDBPediaAddress()
	i = i+1
print "done loading. Saving..."
g.serialize(destination='missingArtists.txt', format='turtle')