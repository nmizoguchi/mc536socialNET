CREATE TABLE Person (
id INT NOT NULL AUTO_INCREMENT,
login VARCHAR(20) NOT NULL,
name VARCHAR(40),
hometown VARCHAR(40),
PRIMARY KEY(id),
UNIQUE(login)
);

CREATE TABLE Knows (
id INT NOT NULL AUTO_INCREMENT,
person_id INT NOT NULL,
colleague_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (person_id) REFERENCES Person(id) ON DELETE CASCADE,
FOREIGN KEY (colleague_id) REFERENCES Person(id) ON DELETE CASCADE,
UNIQUE(person_id,colleague_id)
);

CREATE TABLE Blocks (
id INT NOT NULL AUTO_INCREMENT,
blocker_id INT NOT NULL,
blocked_id INT NOT NULL,
block_reason INT NOT NULL,
block_reason_other VARCHAR(200),
PRIMARY KEY(id),
FOREIGN KEY (blocker_id) REFERENCES Person(id) ON DELETE CASCADE,
FOREIGN KEY (blocked_id) REFERENCES Person(id) ON DELETE CASCADE
);

CREATE TABLE Country (
id INT NOT NULL AUTO_INCREMENT,
country_name VARCHAR(40),
resource VARCHAR(200),
UNIQUE(resource),
UNIQUE(country_name),
PRIMARY KEY(id)
);

CREATE TABLE City (
id INT NOT NULL AUTO_INCREMENT,
city_name VARCHAR(40),
country_id INT,
resource VARCHAR(200),
FOREIGN KEY (country_id) REFERENCES Country(id) ON DELETE CASCADE,
UNIQUE(city_name),
UNIQUE(resource),
PRIMARY KEY(id)
);

CREATE TABLE MusicalArtist (
id INT NOT NULL AUTO_INCREMENT,
artistic_name VARCHAR(40),
city_id INT,
creation_date DATE,
wiki_address VARCHAR(200),
FOREIGN KEY (city_id) REFERENCES City(id) ON DELETE CASCADE,
UNIQUE(wiki_address),
PRIMARY KEY(id)
);

CREATE TABLE MusicalGenre (
id INT NOT NULL AUTO_INCREMENT,
genre_name VARCHAR(40) NOT NULL,
UNIQUE(genre_name),
PRIMARY KEY(id)
);

CREATE TABLE ArtistGenre (
id INT NOT NULL AUTO_INCREMENT,
artist_id INT NOT NULL,
genre_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES MusicalArtist(id) ON DELETE CASCADE,
FOREIGN KEY (genre_id) REFERENCES MusicalGenre(id) ON DELETE CASCADE,
UNIQUE(artist_id,genre_id),
PRIMARY KEY(id)
);

CREATE TABLE Musician (
id INT NOT NULL AUTO_INCREMENT,
real_name VARCHAR(40) NOT NULL,
style_id VARCHAR(40),
birth_date DATE,
PRIMARY KEY(id)
);

CREATE TABLE PlaysIn (
id INT NOT NULL AUTO_INCREMENT,
musician_id INT NOT NULL,
musical_artist_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (musician_id) REFERENCES Musician(id) ON DELETE CASCADE,
FOREIGN KEY (musical_artist_id) REFERENCES MusicalArtist(id) ON DELETE CASCADE
);

CREATE TABLE LikesMusic (
id INT NOT NULL AUTO_INCREMENT,
person_id INT NOT NULL,
artist_id INT NOT NULL,
rating INT,
PRIMARY KEY(id),
FOREIGN KEY (person_id) REFERENCES Person(id) ON DELETE CASCADE,
FOREIGN KEY (artist_id) REFERENCES MusicalArtist(id) ON DELETE CASCADE
);