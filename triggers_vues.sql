--1--
CREATE OR REPLACE VIEW view_evenement_participations AS
SELECT magasin.nommag, magasin.codepostal, evenement.id, group_concat(DISTINCT evenement.nomevent,' '), COUNT(participation.numcli) FROM magasin
INNER JOIN evenement ON magasin.id = evenement.id
LEFT JOIN participation ON evenement.nomevent = participation.nomevent
GROUP BY magasin.id
ORDER BY magasin.id;

SELECT * FROM view_evenement_participations;
--2--
CREATE TABLE article_log like article;
INSERT article_log SELECT * FROM article;

alter table article_log drop primary key, modify id smallint(6) not null;
alter table article_log add column datemodif datetime;
alter table article_log add column usermodif varchar(50) not null;
alter table article_log add column newprixvente decimal(8, 2);
alter table article_log add column newcoutrevient decimal(8, 2);
alter table article_log add column newlibelle varchar(80);

START TRANSACTION;
DELIMITER |
CREATE TRIGGER after_update_article AFTER UPDATE ON article FOR EACH ROW
BEGIN
    INSERT INTO article_log (prixvente,coutrevient,id, libelle,usermodif,newprixvente,newcoutrevient, newlibelle, datemodif) VALUES
      (old.prixvente, old.coutrevient, old.id, old.libelle, CURRENT_USER(), new.prixvente, new.coutrevient, new.libelle, NOW());
END |
DELIMITER ;

START TRANSACTION;
DELIMITER |
CREATE TRIGGER after_delete_article AFTER DELETE ON article FOR EACH ROW
begin
  INSERT INTO article_log (prixvente,coutrevient,id, libelle,usermodif,newprixvente,newcoutrevient, newlibelle, datemodif) VALUES
    (old.prixvente, old.coutrevient, old.id, old.libelle, CURRENT_USER(), null, null, null, NOW());
END |
DELIMITER ;

DELETE FROM article WHERE prixvente = 4.99;

--3--
