-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 18 juil. 2018 à 18:51
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `elevage`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sexe` char(1) DEFAULT NULL,
  `date_naissance` datetime NOT NULL,
  `commentaire` char(50) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `espece_id` smallint(5) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_espece_animal` (`espece_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `animal`
--

INSERT INTO `animal` (`id`, `sexe`, `date_naissance`, `commentaire`, `nom`, `espece_id`) VALUES
(NULL, 'F', '2008-02-20 15:45:00', NULL, 'Canaille', 1),
(NULL, 'F', '2009-05-26 08:54:00', NULL, 'Cali', 1),
(NULL, 'F', '2007-04-24 12:54:00', NULL, 'Rouquine', 1),
(NULL, 'F', '2009-05-26 08:56:00', NULL, 'Fila', 1),
(NULL, 'F', '2008-02-20 15:47:00', NULL, 'Anya', 1),
(NULL, 'F', '2009-05-26 08:50:00', NULL, 'Louya', 1),
(NULL, 'F', '2008-03-10 13:45:00', NULL, 'Welva', 1),
(NULL, 'F', '2007-04-24 12:59:00', NULL, 'Zira', 1),
(NULL, 'F', '2009-05-26 09:02:00', NULL, 'Java', 1),
(NULL, 'M', '2007-04-24 12:45:00', NULL, 'Balou', 1),
(NULL, 'M', '2008-03-10 13:43:00', NULL, 'Pataud', 1),
(NULL, 'M', '2007-04-24 12:42:00', NULL, 'Bouli', 1),
(NULL, 'M', '2009-03-05 13:54:00', NULL, 'Zoulou', 1),
(NULL, 'M', '2007-04-12 05:23:00', NULL, 'Cartouche', 1),
(NULL, 'M', '2006-05-14 15:50:00', NULL, 'Zambo', 1),
(NULL, 'M', '2006-05-14 15:48:00', NULL, 'Samba', 1),
(NULL, 'M', '2008-03-10 13:40:00', NULL, 'Moka', 1),
(NULL, 'M', '2006-05-14 15:40:00', NULL, 'Pilou', 1),
(NULL, 'M', '2009-05-14 06:30:00', NULL, 'Fiero', 2),
(NULL, 'M', '2007-03-12 12:05:00', NULL, 'Zonko', 2),
(NULL, 'M', '2008-02-20 15:45:00', NULL, 'Filou', 2),
(NULL, 'M', '2007-03-12 12:07:00', NULL, 'Farceur', 2),
(NULL, 'M', '2006-05-19 16:17:00', NULL, 'Caribou', 2),
(NULL, 'M', '2008-04-20 03:22:00', NULL, 'Capou', 2),
(NULL, 'M', '2006-05-19 16:56:00', 'Pas de queue depuis la naissance', 'Raccou', 2),
(NULL, 'M', '2009-05-14 06:42:00', NULL, 'Boucan', 2),
(NULL, 'F', '2006-05-19 16:06:00', NULL, 'Callune', 2),
(NULL, 'F', '2009-05-14 06:45:00', NULL, 'Boule', 2),
(NULL, 'F', '2008-04-20 03:26:00', NULL, 'Zara', 2),
(NULL, 'F', '2007-03-12 12:00:00', NULL, 'Milla', 2),
(NULL, 'F', '2006-05-19 15:59:00', NULL, 'Feta', 2),
(NULL, 'F', '2008-04-20 03:20:00', 'Sourde de l\'oreille droite ?  80%', 'Bilba', 2),
(NULL, 'F', '2007-03-12 11:54:00', NULL, 'Cracotte', 2),
(NULL, 'F', '2006-05-19 16:16:00', NULL, 'Cawette', 2),
(NULL, 'F', '2007-04-01 18:17:00', NULL, 'Nikki', 3),
(NULL, 'F', '2009-03-24 08:23:00', NULL, 'Tortilla', 3),
(NULL, 'F', '2009-03-26 01:24:00', NULL, 'Scroupy', 3),
(NULL, 'F', '2006-03-15 14:56:00', NULL, 'Lulla', 3),
(NULL, 'F', '2008-03-15 12:02:00', NULL, 'Dana', 3),
(NULL, 'F', '2009-05-25 19:57:00', NULL, 'Cheli', 3),
(NULL, 'F', '2007-04-01 03:54:00', NULL, 'Chicaca', 3),
(NULL, 'F', '2006-03-15 14:26:00', 'Insomniaque', 'Redbul', 3),
(NULL, 'M', '2007-04-02 01:45:00', NULL, 'Spoutnik', 3),
(NULL, 'M', '2008-03-16 08:20:00', NULL, 'Bubulle', 3),
(NULL, 'M', '2008-03-15 18:45:00', 'Surpoids', 'Relou', 3),
(NULL, 'M', '2009-05-25 18:54:00', NULL, 'Bulbizard', 3),
(NULL, 'M', '2007-03-04 19:36:00', NULL, 'Safran', 4),
(NULL, 'M', '2008-02-20 02:50:00', NULL, 'Gingko', 4),
(NULL, 'M', '2009-03-26 08:28:00', NULL, 'Bavard', 4),
(NULL, 'F', '2009-03-26 07:55:00', NULL, 'Parlotte', 4);

-- --------------------------------------------------------

--
-- Structure de la table `espece`
--

DROP TABLE IF EXISTS `espece`;
CREATE TABLE IF NOT EXISTS `espece` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_courant` varchar(40) NOT NULL,
  `nom_latin` varchar(40) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom_latin` (`nom_latin`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `espece`
--

INSERT INTO `espece` (`id`, `nom_courant`, `nom_latin`, `description`) VALUES
(1, 'Chien', 'Canis canis', 'Bestiole à quatre pattes qui aime les caresses et tire souvent la langue'),
(2, 'Chat', 'Felis silvestris', 'Bestiole à quatre pattes qui saute très haut et grimpe aux arbres'),
(3, 'Tortue d\'Hermann', 'Testudo hermanni', 'Bestiole avec une carapace très dure'),
(4, 'Perroquet amazone', 'Alipiopsitta xanthops', 'Joli oiseau parleur vert et jaune');

-- --------------------------------------------------------

--
-- Structure de la table `test_tuto`
--

DROP TABLE IF EXISTS `test_tuto`;
CREATE TABLE IF NOT EXISTS `test_tuto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fk_espece_animal` FOREIGN KEY (`espece_id`) REFERENCES `espece` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
