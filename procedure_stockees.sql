--1--
DELIMITER |
CREATE PROCEDURE compter_nb_achats (IN date1 DATE, IN date2 DATE, OUT nbAchats INT)
  BEGIN
    SELECT COUNT(*) INTO nbAchats FROM achat WHERE dateachat BETWEEN date1 AND date2;
  END|
DELIMITER ;
--2--
START TRANSACTION;
DELIMITER |
CREATE PROCEDURE augmenter_prix (IN total INT, OUT nb INT)
  BEGIN
  DECLARE v_prixventemoyen NUMERIC(8,2);
  SET nb=0;
    SELECT AVG(prixvente) INTO v_prixventemoyen FROM article;
    WHILE v_prixventemoyen <= total
    DO
    UPDATE article SET prixvente = prixvente+0.05;
      SELECT AVG(prixvente) INTO v_prixventemoyen FROM article;
      SET nb=nb+1
    END WHILE;
  END|
DELIMITER ;

--3--
START TRANSACTION;
DELIMITER |
CREATE PROCEDURE supprimer(IN nom_event VARCHAR(30), IN valeur INT)
  BEGIN
  DECLARE nbParticipant INT;
  SELECT COUNT(numcli) INTO nbParticipant from participation;
  IF nbParticipant <valeur
  THEN
    DELETE FROM participation WHERE nomevent LIKE nom_event;
    DELETE FROM evenement WHERE nomevent LIKE nom_event;
  END IF;
  END |
DELIMITER ;
--4--
START TRANSACTION;
DELIMITER |
CREATE PROCEDURE retrouver(IN date1 DATE)
BEGIN
  SELECT 
END |
DELIMITER ;
