SELECT espece.description from ESPECE INNER JOIN Animal on Espece.id = animal.espece_id WHERE animal.nom = "Cartouche";

SELECT espece.decription FROM espece as Description_de_l_espece;

SELECT espece.id as id_espece, espece.description as description, animal.nom as Nom_de_lanimal from ESPECE INNER JOIN Animal on espece.id = animal.espece_id where animal.nom like "Ch%";

SELECT Animal.nom AS nom_animal, espece.nom_courant AS race
FROM Animal
INNER JOIN ESPECE
    ON Animal.espece_id = espece.id
WHERE Animal.espece_id = 2
ORDER BY espece.nom_courant, Animal.nom;

SELECT Animal.nom AS nom_animal, espece.nom_courant AS race
FROM Animal
LEFT JOIN ESPECE
    ON Animal.espece_id = espece.id
WHERE Animal.espece_id = 2
ORDER BY espece.nom_courant, Animal.nom;
