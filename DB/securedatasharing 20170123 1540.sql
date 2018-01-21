-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema securedatasharing
--

CREATE DATABASE IF NOT EXISTS securedatasharing;
USE securedatasharing;

--
-- Definition of table `attacker`
--

DROP TABLE IF EXISTS `attacker`;
CREATE TABLE `attacker` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `filename` varchar(45) NOT NULL,
  `keytried` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attacker`
--

/*!40000 ALTER TABLE `attacker` DISABLE KEYS */;
/*!40000 ALTER TABLE `attacker` ENABLE KEYS */;


--
-- Definition of table `dataprovider`
--

DROP TABLE IF EXISTS `dataprovider`;
CREATE TABLE `dataprovider` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `DOB` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dataprovider`
--

/*!40000 ALTER TABLE `dataprovider` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataprovider` ENABLE KEYS */;


--
-- Definition of table `datauser`
--

DROP TABLE IF EXISTS `datauser`;
CREATE TABLE `datauser` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `DOB` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datauser`
--

/*!40000 ALTER TABLE `datauser` DISABLE KEYS */;
/*!40000 ALTER TABLE `datauser` ENABLE KEYS */;


--
-- Definition of table `keyrequest`
--

DROP TABLE IF EXISTS `keyrequest`;
CREATE TABLE `keyrequest` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `filename` varchar(45) NOT NULL,
  `ownername` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `keygen` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keyrequest`
--

/*!40000 ALTER TABLE `keyrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyrequest` ENABLE KEYS */;


--
-- Definition of table `results`
--

DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `filename` varchar(45) NOT NULL,
  `result` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `results`
--

/*!40000 ALTER TABLE `results` DISABLE KEYS */;
/*!40000 ALTER TABLE `results` ENABLE KEYS */;


--
-- Definition of table `uploadfiles`
--

DROP TABLE IF EXISTS `uploadfiles`;
CREATE TABLE `uploadfiles` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `filename` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `ownername` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `bytesencrypted` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uploadfiles`
--

/*!40000 ALTER TABLE `uploadfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploadfiles` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
