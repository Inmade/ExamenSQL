--SYNTAXE--
CREATE TRIGGER nom_trigger moment_trigger evenement_trigger ON nom_table FOR EACH ROW corps_trigger;
--Supprimer-
DROP TRIGGER nom_trigger;
--EXEMPLES
DELIMITER |
CREATE TRIGGER before_insert_animal BEFORE INSERT ON Animal FOR EACH ROW
BEGIN

END |
DELIMITER ;
SELECT id, sexe, date_naissance, nom
FROM Animal
WHERE id = 20;
UPDATE Animal
SET sexe = 'Z'
WHERE id = 20;


DELIMITER |
CREATE TRIGGER before_update_animal BEFORE UPDATE
ON Animal FOR EACH ROW
BEGIN
  IF NEW.SEXE IS NOT NULL
  AND NEW.SEXE != 'M'
  AND NEW.SEXE != 'F'
  AND NEW.SEXE != 'A' THEN
    SET NEW.SEXE = NULL;
  END IF;
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER before_update_animal BEFORE UPDATE
ON Animal FOR EACH ROW
BEGIN
    IF NEW.sexe IS NOT NULL   -- le sexe n'est ni NULL
    AND NEW.sexe != 'M'       -- ni "M"âle
    AND NEW.sexe != 'F'       -- ni "F"emelle
    AND NEW.sexe != 'A'       -- ni "A"utre
      THEN
        SET NEW.sexe = NULL;
    END IF;
END |
DELIMITER ;

NEW = LUES ET MODIFER
OLD = LUES
