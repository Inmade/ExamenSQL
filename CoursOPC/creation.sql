----
CREATE DATABASE elevage;
DROP DATABASE elevage;
----
CREATE TABLE IF NOT EXISTS Animal(
  id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  espece VARCHAR(40) NOT NULL,
  sexe CHAR(1),
  date_de_naissance DATETIME NOT NULL,
  commentaires TEXT,
  nom VARCHAR(30),
  PRIMARY KEY(id)
)engine=INNODB;

--Table test--
CREATE TABLE Test_tuto(
  id INT NOT NULL,
  nom VARCHAR(10) NOT NULL,
  PRIMARY KEY(id)
)engine=innodb;

ALTER TABLE Test_tuto CHANGE nom prenom VARCHAR(30) NOT NULL;

ALTER TABLE Test_tuto CHANGE id id BIGINT NOT NULL;

ALTER TABLE Test_tuto MODIFY id BIGINT NOT NULL AUTO_INCREMENT;
--Insérer des données--
INSERT INTO Animal VALUES(1,'Chien','M','2010-04-05 13:43:00','Rox','Mordille beaucoup'),
(2,'chat',NULL,'2010-03-24 02:23:00','Roucky',NULL),
(NULL,'chat','F','2010-09-13 15:02:00','Schtrumpfette',NULL);
/*Préciser une colonne*/
INSERT INTO Animal (sexe, date_de_naissance) VALUES('TORTUES','M','2009-08-03 05:12:00');
INSERT INTO Animal (sexe, date_de_naissance) VALUES('M','2009-08-03 05:12:00');

--Insérer dans la table Animal--
fichier remplissageAnimal.sql
--Charger un fichier--
LOAD DATA LOCAL INFILE 'personne.csv'
INTO TABLE Personne
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n' -- ou '\r\n' selon l'ordinateur et le programme utilisés pour créer le fichier
IGNORE 1 LINES
(nom,prenom,date_naissance);
