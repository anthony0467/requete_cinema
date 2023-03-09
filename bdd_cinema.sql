-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour cinema_anthony
CREATE DATABASE IF NOT EXISTS `cinema_anthony` /*!40100 DEFAULT CHARACTER SET cp1250 COLLATE cp1250_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema_anthony`;

-- Listage de la structure de la table cinema_anthony. acteur
CREATE TABLE IF NOT EXISTS `acteur` (
  `id_acteur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_acteur`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `acteur__personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema_anthony.acteur : ~11 rows (environ)
/*!40000 ALTER TABLE `acteur` DISABLE KEYS */;
INSERT INTO `acteur` (`id_acteur`, `id_personne`) VALUES
	(1, 4),
	(2, 5),
	(3, 6),
	(4, 7),
	(5, 8),
	(6, 9),
	(7, 10),
	(8, 11),
	(9, 12),
	(10, 13),
	(11, 14);
/*!40000 ALTER TABLE `acteur` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. casting
CREATE TABLE IF NOT EXISTS `casting` (
  `id_acteur` int DEFAULT NULL,
  `id_film` int DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  KEY `id_acteur` (`id_acteur`),
  KEY `id_film` (`id_film`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `casting__acteur` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`),
  CONSTRAINT `casting__film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `casting__role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema_anthony.casting : ~32 rows (environ)
/*!40000 ALTER TABLE `casting` DISABLE KEYS */;
INSERT INTO `casting` (`id_acteur`, `id_film`, `id_role`) VALUES
	(1, 1, 2),
	(1, 2, 2),
	(1, 3, 2),
	(2, 1, 3),
	(2, 2, 3),
	(2, 3, 3),
	(2, 9, 3),
	(2, 10, 3),
	(3, 1, 5),
	(3, 2, 5),
	(3, 3, 5),
	(3, 8, 5),
	(3, 9, 5),
	(3, 10, 5),
	(4, 1, 10),
	(4, 2, 10),
	(4, 3, 10),
	(5, 8, 6),
	(5, 9, 6),
	(5, 10, 6),
	(6, 4, 1),
	(6, 5, 1),
	(6, 6, 1),
	(7, 5, 4),
	(8, 7, 1),
	(9, 11, 8),
	(9, 7, 8),
	(10, 12, 7),
	(10, 11, 9),
	(10, 7, 9),
	(11, 1, 6),
	(11, 3, 6);
/*!40000 ALTER TABLE `casting` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. categoriser
CREATE TABLE IF NOT EXISTS `categoriser` (
  `id_film` int DEFAULT NULL,
  `id_genre` int DEFAULT NULL,
  KEY `id_film` (`id_film`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `categoriser__film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `categoriser__genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema_anthony.categoriser : ~19 rows (environ)
/*!40000 ALTER TABLE `categoriser` DISABLE KEYS */;
INSERT INTO `categoriser` (`id_film`, `id_genre`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 2),
	(4, 6),
	(5, 2),
	(5, 6),
	(6, 2),
	(6, 6),
	(7, 2),
	(7, 6),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 2),
	(11, 6),
	(12, 3),
	(12, 4),
	(12, 5);
/*!40000 ALTER TABLE `categoriser` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `annee_sortie_film` int NOT NULL,
  `synopsis` longtext,
  `duree_minute` int NOT NULL,
  `note` int DEFAULT NULL,
  `affiche` varchar(255) DEFAULT NULL,
  `id_realisateur` int DEFAULT NULL,
  PRIMARY KEY (`id_film`),
  KEY `id_realisateur` (`id_realisateur`),
  CONSTRAINT `FK_film_realisateur` FOREIGN KEY (`id_realisateur`) REFERENCES `realisateur` (`id_realisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema_anthony.film : ~14 rows (environ)
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` (`id_film`, `titre`, `annee_sortie_film`, `synopsis`, `duree_minute`, `note`, `affiche`, `id_realisateur`) VALUES
	(1, 'Le seigneur des anneaux - la communauté de l\'annea', 2001, 'Un jeune et timide Hobbit, Frodon Sacquet, hérite d\'un anneau magique. Bien loin d\'être une simple babiole, il s\'agit d\'un instrument de pouvoir absolu qui permettrait à Sauron, le "Seigneur des ténèbres", de régner sur la Terre du Milieu et de réduire en esclavage ses peuples. Frodon doit parvenir, avec l\'aide de la communauté de l\'anneau, jusqu\'à la "Crevasse du Destin" pour le détruire.', 178, 5, NULL, 1),
	(2, 'Le seigneur des anneaux - les deux tours', 2002, ' Après la mort de Boromir et la disparition de Gandalf, la Communauté s\'est scindée en trois. Perdus dans les collines d\'Emyn Muil, Frodon et Sam découvrent qu\'ils sont suivis par Gollum, une créature versatile corrompue par l\'Anneau. Celui-ci promet de conduire les Hobbits jusqu\'à la Porte Noire du Mordor.', 179, 5, NULL, 1),
	(3, 'Le seigneur des anneaux - le retour du roi', 2003, 'Les armées de Sauron ont attaqué Minas Tirith, la capitale du Gondor. Jamais ce royaume autrefois puissant n\'a eu autant besoin de son roi. Cependant, Aragorn trouvera-t-il en lui la volonté d\'accomplir sa destinée ? Tandis que Gandalf s\'efforce de soutenir les forces brisées de Gondor, Théoden exhorte les guerriers de Rohan à se joindre au combat. Cependant, malgré leur courage et leur loyauté, les forces des Hommes ne sont pas de taille à lutter contre les innombrables légions d\'ennemis.', 201, 5, NULL, 1),
	(4, 'Batman begins', 2005, 'Comment un homme seul peut-il changer le monde ? Telle est la question qui hante Bruce Wayne depuis cette nuit tragique où ses parents furent abattus sous ses yeux, dans une ruelle de Gotham City. Torturé par un profond sentiment de colère et de culpabilité, le jeune héritier de cette richissime famille fuit Gotham pour un long et discret voyage à travers le monde. Le but de ses pérégrinations : sublimer sa soif de vengeance en trouvant de nouveaux moyens de lutter contre l\'injustice.', 140, 4, NULL, 2),
	(5, 'Batman the dark knight', 2008, 'Batman est plus que jamais déterminé à éradiquer le crime organisé qui sème la terreur en ville. Epaulé par le lieutenant Jim Gordon et par le procureur de Gotham City, Harvey Dent, Batman voit son champ d\'action s\'élargir. La collaboration des trois hommes s\'avère très efficace et ne tarde pas à porter ses fruits jusqu\'à ce qu\'un criminel redoutable vienne plonger la ville de Gotham City dans le chaos.', 152, 5, NULL, 2),
	(6, 'Batman the dark knight rises', 2012, 'Il y a huit ans, Batman a disparu dans la nuit : lui qui était un héros est alors devenu un fugitif. L\'arrivée d\'une féline et fourbe cambrioleuse au mystérieux dessein chamboule l\'ordre établi. Bien plus dangereuse encore est l\'apparition de Bane, terroriste masqué dont l\'impitoyable projet pour Gotham pousse Bruce à sortir de l\'exil qu\'il s\'est imposé. Mais bien qu\'il reprenne cape et masque, Batman pourrait ne pas être un adversaire à la taille de Bane...', 164, 3, NULL, 2),
	(7, 'Batman v Superman: l\'aube de la justice', 2016, 'Craignant les débordements d\'un superhéros aux pouvoirs infinis, le justicier de Gotham City, lui-même doté d\'une détermination et d\'une force de frappe redoutables, affronte le sauveur des temps modernes adulé de Metropolis sous le regard du monde entier qui se demande quel type de héros lui convient le mieux. Mais pendant que la guerre entre Batman et Superman fait rage, une nouvelle menace se dresse, faisant régner sur l\'humanité une menace plus grande que jamais.', 152, 2, NULL, 3),
	(8, 'Le hobbit - un voyage inattendu', 2012, 'Bilbon Sacquet mène une existence paisible dans sa maison, jusqu\'à ce que le magicien Gandalf vienne le chercher pour qu\'il prenne part à une aventure avec un groupe de nains. Ces derniers veulent reconquérir leur royaume, détruit par le terrible dragon cracheur de feu Smaug, qui habite toujours les lieux, planqué sous des milliers de pièces d\'or. Ils devront affronter des orques, des gobelins, des trolls, sympathiser avec les Elfes, leurs ennemis, et affronter des forces maléfiques.', 169, 4, NULL, 1),
	(9, 'Le hobbit - la désolation de smaug', 2013, 'Bilbon Sacquet et les Nains continuent leur quête vers la Montagne Solitaire. Les trolls sont à leurs trousses alors qu\'ils s\'engagent dans la dangereuse forêt de Mirkwood. Attaqués par des araignées géantes puis capturés par les Elfes, ils s\'évadent et sont sauvés grâce aux talents au combat de Legolas et de Tauriel. Pendant ce temps, Gandalf est sur la piste de la force sombre qui prépare secrètement son retour à Dol Guldur.', 161, 3, NULL, 1),
	(10, 'Le hobbit - la bataille des cinq armées', 2014, 'Atteignant enfin la Montagne Solitaire, Thorin et les Nains, aidés par Bilbon le Hobbit, ont réussi à récupérer leur royaume et leur trésor. Ils ont également réveillé le dragon Smaug qui déchaîne désormais sa colère sur les habitants de Lac-ville. À présent, les Nains, les Elfes, les Humains mais aussi les Wrags et les Orques menés par le Nécromancien, convoitent les richesses de la Montagne Solitaire.', 144, 4, NULL, 1),
	(11, 'Man of steel', 2013, 'Lorsque Jor-El comprend que sa planète, Krypton, est au bord de l\'annihilation, il décide d\'envoyer son fils unique, Kal-El, sur la planète Terre dans le but de sauver sa race. Kal-El est recueilli par des fermiers qui le nomment Clark et lui apprennent à cacher ses pouvoirs surnaturels pour éviter d\'effrayer les Terriens. Clark grandit et finit par découvrir ses origines.', 143, 2, NULL, 3),
	(12, 'Danse avec les loups', 1991, 'Dans un avant-poste de l\'Ouest américain, la vie d\'un soldat est transformée au contact d\'une tribu indienne.', 181, 5, NULL, 4),
	(13, 'History of violence', 2005, 'Lorsqu\'une paire de petits criminels tente de voler son restaurant de petite ville, Tom Stall les tue rapidement. Au milieu de la couverture médiatique des actions apparemment héroïques de Tom, un étranger menaçant nommé Carl Fogarty arrive en ville et révèle que le père de famille serait en fait un criminel de Philadelphie disparu depuis longtemps. À la grande horreur de sa femme, Edie, et de son fils adolescent, Jack, Tom découvre qu\'il doit affronter son passé violent.', 96, 4, NULL, 5),
	(14, 'Avatar 2', 2022, 'Jake Sully et Ney\'tiri ont formé une famille et font tout pour rester aussi soudés que possible. Ils sont cependant contraints de quitter leur foyer et d\'explorer les différentes régions encore mystérieuses de Pandora. Lorsqu\'une ancienne menace refait surface, Jake va devoir mener une guerre difficile contre les humains.', 192, 3, NULL, NULL);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `nom_genre` varchar(20) NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema_anthony.genre : ~6 rows (environ)
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`id_genre`, `nom_genre`) VALUES
	(1, 'Fantasy'),
	(2, 'Super-héros'),
	(3, 'Aventure'),
	(4, 'Drame'),
	(5, 'Western'),
	(6, 'Action');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. personne
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `sexe` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema_anthony.personne : ~16 rows (environ)
/*!40000 ALTER TABLE `personne` DISABLE KEYS */;
INSERT INTO `personne` (`id_personne`, `nom`, `prenom`, `sexe`, `date_naissance`) VALUES
	(1, 'Jackson', 'Peter', 'H', '1961-10-31'),
	(2, 'Nolan', 'Christopher', 'H', '1970-07-30'),
	(3, 'Snyder', 'Zack', 'H', '1966-03-01'),
	(4, 'Mortensen', 'Viggo', 'H', '1958-10-20'),
	(5, 'Bloom', 'Orlando', 'H', '1977-01-13'),
	(6, 'McKellen', 'Ian', 'H', '1939-05-25'),
	(7, 'Tyler', 'Liv', 'F', '1977-07-01'),
	(8, 'Freeman', 'Martin', 'H', '1971-09-08'),
	(9, 'Bale', 'Christian', 'H', '1974-01-30'),
	(10, 'Ledger', 'Heath', 'H', '1979-04-04'),
	(11, 'Affleck', 'Ben', 'H', '1972-08-15'),
	(12, 'Cavill', 'Henry', 'H', '1983-05-05'),
	(13, 'Costner', 'Kevin', 'H', '1955-01-18'),
	(14, 'Holm', 'Ian', 'H', '1931-09-12'),
	(15, 'Cronenberg', 'David', 'H', '1943-03-15'),
	(16, 'Cameron', 'James', 'H', '1954-08-16');
/*!40000 ALTER TABLE `personne` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. realisateur
CREATE TABLE IF NOT EXISTS `realisateur` (
  `id_realisateur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int DEFAULT NULL,
  PRIMARY KEY (`id_realisateur`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `FK_realisateur_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema_anthony.realisateur : ~6 rows (environ)
/*!40000 ALTER TABLE `realisateur` DISABLE KEYS */;
INSERT INTO `realisateur` (`id_realisateur`, `id_personne`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 13),
	(5, 15),
	(6, 16);
/*!40000 ALTER TABLE `realisateur` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `nom_role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema_anthony.role : ~10 rows (environ)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id_role`, `nom_role`) VALUES
	(1, 'Batman'),
	(2, 'Aragorn'),
	(3, 'Legolas'),
	(4, 'Joker'),
	(5, 'Gandalf'),
	(6, 'Bilbon'),
	(7, 'John Dunbar'),
	(8, 'Superman'),
	(9, 'Jonathan Kent'),
	(10, 'Arwen');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
