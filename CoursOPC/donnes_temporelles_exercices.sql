SELECT * FROM animal WHERE MONTH(date_naissance)=5;

SELECT * FROM animal WHERE WEEKOFYEAR(date_naissance) < 9;

SELECT DATE_FORMAT(date_naissance,'%d %M') FROM animal INNER JOIN espece ON animal.espece_id = espece.id WHERE espece.id IN(2,3) AND YEAR(date_naissance)<2007;

SELECT DATE_FORMAT(date_naissance,'%d %M, à %lh%i%p, en l''an %Y après J.C.') FROM animal WHERE MONTH(date_naissance)=4 AND DAY(date_naissance) <> 24 ORDER BY TIME(date_naissance) desc;

--CALCULS--

SELECT TIMESTAMPDIFF(DAY,'2008-02-27',date_naissance) FROM animal WHERE nom LIKE 'Moka';

SELECT DATE(ADDDATE(date_naissance, INTERVAL 25 YEAR)) FROM animal WHERE espece_id = 4;

SELECT * FROM ANIMAL WHERE DAY(LAST_DAY(date_naissance)) = 29;
