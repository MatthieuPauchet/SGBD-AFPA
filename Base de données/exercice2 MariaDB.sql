DROP DATABASE exercice2;

CREATE DATABASE exercice2;

USE exercice2;

CREATE TABLE Station(
	id_station INT AUTO_INCREMENT NOT NULL,
	nom_station VARCHAR(45),
	PRIMARY KEY (id_station)
);

CREATE TABLE Hotel(
	id_hotel INT AUTO_INCREMENT NOT NULL,
	capacite_hotel TINYINT,
	categorie_hotel VARCHAR(50),
	nom_hotel VARCHAR(50),
	adresse_hotel VARCHAR(100),
	id_station INT,
	PRIMARY KEY (id_hotel),
	FOREIGN KEY (id_station) REFERENCES Station(id_station)
);
	
CREATE TABLE Chambre(
	id_chambre INT AUTO_INCREMENT NOT NULL,
	capacite_chambre TINYINT,
	degre_confort_chambre VARCHAR(50),
	exposition_chambre VARCHAR(10),
	type_chambre VARCHAR(20),
	numero_chambre SMALLINT,
	id_hotel INT,
	PRIMARY KEY (id_chambre),
	FOREIGN KEY (id_hotel) REFERENCES Hotel(id_hotel)
);

CREATE TABLE `client` (
	id_client INT AUTO_INCREMENT NOT NULL,
	nom_client VARCHAR(35),
	PRIMARY KEY (id_client)
);

CREATE TABLE Reservation(
	id_client INT,
	id_chambre INT,
	date_debut_reservation DATE,
	date_fin_reservation DATE,
	date_reservation DATETIME,
	montant_arrhes_resrvation DECIMAL(6,2),
	prix_total_reservation DECIMAL(6,2),
	PRIMARY KEY (id_client, id_chambre),
	FOREIGN KEY (id_client) REFERENCES `client`(id_client),
	FOREIGN KEY (id_chambre) REFERENCES chambre(id_chambre)
);
	