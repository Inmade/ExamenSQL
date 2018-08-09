--Les vues servent à ne pas devoir retaper un select à chaque fois mais juste à retaper le nom--


--Création de la vue--
CREATE VIEW nom_vue as ...;

CREATE VIEW V_Animal_details
AS SELECT Animal.id, Animal.sexe, Animal.date_naissance, Animal.nom, Animal.commentaires,
       Animal.espece_id, Animal.race_id, Animal.mere_id, Animal.pere_id, Animal.disponible,
       Espece.nom_courant AS espece_nom, Race.nom AS race_nom
FROM Animal
INNER JOIN Espece ON Animal.espece_id = Espece.id
LEFT JOIN Race ON Animal.race_id = Race.id;

SELECT * FROM V_Animal_details;

DESCRIBE V_Animal_details;
