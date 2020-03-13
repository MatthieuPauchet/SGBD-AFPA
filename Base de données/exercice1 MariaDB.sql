DROP DATABASE exercice1;

CREATE DATABASE exercice1;

USE exercice1;

CREATE TABLE Groupe (
	gro_num 		INT AUTO_INCREMENT NOT NULL,
	gro_libelle VARCHAR(50),
	PRIMARY KEY (gro_num)
); 

CREATE TABLE Personne (
	per_num 		INT AUTO_INCREMENT NOT NULL,
	per_nom 		VARCHAR(30),
	per_prenom 	VARCHAR(30),
	per_adresse VARCHAR(100),
	per_ville 	VARCHAR(50),
	PRIMARY KEY (per_num)
);

CREATE TABLE Appartient(
	gro_num INT,
	per_num INT,
	FOREIGN KEY (gro_num) REFERENCES Groupe(gro_num),
	FOREIGN KEY (per_num) REFERENCES Personne(per_num),
	PRIMARY KEY (gro_num, per_num)
);

	