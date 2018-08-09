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
