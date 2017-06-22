# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.17)
# Database: goat_db
# Generation Time: 2017-04-05 00:43:42 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table marqueurs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `marqueurs`;

CREATE TABLE `marqueurs` (
  `idmarqueurs` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `chromosome` tinyint(4) DEFAULT NULL,
  `position` bigint(20) DEFAULT NULL,
  `phenotype` varchar(20) DEFAULT NULL,
  `mutation` varchar(20) DEFAULT NULL,
  `sorte` tinyint(4) DEFAULT NULL,
  `build_id` int(11) NOT NULL,
  `remapped_from_hg18` varchar(20) DEFAULT NULL,
  `refNCBI` varchar(5) DEFAULT NULL,
  `observed` varchar(5) DEFAULT NULL,
  `classe` varchar(15) DEFAULT NULL,
  `func` varchar(15) DEFAULT NULL,
  `frame` varchar(15) DEFAULT NULL,
  `codons` varchar(10) DEFAULT NULL,
  `peptides` varchar(5) DEFAULT NULL,
  `gene` varchar(15) DEFAULT NULL,
  `gene_strand` char(1) DEFAULT NULL,
  `start_gen` bigint(20) DEFAULT NULL,
  `end_gen` bigint(20) DEFAULT NULL,
  `gene_before` varchar(15) DEFAULT NULL,
  `gene_before_strand` char(1) DEFAULT NULL,
  `dist_gen_before` int(11) DEFAULT NULL,
  `start_gen_before` bigint(20) DEFAULT NULL,
  `end_gen_before` bigint(20) DEFAULT NULL,
  `gene_after` varchar(15) DEFAULT NULL,
  `gene_after_strand` char(1) DEFAULT NULL,
  `dist_gen_after` int(11) DEFAULT NULL,
  `start_gen_after` bigint(20) DEFAULT NULL,
  `end_gen_after` bigint(20) DEFAULT NULL,
  `idgenes` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmarqueurs`),
  KEY `marqueur_idx` (`nom`,`build_id`),
  KEY `gene_idx` (`gene`),
  KEY `genebe_idx` (`gene_before`),
  KEY `geneaf_idx` (`gene_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `marqueurs` WRITE;
/*!40000 ALTER TABLE `marqueurs` DISABLE KEYS */;

INSERT INTO `marqueurs` (`idmarqueurs`, `nom`, `chromosome`, `position`, `phenotype`, `mutation`, `sorte`, `build_id`, `remapped_from_hg18`, `refNCBI`, `observed`, `classe`, `func`, `frame`, `codons`, `peptides`, `gene`, `gene_strand`, `start_gen`, `end_gen`, `gene_before`, `gene_before_strand`, `dist_gen_before`, `start_gen_before`, `end_gen_before`, `gene_after`, `gene_after_strand`, `dist_gen_after`, `start_gen_after`, `end_gen_after`, `idgenes`)
VALUES
	(15,'rs12403445',1,180587560,'Lung cancer','Gene Fusion',1,19,'rs12403445','C','C/T','single','unknown','','','','','',NULL,NULL,'OVAAL','+',51905,180528109,180535654,'XPR1','+',13586,180601145,180859415,NULL),
	(35,'rs7539261',1,40050503,'Lung cancer','INDELs',1,19,'rs7539261','A','A/T','single','unknown','','','','','',NULL,NULL,'PABPC4','-',7981,40026484,40042521,'HEYL','-',38600,40089102,40105348,NULL),
	(238,'rs2718295',7,88262924,NULL,'INDELs',1,19,'rs2718295','G','C/T','single','unknown','','','','','',NULL,NULL,'STEAP4','-',326695,87905743,87936228,'ZNF804B','+',125829,88388752,88966346,NULL),
	(392,'rs6489602',12,5140968,NULL,NULL,1,19,'rs6489602','C','C/T','single','unknown','','','','','',NULL,NULL,'KCNA1','+',113545,5019072,5027422,'KCNA5','+',12117,5153084,5155954,NULL),
	(397,'rs1402337',12,119154183,NULL,NULL,1,19,'rs1402337','A','A/C','single','unknown','','','','','',NULL,NULL,'SUDS3','+',298342,118814357,118855840,'SRRM4','+',265117,119419299,119600856,NULL),
	(625,'rs1177257',14,35936786,'Colon cancer','Gene Fusion',1,19,'rs1177257','C','C/T','single','unknown','','','','','',NULL,NULL,'NFKBIA','-',62825,35870715,35873960,'INSM2','+',66462,36003247,36006260,NULL),
	(751,'rs2319227',4,68281255,'Lymphoma','Gene Fusion',1,19,'rs2319227','T','C/T','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'LOC101927237','-',1768,68283022,68287718,NULL),
	(249360,'rs2780419',4,27955,NULL,NULL,1,19,'rs2780419','T','G/T','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'ZNF595','+',25224,53178,88099,NULL),
	(619257,'rs11994016',8,146301381,NULL,NULL,1,19,'rs11994016','A','A/G/T','single','unknown','','','','','',NULL,NULL,'C8orf33','+',19964,146277823,146281416,'','',NULL,NULL,NULL,NULL),
	(626544,'rs80001234',16,79609,NULL,NULL,1,19,'rs80001234','C','C/G','single','unknown','','','','','',NULL,NULL,'MIR6859-1','-',12489,67051,67119,'POLR3K','-',17370,96978,103632,NULL),
	(630385,'rs6078030',20,61098,NULL,NULL,1,19,'rs6078030','C','C/T','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'DEFB125','+',7253,68350,77296,NULL),
	(1314695,'rs3890680',1,249222325,NULL,NULL,1,19,'rs3890680','C','G/T','single','unknown','','','','','',NULL,NULL,'PGBD2','+',8979,249200441,249213345,'','',NULL,NULL,NULL,NULL),
	(1314696,'rs28804817',2,10587,NULL,NULL,1,19,'rs28804817','C','C/G','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'FAM110C','-',28227,38813,46588,NULL),
	(1882142,'rs140224037',2,243185679,NULL,NULL,1,19,'rs140224037','C','C/T','single','unknown','','','','','',NULL,NULL,'LOC728323','+',83209,243030843,243102469,'','',NULL,NULL,NULL,NULL),
	(1882143,'rs115479960',3,60197,NULL,NULL,1,19,'rs115479960','G','A/G','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'LOC102723448','+',5234,65430,66175,NULL),
	(2368431,'rs145602810',3,197897481,NULL,NULL,1,19,'rs145602810','C','C/T','single','intron','','','','FAM157A','+',197879236,197907728,'ANKRD18DP','-',89938,197784403,197807542,'','',NULL,NULL,NULL,NULL),
	(2801173,'rs2558128',4,168052827,'Lung cancer','INDELs',1,19,'rs2558128','A','A/G','single','intron','','','','SPOCK3','-',167675236,168155741,'','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL),
	(2870708,'rs55926606',5,12041,NULL,NULL,1,19,'rs55926606','A','A/T','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'PLEKHG4B','+',128332,140372,190087,NULL),
	(3313242,'rs115242155',5,180736063,NULL,NULL,1,19,'rs115242155','T','C/T','single','unknown','','','','','',NULL,NULL,'TRIM52-AS1','+',36754,180688212,180699308,'LOC100132062','+',14444,180750506,180755196,NULL),
	(3746730,'rs144128372',7,31273,NULL,NULL,1,19,'rs144128372','G','C/G','single','coding-synon','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'LOC100507642','+',118445,149717,155461,NULL),
	(4146947,'rs145893243',7,159128550,NULL,NULL,1,19,'rs145893243','C','C/G','single','unknown','','','','','',NULL,NULL,'VIPR2','-',190900,158820865,158937649,'','',NULL,NULL,NULL,NULL),
	(4146948,'rs72621144',8,91936,NULL,NULL,1,19,'rs72621144','A','A/G','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'OR4F21','-',24150,116085,117024,NULL),
	(4807737,'rs11562371',9,141107896,NULL,NULL,1,19,'rs11562371','C','C/T','single','intron','','','','FAM157B','+',141106636,141134172,'TUBBP5','+',36010,141044564,141071885,'','',NULL,NULL,NULL,NULL),
	(4807738,'rs12260013',10,66326,NULL,NULL,1,19,'rs12260013','A','A/G','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'TUBB8','-',26502,92827,95178,NULL),
	(5150234,'rs188499125',11,123638,NULL,NULL,1,19,'rs188499125','C','C/T','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'LINC01001','-',3349,126986,131920,NULL),
	(5488078,'rs145878490',11,134946396,NULL,NULL,1,19,'rs145878490','C','C/T','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL),
	(5816245,'rs148120759',12,133841396,NULL,NULL,1,19,'rs148120759','C','C/T','single','unknown','','','','','',NULL,NULL,'ANHX','-',28973,133794897,133812422,'','',NULL,NULL,NULL,NULL),
	(5816246,'rs184229798',13,19020341,NULL,NULL,1,19,'rs184229798','C','C/T','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'LINC00417','-',291899,19312239,19314239,NULL),
	(6066000,'rs185559716',13,115109852,NULL,NULL,1,19,'rs185559716','C','C/T','single','unknown','','','','','',NULL,NULL,'CHAMP1','+',17048,115079964,115092803,'','',NULL,NULL,NULL,NULL),
	(6289593,'rs72694517',14,107289436,NULL,NULL,1,19,'rs72694517','C','C/G','single','unknown','','','','','',NULL,NULL,'LINC00221','+',337906,106938444,106951529,'','',NULL,NULL,NULL,NULL),
	(6688663,'rs62052688',16,90173553,NULL,NULL,1,19,'rs62052688','G','G/T','single','intron','','','','','',NULL,NULL,'PRDM7','-',31214,90122973,90142338,'','',NULL,NULL,NULL,NULL),
	(6688664,'rs62053745',17,828,NULL,NULL,1,19,'rs62053745','T','C/T','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'DOC2B','-',5183,6010,31421,NULL),
	(6865698,'rs137866916',17,81106667,NULL,NULL,1,19,'rs137866916','T','C/T','single','unknown','','','','','',NULL,NULL,'METRNL','+',54075,81037566,81052591,'FLJ43681','+',67999,81174665,81188573,NULL),
	(6865699,'rs114463029',18,10706,NULL,NULL,1,19,'rs114463029','A','A/T','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'LOC102723376','+',1369,12074,15930,NULL),
	(7060173,'rs149056417',18,78017073,NULL,NULL,1,19,'rs149056417','C','C/G','single','unknown','','','','','',NULL,NULL,'PARD6G','-',11675,77915116,78005397,'','',NULL,NULL,NULL,NULL),
	(7217358,'rs148717940',19,59106530,NULL,NULL,1,19,'rs148717940','C','C/T','single','unknown','','','','','',NULL,NULL,'CENPBD1P1','+',10767,59086765,59095762,'','',NULL,NULL,NULL,NULL),
	(7460228,'rs141010241',21,48116032,NULL,NULL,1,19,'rs141010241','A','A/C','single','unknown','','','','','',NULL,NULL,'PRMT2','+',30995,48055506,48085036,'','',NULL,NULL,NULL,NULL),
	(7557591,'rs3896457',22,51237063,NULL,NULL,1,19,'rs3896457','T','C/T','single','intron','','','','RPL23AP82','+',51195513,51238065,'RABL2B','-',14975,51205919,51222087,'','',NULL,NULL,NULL,NULL),
	(7666209,'rs11928226',21,9502245,NULL,NULL,1,19,'rs11928226','C','A/G','single','unknown','','','','LINC01266','+',633787,887698,'CHL1','+',198958,361365,451097,'MIR3648-1','+',323587,9825831,9826011,NULL),
	(7902676,'rs2382609',14,19014036,NULL,NULL,1,19,'rs2382609','CA','C/T','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'OR11H12','+',363559,19377593,19378574,NULL),
	(7926190,'rs2742301',0,155239436,NULL,NULL,1,19,'rs2742301','G','A/G','single','intron','','','','IL9R','+',59330251,59343488,'VAMP7','+',66002,155110942,155173433,'DDX11L16','-',15887,59358328,59360854,NULL),
	(7930383,'rs2811026',9,46431,NULL,NULL,1,19,'rs2811026','C','C/G','single','unknown','','','','','',NULL,NULL,'FAM138C','-',10566,34393,35864,'PGM5P3-AS1','+',26259,72689,88826,NULL),
	(7935942,'rs2857291',0,195,NULL,NULL,1,19,'rs2857291','T','C/T','single','near-gene-5','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL),
	(7944394,'rs2981835',12,90072,NULL,NULL,1,19,'rs2981835','T','C/T','single','unknown','','','','LOC100288778','+',87983,91263,'IL9R','+',13699,59330251,59343488,'DDX11L16','-',1141,155255322,155257848,NULL),
	(7972201,'rs403917',1,37965,NULL,NULL,1,19,'rs403917','C','C/G','single','unknown','','','','','',NULL,NULL,'FAM138C','-',1882,34393,35864,'FAM138B','+',1894,114334958,114336429,NULL),
	(7989844,'rs4389403',22,16055070,NULL,NULL,1,19,'rs4389403','G','A/G','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'DUXAP8','-',95459,16150528,16193009,NULL),
	(8095573,'rs10420301',19,47198,NULL,NULL,1,19,'rs10420301','C','C/T','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL),
	(8203768,'rs56264018',6,170982044,NULL,NULL,1,19,'rs56264018','A','A/T','single','unknown','','','','','',NULL,NULL,'PDCD2','-',88263,170890834,170893780,'','',NULL,NULL,NULL,NULL),
	(8232888,'rs10005853',4,190939665,NULL,NULL,1,19,'rs10005853','T','G/T','single','unknown','','','','','',NULL,NULL,'FRG1','+',55305,190861973,190884359,'FRG2','-',5852,29338,32226,NULL),
	(8237316,'rs793063',10,135510537,NULL,NULL,1,19,'rs793063','T','C/T','single','unknown','','','','RPL23AP7','-',114368815,114384715,'DDX11L2','-',13582,114356604,114361294,'LOC101060091','-',213883,114588759,114648569,NULL),
	(8249091,'rs7754266',6,149609,NULL,NULL,1,19,'rs7754266','G','A/G','single','unknown','','','','','',NULL,NULL,'LINC00266-3','-',1449,66129,74245,'LOC285766','-',31857,181465,205484,NULL),
	(8337060,'rs73398154',15,20008371,NULL,NULL,1,19,'rs73398154','C','C/T','single','unknown','','','','','',NULL,NULL,'','',NULL,NULL,NULL,'CHEK2P2','+',479626,20487996,20496811,NULL),
	(8359348,'rs7270744',20,62964366,NULL,NULL,1,19,'rs7270744','T','G/T','single','unknown','','','','','',NULL,NULL,'LINC00266-1','+',29658,62921737,62934707,'','',NULL,NULL,NULL,NULL),
	(8364120,'rs1167335',15,102464377,NULL,NULL,1,19,'rs1167335','G','C/T','single','near-gene-5','','','','','',NULL,NULL,'OR4F4','-',1114,102462344,102463262,'FAM138E','+',30711,102495087,102496558,NULL);

/*!40000 ALTER TABLE `marqueurs` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
