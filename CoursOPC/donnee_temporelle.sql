DAY(date);
DAYOFWEEK(date) -- Donne l'index du jour de la semaine (1 à 7)
DAYNAME(date) -- Donne le jour de la semaine en nom
DAYOFYEAR(date) -- Retourne le numéro du jour par apport à l'année

--Mettre en français:
SET lc_time_names = 'fr_FR';

WEEK(date);

MONTH(date);
MONTHNAME(date);

YEAR(date);

TIME(date);
HOUR(date);
MINUTE(date);
SECOND(date);


SELECT nom, date_naissance, CONCAT('Le ', DAYNAME(date_naissance),' ', DAY(date_naissance),' ', MONTHNAME(date_naissance),' ', YEAR(date_naissance)) as 'Date complète' FROM animal WHERE id = 57;

--C'est long !, donc on utilise DATE_FORMAT--
SELECT nom,date_naissance, DATE_FORMAT(date_naissance, 'Le %W %d %M %Y') as 'Date complète' from animal WHERE id=57;

--CALCULS SUR LES DATES/HEURES--
DATEDIFF(date1,date2); Donne le résultat en nombre de jours
TIMEDIFF(); Donne le résultat sous forme TIME()
TIMESTAMPDIFF(unit, date1,date2); -> Résultat que l''on veut.



SELECT ADDDATE(NOW(),INTERVAL 3 DAY) as date_interval;

SELECT SUBDATE(now(), INTERVAL 3 DAY);

TIME_TO_SEC();
