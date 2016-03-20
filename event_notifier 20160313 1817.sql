-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema event_notifier
--

CREATE DATABASE IF NOT EXISTS event_notifier;
USE event_notifier;

--
-- Definition of table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL auto_increment,
  `categoryName` varchar(255) default NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`categoryId`,`categoryName`,`status`) VALUES 
 (1,'Jewellery',1),
 (2,'Environment',1),
 (3,'Concert',1),
 (4,'Health',1),
 (5,'Spiritual',1),
 (6,'Education',1),
 (7,'Sports',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `id` int(11) NOT NULL auto_increment,
  `address` varchar(255) default NULL,
  `approvedBy` varchar(255) default NULL,
  `approvedOn` datetime default NULL,
  `category` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `contactPerson` varchar(255) default NULL,
  `createdBy` varchar(255) default NULL,
  `createdOn` datetime default NULL,
  `emailId` varchar(255) default NULL,
  `endDate` datetime default NULL,
  `endTime` varchar(255) default NULL,
  `eventName` varchar(255) default NULL,
  `faxNo` varchar(255) default NULL,
  `fee` varchar(255) default NULL,
  `filePath` varchar(255) default NULL,
  `ipAddress` varchar(255) default NULL,
  `isChargeable` varchar(255) default NULL,
  `landmark` varchar(255) default NULL,
  `mobileNo` varchar(255) default NULL,
  `organizedBy` varchar(255) default NULL,
  `phoneNo` varchar(255) default NULL,
  `pincode` varchar(255) default NULL,
  `rejectedBy` varchar(255) default NULL,
  `rejectedOn` datetime default NULL,
  `startDate` datetime default NULL,
  `startTime` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `status` int(11) NOT NULL,
  `termsConditions` text,
  `verifyBy` varchar(255) default NULL,
  `verifyOn` datetime default NULL,
  `website` varchar(255) default NULL,
  `description` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` (`id`,`address`,`approvedBy`,`approvedOn`,`category`,`city`,`contactPerson`,`createdBy`,`createdOn`,`emailId`,`endDate`,`endTime`,`eventName`,`faxNo`,`fee`,`filePath`,`ipAddress`,`isChargeable`,`landmark`,`mobileNo`,`organizedBy`,`phoneNo`,`pincode`,`rejectedBy`,`rejectedOn`,`startDate`,`startTime`,`state`,`status`,`termsConditions`,`verifyBy`,`verifyOn`,`website`,`description`) VALUES 
 (1,'Ahmedabad Haat','krunal','2016-03-12 16:25:23','Jewellery','Ahmedabad','Rupesh Patel','pulkit','2016-03-11 23:55:52','info@phdesigns.com','2016-03-20 00:00:00','08:00 PM','Make your own paper jewellery','07927507260','500 Rs. Per Person',NULL,NULL,'on','Nr. Vastrapur Lake, Vastrapur','9376197557','PH Designs','07927507261','380015',NULL,NULL,'2016-03-19 00:00:00','05:00 PM','Gujarat',1,'Workshop fees: 250 INR including the material required. (Material includes Quilling strips, quilling tool, glue, jewelery tools, hooks, & other jewelery making supplies).','krunal','2016-03-12 00:00:00','http://www.phdesigns.com','Join us for the quilling workshop by PH Designs on Saturday and Sunday 19-20th March from 5pm to 7pm at Fema Fest (Princess stall number 23)'),
 (2,'148 Murli Bungalows','krunal','2016-03-12 16:25:23','Environment','Baroda','Hemal Shah','jinal','2016-03-12 00:06:10','info@healthheart.co.in','2016-03-31 00:00:00','05:00 PM','Enlovement Day Celebration','07926265749','-',NULL,NULL,'on','Opposite Navjeevan Press, Income Tax','7383124725','Healthy Heart','07926264578','380013',NULL,NULL,'2016-03-31 00:00:00','01:00 PM','Gujarat',1,'Loving The Way of the Heart – Center for Transformation is an Institute of Personal Growth.','krunal','2016-03-12 00:00:00','http://www.healthyheart.co.in','Enlovement was launched on March 21 2015 & since then we celebrate 21st March as Enlovement Day.'),
 (3,'Rajpath Club','krunal','2016-03-12 16:25:23','Concert','Ahmedabad','Mr. Krunal Shah','jinal','2016-03-12 15:23:38','info@cybage.com','2016-04-01 00:00:00','11:00 PM','KK - Live Concert','079-27507261','500 Rs. Per Person',NULL,'0:0:0:0:0:0:0:1','on','S. G Road','7383124725','Cybage','079-27507260','380005',NULL,NULL,'2016-04-01 00:00:00','8:00 PM','Gujarat',2,'Terms & Conditions','krunal','2016-03-12 16:25:23','www.cybage.com','KK - Live Concert'),
 (4,'9 Jinendra Apartment','krunal','2016-03-12 17:25:18','Concert','Ahmedabad','Jay Patel','pulkit','2016-03-12 16:15:16','info@infomatic.com','2016-04-01 00:00:00','11:00 PM','Atif Aslam - Live Concert','9376197557','250 Rs. Per Person',NULL,'0:0:0:0:0:0:0:1','on','Rambag Road','9376197557','Infomatics','9376197557','380005',NULL,NULL,'2016-04-01 00:00:00','8:00 PM','Gujarat',1,'terms','krunal','2016-03-12 17:25:18','info.co.in','Atif Aslam - Live Concert'),
 (7,'Naranpura','krunal','2016-03-12 22:34:11','Health','Ahmedabad','Krunal Shah','krunal','2016-03-12 22:29:29','info@who.com','2016-04-10 00:00:00','06:00 PM','Ahmedabad Mummy & Baby 2016','9376197557','100 Rs. Per Person',NULL,'0:0:0:0:0:0:0:1','on','Nr. Post Office','9376197557','WHO','9376197557','380005',NULL,NULL,'2016-04-09 00:00:00','10:00 AM','Gujarat',1,'terns','krunal','2016-03-12 22:34:11','http://www.who.com','An event for the amazing little wonders till the age of 5 years to showcase their talents and flaunt their cuteness. Mothers get ready!!! #tinysteps #mummyandbaby'),
 (8,'Narottam Zaveri Hall','krunal','2016-03-13 17:57:54','Spiritual','Ahmedabad','Mr. Jinay Purohit','krunal','2016-03-13 08:53:41','info@spiritual.co.in','2016-04-17 00:00:00','08:00 PM','SAMTVAM ASTRO MEET-2016','07945458990','-',NULL,'0:0:0:0:0:0:0:1','on','Nr. Sardar Patel Stadium','9689785356','Spiritual Academy','07945458989','380042',NULL,NULL,'2016-04-16 00:00:00','08:00 AM','Gujarat',1,'','krunal','2016-03-13 17:57:54','http://www.spiritual.co.in','3rd Eye Spiritual Research Foundation based on trust in human dignity. We offer a path of meditation practice and contemplative arts oriented towards modern life.');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;


--
-- Definition of table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `id` int(11) NOT NULL auto_increment,
  `stateName` varchar(255) default NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` (`id`,`stateName`,`status`) VALUES 
 (1,'Gujarat',1),
 (2,'Maharastra',1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) default NULL,
  `firstname` varchar(255) default NULL,
  `gender` varchar(255) default NULL,
  `lastname` varchar(255) default NULL,
  `mobile` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `username` varchar(255) default NULL,
  `lastLogin` datetime default NULL,
  `memberSince` datetime default NULL,
  `address` varchar(255) default NULL,
  `birthDate` datetime default NULL,
  `city` varchar(255) default NULL,
  `education` varchar(255) default NULL,
  `occupation` varchar(255) default NULL,
  `pincode` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`,`email`,`firstname`,`gender`,`lastname`,`mobile`,`password`,`status`,`type`,`username`,`lastLogin`,`memberSince`,`address`,`birthDate`,`city`,`education`,`occupation`,`pincode`,`state`) VALUES 
 (1,'shahkrunalm@gmail.com','Krunal','male','Shah','9376197557','navkar',1,1,'krunal','2016-03-13 17:54:09','2016-03-11 22:30:50','Rajpath Club','2004-03-12 00:00:00','Ahmedabad','Graduate','Business','380013','Gujarat'),
 (2,'jinal@shah.com','Jinal','female','Shah','9376197557','navkar',1,2,'jinal','2016-03-13 17:27:39','2016-03-11 22:30:50','Rajpath Club','2004-03-12 00:00:00','Ahmedabad','Graduate','Business','380013','Gujarat'),
 (3,'heli@gmail.com','Hemal','male','Shah','9376197557','navkar',1,2,'hemal','2016-03-11 23:05:02','2016-03-11 23:05:02','Rajpath Club','2004-03-12 00:00:00','Ahmedabad','Graduate','Business','380013','Gujarat'),
 (4,'heli@gmail.com','Heli','female','Shah','9376197557','navkar',0,2,'heli','2016-03-12 17:32:47','2016-03-11 23:13:46','Rajpath Club','2004-03-12 00:00:00','Ahmedabad','Graduate','Business','380013','Gujarat'),
 (5,'p@h.com','Parshva','male','Shah','9376197557','navkar',1,2,'parshva','2016-03-11 23:15:32','2016-03-11 23:15:32','Rajpath Club','2004-03-12 00:00:00','Ahmedabad','Graduate','Business','380013','Gujarat'),
 (6,'pulkit@live.com','Pulkit','male','Thakor','9376197557','navkar',1,2,'pulkit','2016-03-13 18:07:17','2016-03-12 16:12:10','Rajpath Club','2004-03-12 00:00:00','Ahmedabad','Graduate','Business','380013','Gujarat'),
 (9,'sadhna@gmail.com','Sadhna','female','Shah','9376197557','navkar',1,2,'sadhna','2016-03-12 20:25:49','2016-03-12 20:25:49','Rajpath Club','2004-03-12 00:00:00','Ahmedabad','Graduate','Business','380013','Gujarat'),
 (10,'jay@gmail.com','Jay','male','Mehta','9376197557','navkar',1,2,'jaydeep','2016-03-13 09:50:49','2016-03-12 20:28:54','Rajpath Club','2004-03-12 00:00:00','Ahmedabad','Graduate','Business','380005','Gujarat');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
