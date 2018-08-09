  --La base--
  DELIMITER |
  CREATE PROCEDURE afficher_race()
    BEGIN
    SELECT * FROM race;
    END |

DELIMITER |
CREATE PROCEDURE afficher_race_id(IN idespece INT)
  BEGIN
  SELECT id,nom  FROM race WHERE espece_id = idespece;
  END|
DELIMITER ;

call afficher_race_id(2);
--OU--
SET @idespece=2;
call afficher_race_id(@idespece);



DELIMITER |
CREATE PROCEDURE calculer_prix(IN animal_id INT, INOUT p_prix INT)
  BEGIN
    SELECT prix_prix + COALESCE(Race.prix,Espece.prix) INTO p_prix
    FROM ANIMAL
    INNER JOIN Espece ON Espece.id = Animal.espece_id
    LEFT JOIN Race ON Race.id = Animal.race_id
    WHERE Animal.id = animal_id;
  END|
  DELIMITER ;

DROP PROCEDURE calculer_prix;
--Structurer/conditions/variables--
DELIMITER |
CREATE PROCEDURE aujourdhui_demain()
  BEGIN
    DECLARE v_date DATE DEFAULT CURRENT_DATE();
    SELECT DATE_FORMAT(v_date,'%W %e %M %Y') as Aujourdhui;

    SET v_date = v_date + INTERVAL 1 DAY;
    SELECT DATE_FORMAT(v_date, '%W %e %M %Y') as Demain;
  END |
  DELIMITER;
--IF--
DELIMITER |
CREATE PROCEDURE est_adopte(IN p_animal_id INT)
  BEGIN
    DECLARE v_nb INT DEFAULT 0;

    SELECT count(*) INTO v_nb FROM Adoption WHERE animal_id = p_animal_id;
    IF v_nb > 0 THEN
    SELECT 'Jai déjà été adopté';
    END IF;

  END|
DELIMITER ;
--IF/ELSE--
DELIMITER |
CREATE PROCEDURE message_sexe(IN p_animal_id INT)
  BEGIN
    DECLARE v_sexe VARCHAR(50);
    SELECT sexe INTO v_sexe FROM animal where id = p_animal_id;
    IF(v_sexe = 'M') THEN
    select 'Je suis un male';
    ELSEIF (v_sexe = 'F') THEN
    select 'Je suis une femelle';
    ELSE
    select 'Je suis non binaire';
    END IF;
  END|
DELIMITER ;

PAREIL avec WHILE DO/ END WHILE
DELIMITER |
CREATE PROCEDURE message_sexe(IN p_animal_id INT)
  BEGIN
    DECLARE v_sexe VARCHAR(50);
    DECLARE v_nombre INT DEFAULT 10;
    SELECT sexe INTO v_sexe FROM animal where id = p_animal_id;
    WHILE v_nombre < 11 DO
    IF(v_sexe = 'M') THEN
    select 'Je suis un male';
    ELSEIF (v_sexe = 'F') THEN
    select 'Je suis une femelle';
    ELSE
    select 'Je suis non binaire';
    END IF;
    SET v_nombre = v_nombre+1;
    END WHILE;
  END|
DELIMITER ;
