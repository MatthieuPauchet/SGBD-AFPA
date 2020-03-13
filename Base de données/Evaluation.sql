-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.4.7-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour evaluation
CREATE DATABASE IF NOT EXISTS `evaluation` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `evaluation`;

-- Listage de la structure de la table evaluation. client
CREATE TABLE IF NOT EXISTS `client` (
  `cli_num` int(11) NOT NULL,
  `cli_nom` varchar(50) DEFAULT NULL,
  `cli_adresse` varchar(50) DEFAULT NULL,
  `cli_tel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cli_num`),
  KEY `cli_nom_index` (`cli_nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table evaluation.client : ~0 rows (environ)
DELETE FROM `client`;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;

-- Listage de la structure de la table evaluation. commande
CREATE TABLE IF NOT EXISTS `commande` (
  `com_num` int(11) NOT NULL,
  `com_date` datetime DEFAULT NULL,
  `com_obs` varchar(50) DEFAULT NULL,
  `cli_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`com_num`),
  KEY `cli_num` (`cli_num`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`cli_num`) REFERENCES `client` (`cli_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table evaluation.commande : ~0 rows (environ)
DELETE FROM `commande`;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;

-- Listage de la structure de la table evaluation. est_composé
CREATE TABLE IF NOT EXISTS `est_composé` (
  `pro_num` int(11) NOT NULL,
  `com_num` int(11) NOT NULL,
  `est_qte` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_num`,`com_num`),
  KEY `com_num` (`com_num`),
  CONSTRAINT `est_composé_ibfk_1` FOREIGN KEY (`pro_num`) REFERENCES `produit` (`pro_num`),
  CONSTRAINT `est_composé_ibfk_2` FOREIGN KEY (`com_num`) REFERENCES `commande` (`com_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table evaluation.est_composé : ~0 rows (environ)
DELETE FROM `est_composé`;
/*!40000 ALTER TABLE `est_composé` DISABLE KEYS */;
/*!40000 ALTER TABLE `est_composé` ENABLE KEYS */;

-- Listage de la structure de la table evaluation. produit
CREATE TABLE IF NOT EXISTS `produit` (
  `pro_num` int(11) NOT NULL,
  `pro_libelle` varchar(50) DEFAULT NULL,
  `pro_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pro_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table evaluation.produit : ~0 rows (environ)
DELETE FROM `produit`;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
