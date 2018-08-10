/*STRUCTURE DE BASE*/
CREATE TEMPORARY TABLE (

);
/* Modifier , comme d'hab */
ALTER TABLE TMP_Animal ADD column date_naissance DATETIME;

/*Suppression*/
DROP TEMPORARY TABLE TMP_Animal;

/*On peut créer une copie table temporaire d''une table*/

CREATE TEMPORARY TABLE nom_de_table LIKE ancienne_table;

CREATE TABLE Espece_cpy LIKE Espece;

INSERT INTO Espece_cpy SELECT * FROM Espece;
--Ajout des données à la création--
DROP TEMPORARY TABLE TMP_Animal;
CREATE TEMPORARY TABLE TMP_Animal
SELECT * FROM animal;
