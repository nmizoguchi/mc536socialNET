#!/usr/bin/python
import re
import rdflib

class MusicalArtist:

	def __init__(self, givenDBpedia):
		self.DBpedia = givenDBpedia

	def getDBPediaAddress(self):
		return self.DBpedia

	def getWikiAddress(self):
		return re.sub(r"http://dbpedia.org/resource/","http://en.wikipedia.org/wiki/", self.DBpedia)

g=rdflib.Graph()
g.parse("missingArtists.txt", format="turtle")

print "Finished loading. Start processing..."

queryArtist = """SELECT DISTINCT ?dbpediaAddress ?name ?startYear
       WHERE {
          ?dbpediaAddress foaf:name ?name .
          ?dbpediaAddress dbpedia-owl:activeYearsStartYear ?startYear .
       }"""

qres = g.query(queryArtist)

artists = dict()

for row in qres:
	artist = MusicalArtist(str(row[0]))
	#print("%s has name %s and started in %s" %(row[0], row[1], row[2]))

	if row[1] is not None:
		artist.name = row[1]

	if row[2] is not None:
		artist.startYear = row[2]

	artists[str(row[0])] = artist

	print "UPDATE MusicalArtist SET artistic_name=\""+artist.name+"\", creation_date=\""+artist.startYear+"\" WHERE wiki_address=\""+artist.getWikiAddress()+"\";"

for a in artists.values():
	#######################################
	##### INSERT CITIES AND COUNTRIES #####
	#######################################

	queryHometown = """SELECT DISTINCT ?hometown
       WHERE {
          <"""+a.getDBPediaAddress()+"""> dbpedia-owl:hometown ?hometown .
       }"""

	# Find triples that indicates hometown
	qres = g.query(queryHometown)
	
	for row in qres:

		# Load the RDF for each hometown found
		g2 = rdflib.Graph()
		g2.load(str(row[0]))

		queryCities = """SELECT DISTINCT ?country ?cityName ?cityWiki
	       WHERE {
	          ?cityWiki a dbpedia-owl:Settlement .
	          ?cityWiki dbpedia-owl:country ?country .
	          ?cityWiki foaf:name ?cityName .
	       }"""
		qres = g2.query(queryCities)

		for row2 in qres:
			#######################################
			# FINDING COUNTRIES, load country triples in another graph
			g3=rdflib.Graph()
			g3.load(str(row2[0]))

			queryCountry = """SELECT DISTINCT ?countryName ?wiki
	       WHERE {
	          ?wiki foaf:name ?countryName .
	       }"""

			countrynames = g3.query(queryCountry)

			a.country = None
			a.countryWiki = None

			for row3 in countrynames:
				#######################################
				# Adding Country to object and print insert query
				a.country = str(row3[0].encode('utf-8'))
				a.countryWiki = str(row3[1].encode('utf-8'))

				if a.country is not None and a.country is not "":
					print "INSERT INTO Country (country_name,resource) VALUES (\""+a.country+"\",\""+a.countryWiki+"\");"
					break
			#######################################
			# Adding City to object and print insert query
			a.city=str(row2[1].encode('utf-8'))
			a.cityWiki=str(row2[2].encode('utf-8'))
			print a.DBpedia, a.city, a.cityWiki
			if a.city is not None and a.city is not "" and a.country is not None and a.country is not "":
				print "INSERT INTO City (city_name,resource,country_id) VALUES (\""+a.city+"\",\""+a.cityWiki+"\", (SELECT id FROM Country WHERE resource=\""+a.countryWiki+"\"));"
				print "UPDATE MusicalArtist SET city_id=(SELECT id FROM City WHERE resource=\""+a.cityWiki+"\") WHERE wiki_address=\""+a.getWikiAddress()+"\";"
				break
