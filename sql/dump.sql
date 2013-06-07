-- MySQL dump 10.11
--
-- Host: localhost    Database: zf2_eteam
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `player` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `realname` varchar(100) default NULL,
  `country` varchar(2) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (29,'Darien','Evgeny Mazaev','ru'),(30,'Diamondprox','Danil Reshetnikov','ru'),(31,'Alex Ich','Aleksei Ichetovkin','ru'),(32,'Genja','Evgeny Andryushin','ru');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooster`
--

DROP TABLE IF EXISTS `rooster`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `rooster` (
  `id` int(11) NOT NULL auto_increment,
  `ide_player` int(11) default NULL,
  `ide_team` int(11) default NULL,
  `role` varchar(45) default NULL,
  `dateStart` date default NULL,
  `dateEnd` date default NULL,
  PRIMARY KEY  (`id`),
  KEY `player_team` (`ide_player`,`ide_team`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `rooster`
--

LOCK TABLES `rooster` WRITE;
/*!40000 ALTER TABLE `rooster` DISABLE KEYS */;
INSERT INTO `rooster` VALUES (17,29,125,'Top',NULL,NULL),(18,30,125,'Jungle',NULL,NULL),(19,31,125,'Mid',NULL,NULL),(20,32,125,'AD',NULL,NULL);
/*!40000 ALTER TABLE `rooster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `team` (
  `id` int(11) NOT NULL auto_increment,
  `lgp_pageId` int(11) default NULL,
  `lgp_regionId` int(11) default NULL,
  `name` varchar(100) default NULL,
  `shortname` varchar(10) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `leaguepediaId` (`lgp_pageId`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,352720,345902,'Absolute Legends Singapore',NULL),(2,344546,345902,'AgFox',NULL),(3,350946,345902,'Ahq e-Sports Club',NULL),(4,355768,345902,'Ahq e-Sports Club Korea',NULL),(5,352839,345902,'User:ALDummie/MyRevenge Japan',NULL),(6,350634,345902,'All Gamers',NULL),(7,343387,345902,'Azubu Blaze',NULL),(8,343380,345902,'Azubu Frost',NULL),(9,345286,345902,'Bangkok Titans',NULL),(10,351134,345902,'Blackbean',NULL),(11,356103,345902,'Cheetahs',NULL),(12,346252,345902,'CJ Entus',NULL),(13,355295,345902,'CJ Entus Blaze',NULL),(14,355296,345902,'CJ Entus Frost',NULL),(15,357862,345902,'CLUB Activist',NULL),(16,344893,345902,'CrossGaming',NULL),(17,359012,345902,'Cyber Games Arena LEGENDs',NULL),(18,356093,345902,'Defenders',NULL),(19,358057,345902,'E-Sports Dragons Pro',NULL),(20,352723,345902,'Eat Sleep Game',NULL),(21,343215,345902,'EHOME',NULL),(22,358468,345902,'EMD ExeCuTioNeR',NULL),(23,357863,345902,'Energy Pacemaker',NULL),(24,359138,345902,'Energy Pacemaker.E',NULL),(25,358105,345902,'Full Louis',NULL),(26,358060,345902,'Gamania Bears',NULL),(27,348127,345902,'GJR',NULL),(28,348125,345902,'GSG',NULL),(29,356096,345902,'Heavy Artillery',NULL),(30,360902,345902,'HiGo',NULL),(31,357944,345902,'HK Attitude',NULL),(32,355525,345902,'HongKongCarries',NULL),(33,349852,345902,'IceLanD',NULL),(34,345724,345902,'Incredible Miracle',NULL),(35,357594,345902,'Incredible Miracle 2',NULL),(36,358505,345902,'Insidious Gaming Exile',NULL),(37,358506,345902,'Insidious Gaming Outlaw',NULL),(38,343216,345902,'Invictus Gaming',NULL),(39,358539,345902,'Jakarta Scourge',NULL),(40,350688,345902,'KT Rolster A',NULL),(41,350771,345902,'KT Rolster B',NULL),(42,345224,345902,'Kuala Lumpur Hunters',NULL),(43,350061,345902,'LD50 Gaming',NULL),(44,348481,345902,'LGD Gaming',NULL),(45,343410,345902,'Little Hippo',NULL),(46,355210,345902,'Livemore',NULL),(47,344755,345902,'Manila Eagles',NULL),(48,358114,345902,'Mineski',NULL),(49,343413,345902,'MKZ',NULL),(50,350406,345902,'MSI Evolution Gaming Team',NULL),(51,345732,345902,'MVP Blue',NULL),(52,345731,345902,'MVP Ozone',NULL),(53,347336,345902,'NaJin Shield',NULL),(54,343341,345902,'NaJin Sword',NULL),(55,343432,345902,'NEB',NULL),(56,343422,345902,'NeL',NULL),(57,349699,345902,'Noah\'s Ark',NULL),(58,358509,345902,'NoGAMESENSE',NULL),(59,349740,345902,'OMG',NULL),(60,359060,345902,'Portal:Teams/China',NULL),(61,359062,345902,'Portal:Teams/Southeast Asia',NULL),(62,349877,345902,'Positive Energy',NULL),(63,359144,345902,'RisingStars Gaming',NULL),(64,351845,345902,'Royal Club Huang Zu',NULL),(65,355913,345902,'Royal Club Tian Ci',NULL),(66,345288,345902,'Saigon Jokers',NULL),(67,345222,345902,'Singapore Sentinels',NULL),(68,352824,345902,'SK Telecom T1',NULL),(69,356406,345902,'SK Telecom T1 2',NULL),(70,343381,345902,'StarTale',NULL),(71,356099,345902,'Submarines',NULL),(72,343433,345902,'SuperStar',NULL),(73,344462,345902,'Taipei Assassins',NULL),(74,353327,345902,'Taipei Snipers',NULL),(75,343350,345902,'Team Hunters',NULL),(76,349287,345902,'Team Immunity',NULL),(77,362014,345902,'Team Infinite',NULL),(78,358644,345902,'Team Infinity',NULL),(79,343418,345902,'Team OP',NULL),(80,343217,345902,'Team WE',NULL),(81,352643,345902,'Team WE/pt-br',NULL),(82,348424,345902,'Tempest',NULL),(83,358688,345902,'Toukon',NULL),(84,344897,345902,'Tt Dragons Taiwan',NULL),(85,356303,345902,'Unorthodox Singapore',NULL),(86,359091,345902,'Vici Gaming',NULL),(87,357632,345902,'Virtual Throne Gaming Dynamic',NULL),(88,356198,345902,'Virtual Throne Gaming Monsters',NULL),(89,358018,345902,'Wayi Spider',NULL),(90,355211,345902,'Wayi Spider China',NULL),(91,355208,345902,'Wings of Aurora',NULL),(92,360921,345902,'Wings of Aurora 2',NULL),(93,343427,345902,'XD',NULL),(94,343389,345902,'Xenics Storm',NULL),(95,358023,345902,'Yoe IRONMEN',NULL),(96,362069,345902,'YouCantStopMe',NULL),(97,345817,343222,'3DMAX',NULL),(98,348186,343222,'Absolute Legends',NULL),(99,348935,343222,'AbsoluteLegends.Omega',NULL),(100,343154,343222,'Against All authority',NULL),(101,352849,343222,'Anexis eSports',NULL),(102,355803,343222,'Animate eSports',NULL),(103,356393,343222,'AT Gaming',NULL),(104,358172,343222,'Benched Gaming',NULL),(105,350119,343222,'User:CEbbesen/sandbox',NULL),(106,349348,343222,'Copenhagen Wolves',NULL),(107,343205,343222,'Counter Logic Gaming Europe',NULL),(108,352687,343222,'Counter Logic Gaming Europe/de',NULL),(109,353266,343222,'Counter Logic Gaming Europe/zh-hant',NULL),(110,355831,343222,'Dark Passage',NULL),(111,352411,343222,'DELTAeSPORTS',NULL),(112,357964,343222,'Dexter is actually evil',NULL),(113,352859,343222,'DragonBorns',NULL),(114,344612,343222,'Eclypsia',NULL),(115,349245,343222,'Eclypsia.Luna',NULL),(116,348159,343222,'EloHell',NULL),(117,343827,343222,'ESC Gaming',NULL),(118,355646,343222,'ESuba',NULL),(119,361283,343222,'Europe LCS',NULL),(120,354967,343222,'Evil Geniuses',NULL),(121,343124,343222,'Fnatic',NULL),(122,356226,343222,'Fnatic.Beta',NULL),(123,354195,343222,'Fnatic/zh-hant',NULL),(124,343225,343222,'Frag eXecutors',NULL),(125,354177,343222,'Gambit Gaming',NULL),(126,347626,343222,'Gameburg Team',NULL),(127,347849,343222,'Gamehoppers.eu',NULL),(128,355886,343222,'GamingGear.eu',NULL),(129,361953,343222,'GF-Gaming',NULL),(130,351740,343222,'GIANTS! Gaming',NULL),(131,361954,343222,'Heimerdingers Colossi',NULL),(132,355668,343222,'HWA Gaming',NULL),(133,354293,343222,'IQuit-Gaming Greece',NULL),(134,350822,343222,'IWantCookie',NULL),(135,343388,343222,'LogiX',NULL),(136,343570,343222,'LowLandLions',NULL),(137,358630,343222,'Luna Gaming',NULL),(138,343525,343222,'MeetYourMakers',NULL),(139,343179,343222,'Millenium',NULL),(140,343096,343222,'Moscow Five',NULL),(141,352695,343222,'Moscow Five/de',NULL),(142,343366,343222,'Mousesports',NULL),(143,343440,343222,'MTw',NULL),(144,343826,343222,'MyRevenge',NULL),(145,359040,343222,'N!faculty e-Sports Club',NULL),(146,343400,343222,'Natus Vincere',NULL),(147,355652,343222,'Peculiar gaming',NULL),(148,361900,343222,'PrideFC',NULL),(149,355815,343222,'Reason Gaming',NULL),(150,358894,343222,'Revolt Gentlemen E-Sports Club EUNE',NULL),(151,359439,343222,'Revolt Gentlemen E-Sports Club EUW',NULL),(152,357551,343222,'RoughNeX',NULL),(153,357834,343222,'Samurai in Jeans',NULL),(154,355662,343222,'Sinners Never Sleep',NULL),(155,343113,343222,'SK Gaming',NULL),(156,352663,343222,'SK Gaming/de',NULL),(157,354172,343222,'SK Gaming/zh-hant',NULL),(158,356276,343222,'SNOGARD Dragons',NULL),(159,344056,343222,'TCM-Gaming',NULL),(160,344843,343222,'Team Acer',NULL),(161,346146,343222,'Team Acer Poland',NULL),(162,343219,343222,'Team ALTERNATE',NULL),(163,349386,343222,'Team BLACK',NULL),(164,359258,343222,'Team Dignitas UK',NULL),(165,349977,343222,'Team Eloblade',NULL),(166,344963,343222,'Team gamed!de',NULL),(167,347116,343222,'Team LoL Pro',NULL),(168,347435,343222,'Team MegashocK',NULL),(169,358930,343222,'Team Server-Forge',NULL),(170,353256,343222,'Team Solo Mebdi',NULL),(171,343152,343222,'Team Sypher',NULL),(172,351084,343222,'Team Turquality BLUE',NULL),(173,343494,343222,'Team WinFakt',NULL),(174,351450,343222,'Teamless',NULL),(175,359107,343222,'TRICKED eSport',NULL),(176,348108,343222,'Tt Dragons',NULL),(177,343308,343222,'Western Wolves',NULL),(178,358015,343222,'Wizards e-Sports Club',NULL),(179,343975,343222,'X6tence',NULL),(180,353462,343218,'1 Trick Ponies',NULL),(181,343191,343218,'4Nothing',NULL),(182,344809,343218,'Absolute Legends North America',NULL),(183,347636,343218,'User:AlexPenn/Kill Steal Gaming',NULL),(184,355034,343218,'User:AlexPenn/sandbox10',NULL),(185,350182,343218,'User:AlexPenn/sandboxteams',NULL),(186,345262,343218,'APictureOfAGoose',NULL),(187,354998,343218,'User:Atomice07',NULL),(188,353640,343218,'Azure Cats',NULL),(189,355708,343218,'User:Bly08',NULL),(190,344988,343218,'Chicks Dig Elo',NULL),(191,343173,343218,'Choppa In Da Car',NULL),(192,353516,343218,'Chuuper\'s Troopers',NULL),(193,353192,343218,'CLG Prime/de',NULL),(194,353108,343218,'Cloud 9',NULL),(195,353437,343218,'CompLexity Academy',NULL),(196,345226,343218,'CompLexity Gaming',NULL),(197,342997,343218,'Counter Logic Gaming',NULL),(198,346086,343218,'Counter Logic Gaming Black',NULL),(199,353346,343218,'Counter Logic Gaming/zh-hant',NULL),(200,354971,343218,'Curse Academy',NULL),(201,353311,343218,'Curse Gaming/zh-hant',NULL),(202,354688,343218,'Cutest of Cats',NULL),(203,350134,343218,'User:Daemonomics/sandbox',NULL),(204,349833,343218,'Dirt Nap Gaming',NULL),(205,350055,343218,'Dirt Nap Gaming.Panda',NULL),(206,358356,343218,'DoubleBuff',NULL),(207,350187,343218,'User:Ductapeofdoom/DM United',NULL),(208,343028,343218,'Epik Gamer',NULL),(209,353520,343218,'Falafel Gaming',NULL),(210,352893,343218,'FXOpen e-Sports',NULL),(211,354224,343218,'High Rollers Gaming',NULL),(212,347582,343218,'Jpak and friends',NULL),(213,347732,343218,'Kevin Is A Noob',NULL),(214,348904,343218,'Meat Playground',NULL),(215,347607,343218,'Monomaniac eSports',NULL),(216,349364,343218,'Monomaniac Evito',NULL),(217,349363,343218,'Monomaniac Imperium',NULL),(218,347920,343218,'Monomaniac Ultimus',NULL),(219,349940,343218,'User:Morbuzaan/sandboxblrist',NULL),(220,343158,343218,'MTw North America',NULL),(221,361281,343218,'North America LCS',NULL),(222,344623,343218,'Orbit Gaming',NULL),(223,345035,343218,'Ordinance Gaming',NULL),(224,351045,343218,'Pulse Esports',NULL),(225,351504,343218,'Quantic Gaming',NULL),(226,345737,343218,'RFLX Gaming',NULL),(227,343930,343218,'Rock Solid',NULL),(228,353430,343218,'User:SGDelacour/Severity Gaming',NULL),(229,358232,343218,'SiN Park',NULL),(230,355721,343218,'Square Duck',NULL),(231,358027,343218,'Team Astral Poke',NULL),(232,353380,343218,'Team Coast',NULL),(233,343416,343218,'Team Curse',NULL),(234,343019,343218,'Team Dignitas',NULL),(235,354089,343218,'Team Dignitas/zh-hant',NULL),(236,345101,343218,'Team Dynamic',NULL),(237,351125,343218,'Team FeaR',NULL),(238,345721,343218,'Team Green Forest',NULL),(239,343170,343218,'Team Legion',NULL),(240,347518,343218,'Team MRN',NULL),(241,357782,343218,'Team Solo Queue',NULL),(242,343015,343218,'Team SoloMid',NULL),(243,347820,343218,'Team SoloMid Evo',NULL),(244,352635,343218,'Team SoloMid/de',NULL),(245,353752,343218,'Team SoloMid/zh-hant',NULL),(246,357913,343218,'Team Summon',NULL),(247,353451,343218,'Team TowerDiveTV',NULL),(248,355232,343218,'Team Vulcun',NULL),(249,352500,343218,'The Brunch Club',NULL),(250,353482,343218,'The Salad Bar',NULL),(251,354074,343218,'User:Thth/sandbox/CompLexity',NULL),(252,354073,343218,'User:Thth/sandbox/CompLexity Academy',NULL),(253,349636,343218,'To-Do List/Team Example',NULL),(254,349204,343218,'Under Rated Gaming',NULL),(255,345282,343218,'UnRestricted',NULL),(256,343188,343218,'V8 eSports',NULL),(257,356147,343218,'Velocity eSports',NULL),(258,344578,343218,'VVv Gaming',NULL),(259,359218,343218,'Wazabi Gaming',NULL);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-07 14:52:32
