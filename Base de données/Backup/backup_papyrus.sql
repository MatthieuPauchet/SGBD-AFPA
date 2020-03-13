-- MariaDB dump 10.17  Distrib 10.4.7-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: papyrus
-- ------------------------------------------------------
-- Server version	10.4.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `papyrus`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `papyrus` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `papyrus`;

--
-- Table structure for table `entcom`
--

DROP TABLE IF EXISTS `entcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entcom` (
  `numcom` int(10) NOT NULL AUTO_INCREMENT,
  `obscom` varchar(50) DEFAULT NULL,
  `datcom` date NOT NULL DEFAULT curdate(),
  `numfou` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`numcom`),
  KEY `numfou_index` (`numfou`),
  CONSTRAINT `entcom_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `fournis` (`numfou`)
) ENGINE=InnoDB AUTO_INCREMENT=70630 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entcom`
--

LOCK TABLES `entcom` WRITE;
/*!40000 ALTER TABLE `entcom` DISABLE KEYS */;
INSERT INTO `entcom` VALUES (70010,'','2007-02-10','00120'),(70011,'Commande urgente','2007-03-01','00540'),(70020,'','2007-04-25','09180'),(70025,'Commande urgente','2007-04-30','09150'),(70210,'Commande cadencée','2007-05-05','00120'),(70250,'Commande cadencée','2007-10-02','08700'),(70300,'','2007-06-06','09120'),(70620,'','2007-10-02','00540'),(70625,'','2007-10-09','00120'),(70629,'','2007-10-12','09180');
/*!40000 ALTER TABLE `entcom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournis`
--

DROP TABLE IF EXISTS `fournis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournis` (
  `numfou` varchar(25) NOT NULL,
  `nomfou` varchar(25) NOT NULL,
  `ruefou` varchar(50) NOT NULL,
  `posfou` char(5) NOT NULL CHECK (`posfou` between '01000' and '99999'),
  `vilfou` varchar(30) NOT NULL,
  `confou` varchar(15) NOT NULL,
  `satisf` tinyint(3) DEFAULT NULL CHECK (`satisf` between 1 and 10),
  PRIMARY KEY (`numfou`),
  UNIQUE KEY `numfou` (`numfou`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournis`
--

LOCK TABLES `fournis` WRITE;
/*!40000 ALTER TABLE `fournis` DISABLE KEYS */;
INSERT INTO `fournis` VALUES ('00120','GROBRIGAN','20 rue du papier','92200','papercity','georges',8),('00540','ECLIPSE','53 rue laisse flotter les rubans','78250','Bugbugville','Nestor',7),('08700','MEDICIS','120 rue des plantes','75014','Paris','Lison',NULL),('09120','DISCOBOL','11 rue des sports','85100','La ROche sur Yon','Hercule',8),('09150','DEPANPAP','26, avenue des locomotives','59987','Coroncountry','Pollux',5),('09180','HURRYTAPE','68 boulevard des octets','04044','Dumpville','Track',NULL);
/*!40000 ALTER TABLE `fournis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligcom`
--

DROP TABLE IF EXISTS `ligcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ligcom` (
  `numlig` tinyint(3) NOT NULL,
  `qtecde` int(10) NOT NULL,
  `priuni` varchar(50) NOT NULL,
  `qteliv` int(10) DEFAULT NULL,
  `derliv` datetime(6) NOT NULL,
  `numcom` int(10) NOT NULL,
  `codart` char(4) NOT NULL,
  PRIMARY KEY (`numlig`,`numcom`),
  KEY `numcom` (`numcom`),
  KEY `codart` (`codart`),
  CONSTRAINT `ligcom_ibfk_1` FOREIGN KEY (`numcom`) REFERENCES `entcom` (`numcom`),
  CONSTRAINT `ligcom_ibfk_2` FOREIGN KEY (`codart`) REFERENCES `produit` (`codart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligcom`
--

LOCK TABLES `ligcom` WRITE;
/*!40000 ALTER TABLE `ligcom` DISABLE KEYS */;
INSERT INTO `ligcom` VALUES (1,3000,'470',3000,'2007-03-15 00:00:00.000000',70010,'I100'),(1,1000,'600',1000,'2007-05-16 00:00:00.000000',70011,'I105'),(1,200,'140',0,'2007-12-31 00:00:00.000000',70020,'B001'),(1,1000,'590',1000,'2007-05-15 00:00:00.000000',70025,'I100'),(1,1000,'470',1000,'2007-07-15 00:00:00.000000',70210,'I100'),(1,15000,'4900',12000,'2007-12-15 00:00:00.000000',70250,'P230'),(1,50,'790',50,'2007-10-31 00:00:00.000000',70300,'I110'),(1,200,'600',200,'2007-11-01 00:00:00.000000',70620,'I105'),(1,1000,'470',1000,'2007-10-15 00:00:00.000000',70625,'I100'),(1,200,'140',0,'2007-12-31 00:00:00.000000',70629,'B001'),(2,2000,'485',2000,'2007-07-05 00:00:00.000000',70010,'I105'),(2,200,'140',0,'2007-12-31 00:00:00.000000',70020,'B002'),(2,500,'590',500,'2007-05-15 00:00:00.000000',70025,'I105'),(2,10000,'3500',10000,'2007-08-31 00:00:00.000000',70210,'P220'),(2,10000,'3350',10000,'2007-11-10 00:00:00.000000',70250,'P220'),(2,10000,'3500',10000,'2007-10-31 00:00:00.000000',70625,'P220'),(2,200,'140',0,'2007-12-31 00:00:00.000000',70629,'B002'),(3,1000,'680',1000,'2007-08-20 00:00:00.000000',70010,'I108'),(4,200,'40',250,'2007-02-20 00:00:00.000000',70010,'D035'),(5,6000,'3500',6000,'2007-03-31 00:00:00.000000',70010,'P220'),(6,6000,'2000',2000,'2007-03-31 00:00:00.000000',70010,'P240');
/*!40000 ALTER TABLE `ligcom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `codart` char(4) NOT NULL,
  `libart` varchar(30) NOT NULL,
  `stkale` int(10) NOT NULL,
  `stkphy` int(10) NOT NULL,
  `qteann` int(10) NOT NULL,
  `unimes` char(5) NOT NULL,
  PRIMARY KEY (`codart`),
  UNIQUE KEY `codart` (`codart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES ('B001','Bande magnétique 1200',20,87,240,'unite'),('B002','Bande magnétique 6250',20,12,410,'unite'),('D035','CD R slim 80 mm',40,42,150,'B010'),('D050','CD R-W 80mm',50,4,0,'B010'),('I100','Papier 1 ex continu',100,557,3500,'B1000'),('I105','Papier 2 ex continu',75,5,2300,'B1000'),('I108','Papier 3 ex continu',200,557,3500,'B500'),('I110','Papier 4 ex continu',10,12,63,'B400'),('P220','Pré-imprimé commande',500,2500,24500,'B500'),('P230','Pré-imprimé facture',500,250,12500,'B500'),('P240','Pré-imprimé bulletin paie',500,3000,6250,'B500'),('P250','Pré-imprimé bon livraison',500,2500,24500,'B500'),('P270','Pré-imprimé bon fabrication',500,2500,24500,'B500'),('R080','ruban Epson 850',10,2,120,'unite'),('R132','ruban impl 1200 lignes',25,200,182,'unite');
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vente`
--

DROP TABLE IF EXISTS `vente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vente` (
  `numfou` varchar(25) NOT NULL,
  `codart` char(4) NOT NULL,
  `delliv` smallint(5) NOT NULL,
  `qte1` int(10) NOT NULL,
  `prix1` varchar(50) NOT NULL,
  `qte2` int(10) DEFAULT NULL,
  `prix2` varchar(50) DEFAULT NULL,
  `qte3` int(10) DEFAULT NULL,
  `prix3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`numfou`,`codart`),
  KEY `codart` (`codart`),
  CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `fournis` (`numfou`),
  CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`codart`) REFERENCES `produit` (`codart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vente`
--

LOCK TABLES `vente` WRITE;
/*!40000 ALTER TABLE `vente` DISABLE KEYS */;
INSERT INTO `vente` VALUES ('00120','D035',0,0,'40',NULL,NULL,NULL,NULL),('00120','I100',90,0,'700',50,'600',120,'500'),('00120','I105',90,10,'705',50,'630',120,'500'),('00120','I108',90,5,'795',30,'720',100,'680'),('00120','P220',15,0,'3700',100,'3500',0,'0'),('00120','P230',30,0,'5200',100,'5000',0,'0'),('00120','P240',15,0,'2200',100,'2000',0,'0'),('00120','P250',30,0,'1500',100,'1400',500,'1200'),('00540','I100',70,0,'710',60,'630',100,'600'),('00540','I105',70,0,'810',60,'645',100,'600'),('08700','B001',15,0,'150',50,'145',100,'140'),('08700','B002',15,0,'210',50,'200',100,'185'),('08700','I105',30,0,'720',50,'670',100,'510'),('08700','P220',20,50,'3500',100,'3350',0,'0'),('08700','P230',60,0,'5000',50,'4900',0,'0'),('09120','D035',5,0,'40',100,'30',0,'0'),('09120','I100',60,0,'800',70,'600',90,'500'),('09120','I105',60,0,'920',70,'800',90,'700'),('09120','I108',60,0,'920',70,'820',100,'780'),('09120','I110',60,0,'950',70,'850',90,'790'),('09120','P250',30,0,'1500',100,'1400',500,'1200'),('09120','R080',10,0,'120',100,'100',0,'0'),('09120','R132',5,0,'275',0,'0',0,'0'),('09150','I100',90,0,'650',90,'600',200,'590'),('09150','I105',90,0,'685',90,'600',200,'590'),('09180','I100',30,0,'720',50,'670',100,'490'),('09180','I110',90,0,'900',70,'870',90,'835');
/*!40000 ALTER TABLE `vente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-16 15:03:31
