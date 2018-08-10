--Les vues servent à ne pas devoir retaper un select à chaque fois mais juste à retaper le nom--


--Création de la vue--
CREATE VIEW (OR REPLACE) nom_vue as SELECT...;

CREATE VIEW V_Animal_details
AS SELECT Animal.id, Animal.sexe, Animal.date_naissance, Animal.nom, Animal.commentaires,
       Animal.espece_id, Animal.race_id, Animal.mere_id, Animal.pere_id, Animal.disponible,
       Espece.nom_courant AS espece_nom, Race.nom AS race_nom
FROM Animal
INNER JOIN Espece ON Animal.espece_id = Espece.id
LEFT JOIN Race ON Animal.race_id = Race.id;

SELECT * FROM V_Animal_details;

DESCRIBE V_Animal_details;
/*Une vue est figé une fois créer, on ne peut donc pas ajouter une table*/
1: On crée une table vue de la table Client => V_Client
2: On rajoute une colonne Couleur_de_cheveux à la table Client
3: La table V_Client n''a pas la colonne Couleur_de_cheveux rajouté
/*ORDER BY passe après le premier ORDER BY*/
Exemple:
CREATE OR REPLACE VIEW V_Race
AS SELECT Race.id, nom, Espece.nom_courant AS espece
FROM Race
INNER JOIN Espece ON Espece.id = Race.espece_id
ORDER BY nom;

SELECT *
FROM V_Race;
-- Sélection sans ORDER BY, on prend l'ORDER BY de la définition

SELECT *
FROM V_Race
ORDER BY espece;
-- Sélection avec ORDER BY, c'est celui-là qui sera pris en compte
