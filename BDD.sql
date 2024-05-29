-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 04 avr. 2024 à 22:22
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdd_web`
--

-- --------------------------------------------------------

--
-- Structure de la table `centreformation`
--

DROP TABLE IF EXISTS `centreformation`;
CREATE TABLE IF NOT EXISTS `centreformation` (
  `id_centre` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_centre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `centreformation`
--

INSERT INTO `centreformation` (`id_centre`, `Nom`) VALUES
(1, 'NANCY'),
(2, 'Paris'),
(3, 'Lyon');

-- --------------------------------------------------------

--
-- Structure de la table `compétence`
--

DROP TABLE IF EXISTS `compétence`;
CREATE TABLE IF NOT EXISTS `compétence` (
  `id_competence` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_competence`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `compétence`
--

INSERT INTO `compétence` (`id_competence`, `Nom`) VALUES
(1, 'informatique'),
(2, 'mathématiques'),
(3, 'communication'),
(4, 'leadership');

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE IF NOT EXISTS `entreprise` (
  `NumSIRET` bigint NOT NULL,
  `Nom` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` text COLLATE utf8mb4_general_ci,
  `NbInterne` int DEFAULT NULL,
  PRIMARY KEY (`NumSIRET`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`NumSIRET`, `Nom`, `Description`, `NbInterne`) VALUES
(2147483647, 'Atos', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 210012),
(47976684200724, 'Capgemini', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 340004),
(47976684200725, 'Thales', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 156489);

-- --------------------------------------------------------

--
-- Structure de la table `est_localisé`
--

DROP TABLE IF EXISTS `est_localisé`;
CREATE TABLE IF NOT EXISTS `est_localisé` (
  `id_localité` int NOT NULL,
  `NumSIRET` int NOT NULL,
  PRIMARY KEY (`id_localité`,`NumSIRET`),
  KEY `NumSIRET` (`NumSIRET`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `est_situé`
--

DROP TABLE IF EXISTS `est_situé`;
CREATE TABLE IF NOT EXISTS `est_situé` (
  `id_centre` int NOT NULL,
  `id_localité` int NOT NULL,
  PRIMARY KEY (`id_centre`,`id_localité`),
  KEY `id_localité` (`id_localité`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etudie`
--

DROP TABLE IF EXISTS `etudie`;
CREATE TABLE IF NOT EXISTS `etudie` (
  `id_etudiant` int NOT NULL,
  `id_centre` int NOT NULL,
  PRIMARY KEY (`id_etudiant`,`id_centre`),
  KEY `id_centre` (`id_centre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `id_etudiant` int NOT NULL,
  `NumSIRET` int NOT NULL,
  `Note` int DEFAULT NULL,
  `Commentaire` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_etudiant`,`NumSIRET`),
  KEY `NumSIRET` (`NumSIRET`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fait_partie`
--

DROP TABLE IF EXISTS `fait_partie`;
CREATE TABLE IF NOT EXISTS `fait_partie` (
  `NumSIRET` int NOT NULL,
  `id_secteur` int NOT NULL,
  PRIMARY KEY (`NumSIRET`,`id_secteur`),
  KEY `id_secteur` (`id_secteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `localité`
--

DROP TABLE IF EXISTS `localité`;
CREATE TABLE IF NOT EXISTS `localité` (
  `id_localité` int NOT NULL AUTO_INCREMENT,
  `NomPays` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NomVille` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CodePostal` int DEFAULT NULL,
  `Adresse` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_localité`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `localité`
--

INSERT INTO `localité` (`id_localité`, `NomPays`, `NomVille`, `CodePostal`, `Adresse`) VALUES
(1, 'France', 'Lyon', 69000, '65 Rue de la République'),
(2, 'France', 'Grenoble', 38000, '70 Rue de la République'),
(3, 'France', 'Marseille', 13000, '65 rue albert');

-- --------------------------------------------------------

--
-- Structure de la table `necessite`
--

DROP TABLE IF EXISTS `necessite`;
CREATE TABLE IF NOT EXISTS `necessite` (
  `id_competence` int NOT NULL,
  `id_stage` int NOT NULL,
  PRIMARY KEY (`id_competence`,`id_stage`),
  KEY `id_stage` (`id_stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `necessite`
--

INSERT INTO `necessite` (`id_competence`, `id_stage`) VALUES
(1, 1),
(2, 1),
(1, 2),
(3, 5),
(4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `offre`
--

DROP TABLE IF EXISTS `offre`;
CREATE TABLE IF NOT EXISTS `offre` (
  `id_stage` int NOT NULL,
  `NumSIRET` int NOT NULL,
  PRIMARY KEY (`id_stage`,`NumSIRET`),
  KEY `NumSIRET` (`NumSIRET`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `offre_de_stage`
--

DROP TABLE IF EXISTS `offre_de_stage`;
CREATE TABLE IF NOT EXISTS `offre_de_stage` (
  `id_stage` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Durée` double DEFAULT NULL,
  `Rémuneration` double DEFAULT NULL,
  `DatePublication` date DEFAULT NULL,
  `NbPlaces` int DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `DateDebut` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL,
  `NumSIRET` bigint DEFAULT NULL,
  `id_localite` int DEFAULT NULL,
  PRIMARY KEY (`id_stage`),
  KEY `fk_localite` (`id_localite`),
  KEY `fk_siret489` (`NumSIRET`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `offre_de_stage`
--

INSERT INTO `offre_de_stage` (`id_stage`, `Nom`, `Durée`, `Rémuneration`, `DatePublication`, `NbPlaces`, `Description`, `DateDebut`, `DateFin`, `NumSIRET`, `id_localite`) VALUES
(1, 'Test', 6, 3500, '2024-04-03', 2, 'blabla', '2024-04-05', '2024-08-24', 47976684200724, 3),
(2, 'développeur web', 3, 2500, '2024-04-02', 2, 'Quam ob rem cave Catoni anteponas ne istum quidem ipsum, quem Apollo, ut ais, sapientissimum iudicavit; huius enim facta, illius dicta laudantur. De me autem, ut iam cum utroque vestrum loquar, sic habetote.', '2024-04-29', '2024-07-31', 2147483647, 2),
(3, 'comptable', 4, 3000, '2024-04-02', 1, 'Quam ob rem cave Catoni anteponas ne istum quidem ipsum, quem Apollo, ut ais, sapientissimum iudicavit; huius enim facta, illius dicta laudantur. De me autem, ut iam cum utroque vestrum loquar, sic habetote.', '2024-04-25', '2024-08-28', 47976684200724, 2),
(5, 'data scientist', 3, 4590, '2024-04-04', 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2024-04-04', '2024-08-03', 47976684200725, 1),
(11, 'Offre 1', 8, 4442, '2021-05-16', 8, 'Description of Offre 1', '2023-04-25', '2023-12-25', 47976684200725, 3),
(12, 'Offre 2', 5, 1269, '2021-01-01', 5, 'Description of Offre 2', '2023-09-18', '2024-02-18', 47976684200724, 3),
(13, 'Offre 3', 9, 1617, '2022-02-26', 2, 'Description of Offre 3', '2024-01-01', '2024-10-01', 2147483647, 1),
(14, 'Offre 4', 11, 2070, '2022-02-10', 8, 'Description of Offre 4', '2023-12-10', '2024-11-10', 2147483647, 2),
(15, 'Offre 5', 6, 3018, '2020-04-27', 1, 'Description of Offre 5', '2024-07-30', '2025-01-30', 47976684200725, 1),
(16, 'Offre 6', 7, 2967, '2022-09-21', 1, 'Description of Offre 6', '2024-03-05', '2024-10-05', 47976684200725, 1),
(17, 'Offre 7', 10, 1103, '2022-01-19', 4, 'Description of Offre 7', '2024-04-19', '2025-02-19', 2147483647, 1),
(18, 'Offre 8', 4, 4408, '2021-03-12', 5, 'Description of Offre 8', '2024-12-17', '2025-04-17', 47976684200724, 1),
(19, 'Offre 9', 7, 2607, '2021-05-10', 1, 'Description of Offre 9', '2024-10-24', '2025-05-24', 47976684200724, 1),
(20, 'Offre 10', 9, 1807, '2022-04-22', 3, 'Description of Offre 10', '2024-10-06', '2025-07-06', 47976684200725, 3),
(21, 'Offre 11', 3, 2741, '2021-09-09', 6, 'Description of Offre 11', '2024-09-20', '2024-12-20', 47976684200725, 1),
(22, 'Offre 12', 2, 4171, '2021-09-09', 5, 'Description of Offre 12', '2024-01-07', '2024-03-07', 2147483647, 2),
(23, 'Offre 13', 4, 4307, '2020-06-21', 4, 'Description of Offre 13', '2023-02-11', '2023-06-11', 47976684200724, 2),
(24, 'Offre 14', 3, 1422, '2022-08-11', 1, 'Description of Offre 14', '2024-02-08', '2024-05-08', 47976684200724, 3),
(25, 'Offre 15', 5, 3965, '2021-12-21', 1, 'Description of Offre 15', '2023-09-11', '2024-02-11', 47976684200724, 3),
(26, 'Offre 16', 10, 4581, '2020-04-25', 9, 'Description of Offre 16', '2024-10-12', '2025-08-12', 47976684200725, 3),
(27, 'Offre 17', 2, 4260, '2021-10-21', 6, 'Description of Offre 17', '2023-01-04', '2023-03-04', 47976684200724, 3),
(28, 'Offre 18', 6, 1332, '2020-05-13', 4, 'Description of Offre 18', '2023-11-12', '2024-05-12', 2147483647, 1),
(29, 'Offre 19', 5, 2633, '2022-12-09', 7, 'Description of Offre 19', '2023-11-03', '2024-04-03', 2147483647, 1),
(30, 'Offre 20', 7, 1743, '2021-01-04', 2, 'Description of Offre 20', '2024-04-05', '2024-11-05', 47976684200725, 3),
(31, 'Offre 21', 5, 1662, '2021-12-01', 7, 'Description of Offre 21', '2024-02-19', '2024-07-19', 47976684200725, 1),
(32, 'Offre 22', 1, 4496, '2021-01-21', 2, 'Description of Offre 22', '2024-04-15', '2024-05-15', 47976684200725, 1),
(33, 'Offre 23', 12, 3407, '2020-05-05', 8, 'Description of Offre 23', '2024-01-01', '2025-01-01', 2147483647, 2),
(34, 'Offre 24', 10, 3241, '2021-03-21', 4, 'Description of Offre 24', '2024-02-01', '2024-12-01', 47976684200724, 2),
(35, 'Offre 25', 4, 3538, '2020-08-13', 2, 'Description of Offre 25', '2023-01-12', '2023-05-12', 47976684200725, 2),
(36, 'Offre 26', 2, 2330, '2020-10-12', 4, 'Description of Offre 26', '2024-06-30', '2024-08-30', 47976684200725, 3),
(37, 'Offre 27', 11, 4663, '2022-07-23', 6, 'Description of Offre 27', '2023-01-10', '2023-12-10', 47976684200724, 2),
(38, 'Offre 28', 5, 4706, '2021-11-21', 4, 'Description of Offre 28', '2024-12-10', '2025-05-10', 47976684200725, 3),
(39, 'Offre 29', 9, 1346, '2021-02-17', 7, 'Description of Offre 29', '2024-12-24', '2025-09-24', 2147483647, 2),
(40, 'Offre 30', 11, 1722, '2020-09-06', 6, 'Description of Offre 30', '2023-08-06', '2024-07-06', 47976684200725, 2),
(41, 'Offre 31', 12, 4130, '2020-06-21', 5, 'Description of Offre 31', '2024-06-15', '2025-06-15', 2147483647, 2),
(42, 'Offre 32', 1, 1606, '2021-08-12', 3, 'Description of Offre 32', '2024-02-13', '2024-03-13', 2147483647, 3),
(43, 'Offre 33', 8, 4313, '2020-09-17', 8, 'Description of Offre 33', '2024-08-05', '2025-04-05', 47976684200725, 1),
(44, 'Offre 34', 6, 2048, '2022-09-25', 8, 'Description of Offre 34', '2023-03-26', '2023-09-26', 2147483647, 1),
(45, 'Offre 35', 3, 1098, '2021-07-04', 5, 'Description of Offre 35', '2024-05-10', '2024-08-10', 2147483647, 2),
(46, 'Offre 36', 8, 4382, '2021-05-21', 8, 'Description of Offre 36', '2023-12-19', '2024-08-19', 2147483647, 1),
(47, 'Offre 37', 10, 4532, '2020-03-11', 7, 'Description of Offre 37', '2023-05-05', '2024-03-05', 47976684200725, 2),
(48, 'Offre 38', 10, 4880, '2021-06-14', 6, 'Description of Offre 38', '2023-03-08', '2024-01-08', 47976684200725, 2),
(49, 'Offre 39', 2, 2517, '2021-10-05', 8, 'Description of Offre 39', '2023-06-21', '2023-08-21', 47976684200725, 1),
(50, 'Offre 40', 7, 1150, '2022-01-01', 3, 'Description of Offre 40', '2023-03-25', '2023-10-25', 47976684200725, 1),
(51, 'Offre 41', 2, 4953, '2021-12-28', 4, 'Description of Offre 41', '2024-07-18', '2024-09-18', 47976684200725, 3),
(52, 'Offre 42', 2, 3378, '2021-08-06', 9, 'Description of Offre 42', '2024-08-04', '2024-10-04', 47976684200724, 2),
(53, 'Offre 43', 9, 2822, '2020-07-12', 6, 'Description of Offre 43', '2023-02-06', '2023-11-06', 47976684200725, 2),
(54, 'Offre 44', 9, 2135, '2021-03-27', 3, 'Description of Offre 44', '2024-08-09', '2025-05-09', 47976684200724, 2),
(55, 'Offre 45', 7, 1688, '2020-07-08', 4, 'Description of Offre 45', '2023-06-04', '2024-01-04', 2147483647, 2),
(56, 'Offre 46', 4, 1114, '2020-11-02', 4, 'Description of Offre 46', '2024-06-06', '2024-10-06', 47976684200724, 1),
(57, 'Offre 47', 6, 1055, '2022-03-03', 6, 'Description of Offre 47', '2024-05-27', '2024-11-27', 47976684200725, 3),
(58, 'Offre 48', 9, 1956, '2022-12-08', 2, 'Description of Offre 48', '2024-11-17', '2025-08-17', 2147483647, 1),
(59, 'Offre 49', 10, 4701, '2020-06-01', 10, 'Description of Offre 49', '2023-05-13', '2024-03-13', 2147483647, 1),
(60, 'Offre 50', 6, 4694, '2020-05-19', 9, 'Description of Offre 50', '2024-11-19', '2025-05-19', 2147483647, 3),
(61, 'Offre 51', 7, 2560, '2020-12-01', 4, 'Description of Offre 51', '2024-10-13', '2025-05-13', 47976684200724, 1),
(62, 'Offre 52', 10, 3008, '2020-03-22', 9, 'Description of Offre 52', '2023-03-22', '2024-01-22', 47976684200725, 2),
(63, 'Offre 53', 4, 1256, '2021-07-22', 5, 'Description of Offre 53', '2023-11-29', '2024-03-29', 2147483647, 3),
(64, 'Offre 54', 8, 2564, '2022-11-28', 7, 'Description of Offre 54', '2023-12-08', '2024-08-08', 2147483647, 1),
(65, 'Offre 55', 11, 4710, '2022-12-15', 2, 'Description of Offre 55', '2024-06-26', '2025-05-26', 2147483647, 1),
(66, 'Offre 56', 6, 2238, '2020-11-12', 6, 'Description of Offre 56', '2024-06-04', '2024-12-04', 2147483647, 3),
(67, 'Offre 57', 9, 3327, '2022-07-26', 6, 'Description of Offre 57', '2023-03-03', '2023-12-03', 47976684200725, 3),
(68, 'Offre 58', 1, 2351, '2022-01-01', 4, 'Description of Offre 58', '2024-03-28', '2024-04-28', 2147483647, 3),
(69, 'Offre 59', 6, 4409, '2022-12-13', 4, 'Description of Offre 59', '2024-09-10', '2025-03-10', 2147483647, 1),
(70, 'Offre 60', 10, 1621, '2021-04-17', 7, 'Description of Offre 60', '2023-04-20', '2024-02-20', 47976684200725, 3),
(71, 'Offre 61', 11, 2015, '2022-04-06', 1, 'Description of Offre 61', '2024-07-28', '2025-06-28', 47976684200725, 1),
(72, 'Offre 62', 2, 4968, '2022-01-09', 4, 'Description of Offre 62', '2024-11-29', '2025-01-29', 47976684200724, 1),
(73, 'Offre 63', 10, 3014, '2020-08-23', 6, 'Description of Offre 63', '2023-05-11', '2024-03-11', 2147483647, 2),
(74, 'Offre 64', 10, 2392, '2021-06-13', 4, 'Description of Offre 64', '2023-10-21', '2024-08-21', 47976684200725, 1),
(75, 'Offre 65', 10, 4561, '2020-08-03', 4, 'Description of Offre 65', '2024-12-03', '2025-10-03', 47976684200725, 2),
(76, 'Offre 66', 12, 2265, '2021-12-09', 3, 'Description of Offre 66', '2023-12-10', '2024-12-10', 47976684200724, 1),
(77, 'Offre 67', 2, 2190, '2020-03-16', 5, 'Description of Offre 67', '2023-02-12', '2023-04-12', 47976684200725, 2),
(78, 'Offre 68', 8, 3536, '2020-12-19', 8, 'Description of Offre 68', '2024-03-05', '2024-11-05', 47976684200725, 1),
(79, 'Offre 69', 11, 4084, '2020-05-04', 3, 'Description of Offre 69', '2024-11-07', '2025-10-07', 47976684200725, 2),
(80, 'Offre 70', 4, 4479, '2021-02-04', 3, 'Description of Offre 70', '2024-12-26', '2025-04-26', 2147483647, 2),
(81, 'Offre 71', 12, 1714, '2022-10-18', 2, 'Description of Offre 71', '2024-09-01', '2025-09-01', 47976684200725, 2),
(82, 'Offre 72', 12, 3248, '2022-06-10', 4, 'Description of Offre 72', '2023-11-30', '2024-11-30', 2147483647, 2),
(83, 'Offre 73', 5, 3660, '2020-11-07', 5, 'Description of Offre 73', '2023-07-26', '2023-12-26', 2147483647, 3),
(84, 'Offre 74', 9, 1405, '2021-02-01', 6, 'Description of Offre 74', '2023-12-08', '2024-09-08', 47976684200725, 2),
(85, 'Offre 75', 9, 3422, '2022-11-01', 10, 'Description of Offre 75', '2024-05-27', '2025-02-27', 47976684200725, 3),
(86, 'Offre 76', 10, 3576, '2022-03-02', 7, 'Description of Offre 76', '2023-06-09', '2024-04-09', 2147483647, 2),
(87, 'Offre 77', 2, 3251, '2021-06-20', 8, 'Description of Offre 77', '2023-08-21', '2023-10-21', 2147483647, 2),
(88, 'Offre 78', 3, 2035, '2021-10-09', 2, 'Description of Offre 78', '2023-03-23', '2023-06-23', 2147483647, 3),
(89, 'Offre 79', 12, 2475, '2022-11-25', 8, 'Description of Offre 79', '2024-06-14', '2025-06-14', 47976684200724, 1),
(90, 'Offre 80', 3, 4071, '2020-06-24', 5, 'Description of Offre 80', '2024-12-27', '2025-03-27', 47976684200724, 2),
(91, 'Offre 81', 11, 4906, '2020-10-02', 4, 'Description of Offre 81', '2024-09-30', '2025-08-30', 47976684200724, 2),
(92, 'Offre 82', 8, 4847, '2022-12-14', 1, 'Description of Offre 82', '2023-06-18', '2024-02-18', 2147483647, 2),
(93, 'Offre 83', 6, 4248, '2021-11-28', 8, 'Description of Offre 83', '2024-08-20', '2025-02-20', 47976684200725, 3),
(94, 'Offre 84', 7, 2585, '2020-10-01', 1, 'Description of Offre 84', '2024-02-20', '2024-09-20', 47976684200724, 2),
(95, 'Offre 85', 11, 3816, '2022-08-13', 3, 'Description of Offre 85', '2024-03-30', '2025-02-28', 47976684200724, 3),
(96, 'Offre 86', 10, 1118, '2022-04-19', 8, 'Description of Offre 86', '2023-10-18', '2024-08-18', 47976684200725, 3),
(97, 'Offre 87', 1, 1996, '2020-03-29', 7, 'Description of Offre 87', '2023-01-25', '2023-02-25', 2147483647, 3),
(98, 'Offre 88', 12, 1796, '2020-01-20', 5, 'Description of Offre 88', '2023-10-22', '2024-10-22', 47976684200724, 2),
(99, 'Offre 89', 11, 4302, '2021-08-11', 3, 'Description of Offre 89', '2023-11-09', '2024-10-09', 47976684200724, 1),
(100, 'Offre 90', 12, 3842, '2022-05-26', 9, 'Description of Offre 90', '2024-11-19', '2025-11-19', 2147483647, 3),
(101, 'Offre 91', 3, 4751, '2020-03-02', 5, 'Description of Offre 91', '2023-04-25', '2023-07-25', 47976684200724, 2),
(102, 'Offre 92', 3, 3228, '2020-08-09', 4, 'Description of Offre 92', '2023-03-09', '2023-06-09', 47976684200724, 3),
(103, 'Offre 93', 4, 3973, '2022-06-03', 9, 'Description of Offre 93', '2024-03-10', '2024-07-10', 47976684200724, 1),
(104, 'Offre 94', 7, 3486, '2021-04-30', 4, 'Description of Offre 94', '2023-11-01', '2024-06-01', 2147483647, 3),
(105, 'Offre 95', 7, 4632, '2022-10-08', 9, 'Description of Offre 95', '2024-05-06', '2024-12-06', 47976684200725, 2),
(106, 'Offre 96', 5, 2629, '2022-09-08', 3, 'Description of Offre 96', '2024-03-07', '2024-08-07', 2147483647, 1),
(107, 'Offre 97', 4, 1289, '2021-03-11', 8, 'Description of Offre 97', '2024-04-16', '2024-08-16', 47976684200725, 3),
(108, 'Offre 98', 10, 3583, '2022-11-25', 9, 'Description of Offre 98', '2024-02-21', '2024-12-21', 2147483647, 1),
(109, 'Offre 99', 3, 4063, '2020-04-14', 2, 'Description of Offre 99', '2024-03-15', '2024-06-15', 47976684200724, 2),
(110, 'Offre 100', 6, 3762, '2022-12-16', 9, 'Description of Offre 100', '2023-09-03', '2024-03-03', 2147483647, 2);

-- --------------------------------------------------------

--
-- Structure de la table `possède`
--

DROP TABLE IF EXISTS `possède`;
CREATE TABLE IF NOT EXISTS `possède` (
  `id_etudiant` int NOT NULL,
  `id_competence` int NOT NULL,
  PRIMARY KEY (`id_etudiant`,`id_competence`),
  KEY `id_competence` (`id_competence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `postule`
--

DROP TABLE IF EXISTS `postule`;
CREATE TABLE IF NOT EXISTS `postule` (
  `id_etudiant` int NOT NULL,
  `id_stage` int NOT NULL,
  `CV` text COLLATE utf8mb4_general_ci,
  `LettreMotivation` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id_etudiant`,`id_stage`),
  KEY `id_stage` (`id_stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `promo_de_l_annee`
--

DROP TABLE IF EXISTS `promo_de_l_annee`;
CREATE TABLE IF NOT EXISTS `promo_de_l_annee` (
  `id_PromoAnnee` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DateDebut` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL,
  `Centre` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_centre` int NOT NULL,
  PRIMARY KEY (`id_PromoAnnee`),
  KEY `id_centre` (`id_centre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `promo_de_l_annee`
--

INSERT INTO `promo_de_l_annee` (`id_PromoAnnee`, `Nom`, `DateDebut`, `DateFin`, `Centre`, `id_centre`) VALUES
(1, 'A2 Info', '2023-09-01', '2024-07-01', 'NANCY', 1),
(2, 'L3 info', '2024-04-01', '2024-10-31', 'Paris', 2);

-- --------------------------------------------------------

--
-- Structure de la table `secteur_d_activité`
--

DROP TABLE IF EXISTS `secteur_d_activité`;
CREATE TABLE IF NOT EXISTS `secteur_d_activité` (
  `id_secteur` int NOT NULL,
  `Nom` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_secteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `se_déroule`
--

DROP TABLE IF EXISTS `se_déroule`;
CREATE TABLE IF NOT EXISTS `se_déroule` (
  `id_stage` int NOT NULL,
  `id_localité` int NOT NULL,
  PRIMARY KEY (`id_stage`,`id_localité`),
  KEY `id_localité` (`id_localité`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_applications`
--

DROP TABLE IF EXISTS `user_applications`;
CREATE TABLE IF NOT EXISTS `user_applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_etudiant` int DEFAULT NULL,
  `id_stage` int DEFAULT NULL,
  `applied_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cv_path` varchar(255) DEFAULT NULL,
  `lettre_motivation_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_offer_unique` (`id_etudiant`,`id_stage`),
  KEY `id_stage` (`id_stage`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_applications`
--

INSERT INTO `user_applications` (`id`, `id_etudiant`, `id_stage`, `applied_at`, `cv_path`, `lettre_motivation_path`) VALUES
(1, 2, 11, '2024-04-04 22:14:54', '../ressources_etudiants/user_2-offre_11/Framework_JEE_-_Diaporama_-_Introduction_au_cours.pdf', '../ressources_etudiants/user_2-offre_11/Framework_JEE_-_Trace_e_crite_-_Chapitre_1_-_Introduction_a_JEE.pdf'),
(2, 2, 5, '2024-04-04 22:21:04', '../ressources_etudiants/user_2-offre_5/Framework_JEE_-_Trace_e_crite_-_Chapitre_1_-_Introduction_a_JEE.pdf', '../ressources_etudiants/user_2-offre_5/Framework_JEE_-_Trace_e_crite_-_Chapitre_1_-_Introduction_a_JEE.pdf'),
(3, 2, 2, '2024-04-04 22:21:52', '../ressources_etudiants/user_2-offre_2/Framework_JEE_-_Diaporama_-_Introduction_au_cours.pdf', '../ressources_etudiants/user_2-offre_2/Framework_JEE_-_Diaporama_-_Introduction_au_cours.pdf');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id_etudiant` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Prenom` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Mot_de_passe` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_PromoAnnee` int NOT NULL,
  PRIMARY KEY (`id_etudiant`),
  KEY `id_PromoAnnee` (`id_PromoAnnee`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_etudiant`, `Nom`, `Prenom`, `Status`, `Email`, `Mot_de_passe`, `id_PromoAnnee`) VALUES
(1, 'toto', 'toto', 'etudiant', 'toto@gmail.com', '12345', 1),
(2, 'chaouche', 'ylies', 'etudiant', 'ylieschaouche@gmail.com', '12345', 2),
(4, 'admin', 'admin', 'admin', 'admin@gmail.com', 'admin', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `est_localisé`
--
ALTER TABLE `est_localisé`
  ADD CONSTRAINT `est_localisé_ibfk_1` FOREIGN KEY (`id_localité`) REFERENCES `localité` (`id_localité`);

--
-- Contraintes pour la table `est_situé`
--
ALTER TABLE `est_situé`
  ADD CONSTRAINT `est_situé_ibfk_1` FOREIGN KEY (`id_centre`) REFERENCES `centreformation` (`id_centre`),
  ADD CONSTRAINT `est_situé_ibfk_2` FOREIGN KEY (`id_localité`) REFERENCES `localité` (`id_localité`);

--
-- Contraintes pour la table `etudie`
--
ALTER TABLE `etudie`
  ADD CONSTRAINT `etudie_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `utilisateurs` (`id_etudiant`),
  ADD CONSTRAINT `etudie_ibfk_2` FOREIGN KEY (`id_centre`) REFERENCES `centreformation` (`id_centre`);

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `utilisateurs` (`id_etudiant`);

--
-- Contraintes pour la table `fait_partie`
--
ALTER TABLE `fait_partie`
  ADD CONSTRAINT `fait_partie_ibfk_2` FOREIGN KEY (`id_secteur`) REFERENCES `secteur_d_activité` (`id_secteur`);

--
-- Contraintes pour la table `necessite`
--
ALTER TABLE `necessite`
  ADD CONSTRAINT `fk_new` FOREIGN KEY (`id_stage`) REFERENCES `offre_de_stage` (`id_stage`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `necessite_ibfk_1` FOREIGN KEY (`id_competence`) REFERENCES `compétence` (`id_competence`);

--
-- Contraintes pour la table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `offre_ibfk_1` FOREIGN KEY (`id_stage`) REFERENCES `offre_de_stage` (`id_stage`);

--
-- Contraintes pour la table `offre_de_stage`
--
ALTER TABLE `offre_de_stage`
  ADD CONSTRAINT `fk_localite` FOREIGN KEY (`id_localite`) REFERENCES `localité` (`id_localité`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_siret489` FOREIGN KEY (`NumSIRET`) REFERENCES `entreprise` (`NumSIRET`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `possède`
--
ALTER TABLE `possède`
  ADD CONSTRAINT `possède_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `utilisateurs` (`id_etudiant`),
  ADD CONSTRAINT `possède_ibfk_2` FOREIGN KEY (`id_competence`) REFERENCES `compétence` (`id_competence`);

--
-- Contraintes pour la table `postule`
--
ALTER TABLE `postule`
  ADD CONSTRAINT `postule_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `utilisateurs` (`id_etudiant`),
  ADD CONSTRAINT `postule_ibfk_2` FOREIGN KEY (`id_stage`) REFERENCES `offre_de_stage` (`id_stage`);

--
-- Contraintes pour la table `promo_de_l_annee`
--
ALTER TABLE `promo_de_l_annee`
  ADD CONSTRAINT `promo_de_l_annee_ibfk_1` FOREIGN KEY (`id_centre`) REFERENCES `centreformation` (`id_centre`);

--
-- Contraintes pour la table `se_déroule`
--
ALTER TABLE `se_déroule`
  ADD CONSTRAINT `se_déroule_ibfk_1` FOREIGN KEY (`id_stage`) REFERENCES `offre_de_stage` (`id_stage`),
  ADD CONSTRAINT `se_déroule_ibfk_2` FOREIGN KEY (`id_localité`) REFERENCES `localité` (`id_localité`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`id_PromoAnnee`) REFERENCES `promo_de_l_annee` (`id_PromoAnnee`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;