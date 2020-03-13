use database exemple;


--formaliser des requêtes sql - base exemple 

--question 1 à 7

SELECT * FROM employe;

SELECT * FROM dept;

SELECT nom, dateemb, nosup, nodep, salaire
FROM employe;

SELECT titre
FROM employe;

--même commande mais pour retirer les doublons

SELECT DISTINCT titre
FROM employe;

--pour renommer la colonne utiliser as

SELECT nom, noemp AS "numéro de l'employé", nodep AS 'numéro du département'
FROM employe
WHERE titre = 'secretaire';

SELECT nom, nodep
FROM employe
WHERE nodep>40;

--question 8 à 13

SELECT nom, prenom
FROM employe
WHERE nom<prenom;

SELECT nom, salaire, nodep
FROM employe
WHERE titre='representant' AND nodep=35 AND salaire>20000;

SELECT nom, titre, salaire
FROM employe
WHERE titre='representant' OR titre='president';



SELECT nom, titre, nodep, salaire
FROM employe
WHERE nodep=34 AND (titre='representant' OR titre='secretaire');

--idem dessus mais plus simple en écriture

SELECT nom, titre, nodep, salaire
FROM employe
WHERE nodep=34 AND titre IN ('representant','secretaire');

SELECT nom, titre, nodep, salaire
FROM employe
WHERE titre='representant' OR (titre='secretaire' AND nodep=34);

SELECT nom, salaire
FROM employe
WHERE salaire BETWEEN 20000 AND 30000;

--questions 15 à 20

--rechercher un nom commençant par une lettre

SELECT nom
FROM employe
WHERE nom LIKE 'h%';

--rechercher un nom finissant par une lettre

SELECT nom
FROM employe
WHERE nom LIKE '%n';

--rechercher un nom comportant par une lettre en 3ème position

SELECT nom
FROM employe
WHERE nom LIKE '__u%';

--trier le résultat par ordre croissant ou décroissant

SELECT salaire, nom
FROM employe
WHERE nodep=41
ORDER BY salaire ASC;

SELECT salaire, nom
FROM employe
WHERE nodep=41
ORDER BY salaire DESC;

SELECT titre, salaire, nom
FROM employe
ORDER BY titre ASC, salaire DESC;

-- questions 21 à 25

SELECT tauxcom, salaire, nom
FROM employe
ORDER BY tauxcom ASC;

-- pour oter ou prendre en compte les lignes selon si une valeur est nulle

SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom IS NULL;

SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom IS not NULL;

SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom<15;

SELECT nom, salaire, tauxcom, titre
FROM employe
WHERE tauxcom>15;

--exercice 26 et 27 colonne obtenu par calcul d'une nouvelle valeur

SELECT nom, salaire, tauxcom, salaire*tauxcom AS 'commission'
FROM employe
WHERE tauxcom>0;

SELECT nom, salaire, tauxcom, salaire*tauxcom AS 'commission'
FROM employe
WHERE tauxcom>0
ORDER BY salaire*tauxcom ASC;

--exercice 28 mettre plusieurs valeur dans une colonne(concaténer)

SELECT CONCAT(nom," ", prenom) AS 'prénom et nom des employés'
FROM employe;

--exercice 29 à 32

--extrait un nombre de caractère (5) d'une chaine à partir d'un emplacement défini (1)

SELECT SUBSTRING(nom, 1, 5)
FROM employe;

--donne la position d'un caractère(r) dans une chaine (nom)

SELECT nom, LOCATE('r', nom)
FROM employe;

--permet d'ecrire un nom soit en majuscule soit en minuscule

SELECT nom, UPPER(nom), LOWER(nom)
FROM employe
WHERE nom='vrante';

--donne la longueur d'une chaine

SELECT nom, LENGTH(nom)
FROM employe;

--Partie 2 jointures

SELECT prenom, noregion
FROM employe
JOIN dept
ON nodep = nodept;

--ne JAMAIS au grand JAMAIS appelé deux colonnes de deux tables différentes du même nom !!!!!

SELECT nodep, employe.nom AS 'nom employé', dept.nom AS 'nom département'
FROM dept
JOIN employe
ON nodep = nodept
ORDER BY nodep;

SELECT employe.nom
FROM employe
JOIN dept
ON nodep=nodept
WHERE dept.nom = 'distribution';

--pour faire une comparaison avec une clé étrangère qui relie une même table (auto-jointure)

SELECT a.nom AS 'nom salarié', a.salaire AS 'salaire du salarié', b.nom AS 'nom du supérieur', b.salaire AS 'salaire du supérieur'
FROM employe a
INNER JOIN employe b
ON a.nosup=b.noemp
WHERE a.salaire>b.salaire;

--sous-requêtes

SELECT nom, titre
FROM employe
WHERE titre LIKE
	(SELECT titre FROM employe WHERE nom='amartakaldire');
	
--rechercher nom salaire numdep des employés classés

SELECT employe.nom, salaire, nodep
FROM employe
ORDER BY nodep, salaire;

--rechercher salaire minimum

SELECT MIN(salaire)
FROM employe
WHERE nodep LIKE '31';

SELECT nom, salaire, nodep
FROM employe
WHERE salaire > 
	(SELECT MIN(salaire) FROM employe WHERE nodep LIKE '31')
ORDER BY nodep AND salaire;


SELECT nom, salaire, nodep
FROM employe
WHERE salaire >
	(SELECT MAX(salaire) FROM employe WHERE nodep='31')
ORDER BY nodep AND salaire ; 

SELECT nom, titre
FROM employe
WHERE nodep='31'AND titre IN (SELECT ALL titre FROM employe WHERE nodep='32');

SELECT nom, titre
FROM employe
WHERE nodep='31'AND titre NOT IN (SELECT ALL titre FROM employe WHERE nodep='32');

SELECT nom, titre, salaire
FROM employe
WHERE titre = (SELECT titre FROM employe WHERE nom='fairent');

--requêtes externe

SELECT nodept, employe.nom AS 'nom employé', dept.nom AS 'nom département'
FROM dept
left JOIN employe
ON nodep = nodept
ORDER BY nodep;

--fonctions de groupe

SELECT titre, COUNT(nom)
FROM employe 
GROUP BY titre;

SELECT AVG(salaire), SUM(salaire), dept.nom
FROM employe
JOIN dept ON dept.nodept = employe.nodep
GROUP BY dept.nom;

SELECT AVG(salaire), SUM(salaire), dept.nom
FROM employe, dept
WHERE dept.nodept = employe.nodep
GROUP BY dept.nom;
	
--clause having 

SELECT nodep, COUNT(nodep)
FROM employe
GROUP BY nodep
HAVING COUNT(nodep) > 2;

--Erreur : comment afficher les lettres qui sont l'initiale d'au moins 3 employés

SELECT nom, COUNT(nom)
FROM employe a
INNER JOIN employe b 
WHERE a.nom LIKE '_%'
HAVING COUNT(nom)>2;

--5

select max(salaire), min(salaire), MAX(salaire)-MIN(salaire) as 'écart entre pauvre et riche'
from employe;

--6 ôter les valeurs doublons d'un compte et compter les valeurs unique

SELECT count(DISTINCT titre)
FROM employe;

--7 compter le nombre d'employer par titre

Select titre, COUNT(*) AS 'nombre de répition'
from employe
GROUP BY titre
;

--8 compter le nombre de salarié par département

Select dept.nom, COUNT(employe.nodep) AS 'nombre de salarié'
from dept
inner join employe on employe.nodep=dept.nodept
GROUP BY dept.nom
;

--9 problème


SELECT AVG(salaire) 
FROM employe 
WHERE titre LIKE 'représentant';

SELECT AVG(salaire) , titre
FROM employe
GROUP BY titre;

select AVG(salaire) , titre
FROM employe
GROUP BY titre
HAVING AVG(salaire)>(SELECT AVG(salaire) FROM employe WHERE titre LIKE 'représentant')
;

--10

SELECT COUnt(salaire), count(tauxcom)
from employe;