--1--
CREATE USER 'user1'@'localhost' identified by 'user';
CREATE USER 'user2'@'localhost' identifed by 'user';
--2--
GRANT SELECT ON magasins.* TO 'user1'@'localhost';
--3--
GRANT SELECT, LOCK TABLES, CREATE ON magasins.* TO 'user2'@'localhost';
GRANT INSERT ON magasins.participation TO 'user2'@'localhost';
--4--
SET AUTOCOMMIT = 0;

START TRANSACTION;
SAVEPOINT supprimerTout;
INSERT INTO evenement(dateevent, nomevent, id) VALUES ('2018-04-02 08:00:00','Concert', 4);
SAVEPOINT annulerParticipants;
INSERT INTO participation(numcli, nomevent) VALUES (5,'Concert');
ROLLBACK TO annulerParticipants;
ROLLBACK TO supprimerTout;
COMMIT;
--5--
START TRANSACTION;
LOCK TABLES client READ, participation, READ, evenement WRITE;
UPDATE evenement INNER JOIN client ON evenement.id = client.numcli SET dateevent = DATE_ADD(dateevent, INTERVAL 1 DAY)
WHERE client.nomcli LIKE 'C%';
COMMIT;
--6--
START TRANSACTION;
LOCK TABLE evenement WRITE;
UPDATE evenement SET dateevent = DATE_ADD(dateevent,INTERVAL 1 DAY);
ROLLBACK;
COMMIT;
