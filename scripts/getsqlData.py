import MySQLdb

con = MySQLdb.connect(host='localhost', user='root', passwd='230163',db='mc536db07')

c = con.cursor()

c.execute("SELECT * FROM Person")
con.commit()
