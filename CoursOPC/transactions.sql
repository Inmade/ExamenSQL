--Quitter le mode auto-commit--
SET autocommit = 0;

COMMIT;
ROLLBACK;

START TRANSACTION;

SAVEPOINT nom_jalon;

ROLLBACK TO nom_jalon;
