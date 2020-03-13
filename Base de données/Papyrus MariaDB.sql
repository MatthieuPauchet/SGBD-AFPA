DROP DATABASE IF EXISTS PAPYRUS;

CREATE DATABASE IF NOT EXISTS PAPYRUS;

USE PAPYRUS;

CREATE TABLE Produit(
	codart CHAR(4) 		NOT null,
	libart VARCHAR(30)	NOT NULL,
	stkale INT(10)			NOT NULL,
	stkphy INT(10)			NOT NULL,
	qteann INT(10)			NOT NULL,
	unimes CHAR(5)			NOT NULL,
	PRIMARY KEY (codart)
);

CREATE TABLE Fournis(
	numfou VARCHAR(25) UNIQUE NOT NULL,
	nomfou VARCHAR(25) NOT NULL,
	ruefou VARCHAR(50) NOT NULL, 
	posfou CHAR(5) 	 NOT NULL CHECK (posfou BETWEEN '01000' AND '99999'),
	vilfou VARCHAR(30) NOT NULL,
	confou VARCHAR(15) NOT NULL,
	satisf TINYINT(3)  CHECK (satisf BETWEEN 1 AND 10),
	PRIMARY KEY (numfou)
);

CREATE TABLE vente(
	numfou VARCHAR(25) NOT NULL,
	codart CHAR(4)	  	 NOT NULL,
	delliv SMALLINT(5) NOT NULL,
	qte1 INT(10) 		 NOT NULL,
	prix1 VARCHAR(50)  NOT NULL,	
	qte2 INT(10) ,
	prix2 VARCHAR(50),	
	qte3 INT(10),
	prix3 VARCHAR(50),
	PRIMARY KEY (numfou, codart),
	FOREIGN KEY (numfou) REFERENCES Fournis(numfou),
	FOREIGN KEY (codart) REFERENCES Produit(codart)
);

CREATE TABLE entcom(
	numcom INT(10) auto_increment NOT NULL,
	obscom VARCHAR(50),
	datcom DATETIME NOT NULL DEFAULT current_date,
	numfou VARCHAR(25) ,
	PRIMARY KEY(numcom),
	foreign key(numfou) REFERENCES Fournis(numfou)
);

CREATE TABLE ligcom(
	numlig TINYINT(3) NOT NULL,
	qtecde INT(10) NOT NULL,
	priuni VARCHAR(50) NOT NULL,
	qteliv INT(10),
	derliv DATETIME NOT NULL,
	numcom INT(10) NOT NULL,
	codart CHAR(4) NOT null,
	PRIMARY KEY (numlig, numcom),
	FOREIGN KEY (numcom) REFERENCES entcom(numcom),
	FOREIGN KEY (codart) REFERENCES produit(codart)
);

CREATE INDEX numfou_index ON entcom(numfou);

INSERT INTO Fournis(numfou,nomfou,ruefou,posfou,vilfou,confou,satisf)
VALUES ('00120','GROBRIGAN','20 rue du papier','92200','papercity','georges',8),
		 ('00540','ECLIPSE','53 rue laisse flotter les rubans','78250','Bugbugville','Nestor',7),
		 ('08700','MEDICIS','120 rue des plantes','75014','Paris','Lison',NULL),
		 ('09120','DISCOBOL','11 rue des sports','85100','La ROche sur Yon','Hercule',8),
		 ('09150','DEPANPAP','26, avenue des locomotives','59987','Coroncountry','Pollux',5),
		 ('09180','HURRYTAPE','68 boulevard des octets','04044','Dumpville','Track',NULL);
		 
INSERT INTO Entcom(numcom,obscom,datcom,numfou)
VALUES (70010,NULL,'2007-02-10','00120'),
		(70011,'Commande urgente','2007-03-01','00540'),
		(70020,NULL,'2007-04-25','09180'),
		(70025,'Commande urgente','2007-04-30','09150'),
		(70210,'Commande cadencée','2007-05-05','00120'),
		(70300,NULL,'2007-06-06','09120'),
		(70250,'Commande cadencée','2007-10-02','08700'),
		(70620,NULL,'2007-10-02','00540'),
		(70625,NULL,'2007-10-09','00120'),
		(70629,NULL,'2007-10-12','09180');
		 
--table produit insérer via importer un fichier csv

LOAD DATA LOCAL INFILE 'C:\\Users\\80010-58-17\\Desktop\\vente.csv'
INTO TABLE vente
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(numfou,codart,delliv,qte1,prix1,@qte2,@prix2,@qte3,@prix3)
SET prix3=NULLIF(@prix3,''), 
	 qte3=NULLIF(@qte3,''),
	 prix2=NULLIF(@prix2,''),evaluationevaluationevaluation
	 qte2=NULLIF(@qte2,'');

--table ligcom insérer via importer un fichier csv attention format date à vérifier avant import csv

--mysqldump --user=root --password=Marylou17 --databases papyrus > C:\Backup\backup_papyrus.sql

