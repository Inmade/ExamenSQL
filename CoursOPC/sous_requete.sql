SELECT MIN(date_naissance) FROM ( SELECT Animal.id, Animal.sexe, Animal.date_naissance, Animal.nom, Animal.espece_id FROM Animal INNER JOIN Espece ON Espece.id = Animal.espece_id
    WHERE sexe = 'F'
    AND Espece.nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone')
) AS tortues_perroquets_F;

SELECT *
FROM Animal
WHERE espece_id < ANY -- ou ALL --
(
    SELECT id
    FROM Espece
    WHERE nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone')
);
