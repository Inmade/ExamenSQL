--1--
//
--2--
SELECT * FROM CLIENT ORDER BY datenaissclient DESC LIMIT 3;
--3--
SELECT CASE WHEN prixmaison < 400 then 'Bon marché' WHEN prixmaison <=800 then 'Prix du marché' ELSE 'Luxe' END AS Categorie FROM maison
INNER JOIN location on maison.idmaison = location.idmaison GROUP BY Categorie;
--4--
SELECT * FROM personnel WHERE salairepersonnel = (SELECT max(salairepersonnel) FROM PERSONNEL WHERE prenompersonnel LIKE BINARY 'J%n');
--5--
UPDATE maison INNER JOIN location ON maison.idmaison = location.idmaison SET maison.prixmaison = maison.prixmaison*1.1 WHERE datedeblocation IN ('2018-05-01', '2018-05-31') AND MONTH(datefinlocation)=5;
--6--
SELECT departement.nomdepartement, departement.budgetdepartement, SUM(personnel.salairepersonnel*12) as totSalaire, directeur.salairepersonnel as Directeur FROM departement
LEFT JOIN personnel ON departement.nomdepartement = personnel.nomdepartement
INNER JOIN personnel as Directeur ON departement.nomdepartement = directeur.nomdepartementresponsable GROUP BY nomdepartement
HAVING totSalaire < departement.budgetdepartement AND totSalaire > directeur.salairepersonnel*12 OR totSalaire IS NULL ;
--7--
SELECT maison.*, group_concat('du',location.datedeblocation, 'au',location.datefinlocation, 'louée par',client.idclient,'(',client.nomclient, client.prenomclient,')' SEPARATOR '****')
FROM maison INNER JOIN location ON maison.idmaison = location.idmaison
INNER JOIN client ON location.idclient = client.idclient
WHERE location.datedeblocation BETWEEN now() AND now() + INTERVAL 3 MONTH group by maison.idmaison;
--8--
SELECT departement.nomdepartement,COALESCE(SUM(service.prixservice),0) FROM service
RIGHT JOIN departement ON service.nomdepartement = departement.nomdepartement
INNER JOIN demandeservice ON service.nomservice = demandeservice.nomservice
WHERE YEAR (demandeservice.datedemande) = 2018
GROUP BY service.nomdepartement;
--9--
SELECT client.nomclient, client.prenomclient, SUM(timestampdiff(day, location.datedeblocation, location.datefinlocation)*maison.prixmaison) from client
INNER JOIN  location ON client.idclient = location.idclient
INNER JOIN maison ON location.idmaison = maison.idmaison;
--10--
SELECT service.nomservice, count(demandeservice.nomservice) as nbDemande FROM service
LEFT JOIN demandeservice ON service.nomservice = demandeservice.nomservice
WHERE service.dureeservice BETWEEN '03:00:00' AND '05:00:00' GROUP BY service.nomservice
HAVING nbDemande >= 2;
