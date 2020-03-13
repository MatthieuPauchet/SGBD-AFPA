DROP DATABASE evaluation2;

CREATE DATABASE evaluation2;

USE evaluation2;

CREATE TABLE `CLIENT`(
	cli_num INT PRIMARY KEY NOT NULL,
	cli_nom VARCHAR(50),
	cli_adresse VARCHAR(50),
	cli_tel VARCHAR(30)
);

CREATE TABLE Produit(
	pro_num         INT PRIMARY KEY NOT NULL,
	pro_libelle     VARCHAR(50),
	pro_description VARCHAR(50)
);

CREATE TABLE Commande(
	com_num INT PRIMARY KEY NOT NULL,
	com_date DATETIME,
	com_obs VARCHAR(50),
	cli_num INT,
	FOREIGN KEY (cli_num) REFERENCES `CLIENT`(cli_num)
);
DROP TABLE Est_compose;
CREATE TABLE Est_compose(
	com_num INT,
	pro_num INT,
	est_qte INT,
	PRIMARY KEY (com_num, pro_num),
	FOREIGN KEY (com_num) REFERENCES `Commande`(com_num),
	FOREIGN KEY (pro_num) REFERENCES `Produit`(pro_num)
);

CREATE INDEX cli_nom_index ON `client`(cli_nom);