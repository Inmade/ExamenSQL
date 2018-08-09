LOCK TABLES Client READ, Adoption WRITE;

LOCK TABLES Client WRITE as tabe_esp;

SELECT * FROM Animal WHERE espece_id = 5 LOCK IN SHARE MODE; -- Correspond à READ

SELECT * from Animal WHERE espece_id = 5 FOR UPDATE; --Correspond à WRITE
