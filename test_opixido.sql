-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : sam. 12 mars 2022 à 21:25
-- Version du serveur :  5.7.24
-- Version de PHP : 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `test_opixido`
--

-- --------------------------------------------------------

--
-- Structure de la table `lesfilms`
--

CREATE TABLE `lesfilms` (
  `filmId` int(11) NOT NULL,
  `titre` varchar(1024) NOT NULL,
  `annee` int(11) NOT NULL,
  `description` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lesfilms`
--

INSERT INTO `lesfilms` (`filmId`, `titre`, `annee`, `description`) VALUES
(1, 'INVINCIBLE', 2015, 'L\'incroyable destin du coureur olympique et héros de la Seconde Guerre mondiale Louis \"Louie\" Zamperini dont l\'avion s\'est écrasé en mer en 1942, tuant huit membres de l\'équipage et laissant les trois rescapés sur un canot de sauvetage où deux d\'entre eux survécurent 47 jours durant, avant d\'être capturés par la marine japonaise et envoyés dans un camp de prisonniers de guerre.'),
(2, 'INVINCIBLE 2', 2017, 'L\'incroyable destin du coureur olympique et héros de la Seconde Guerre mondiale Louis \"Louie\" Zamperini dont l\'avion s\'est écrasé en mer en 1942, tuant huit membres de l\'équipage et laissant les trois rescapés sur un canot de sauvetage où deux d\'entre eux survécurent 47 jours durant, avant d\'être capturés par la marine japonaise et envoyés dans un camp de prisonniers de guerre.'),
(3, 'INVINCIBLE 3', 2019, 'L\'incroyable destin du coureur olympique et héros de la Seconde Guerre mondiale Louis \"Louie\" Zamperini dont l\'avion s\'est écrasé en mer en 1942, tuant huit membres de l\'équipage et laissant les trois rescapés sur un canot de sauvetage où deux d\'entre eux survécurent 47 jours durant, avant d\'être capturés par la marine japonaise et envoyés dans un camp de prisonniers de guerre.'),
(4, 'LA BATAILLE D\'ALGER', 1966, 'Le film retrace principalement l\'histoire d\'Ali la Pointe lors de « la bataille d\'Alger », et de la lutte pour le contrôle du quartier de la Casbah à Alger, entre les militants du FLN et les parachutistes français de la 10e DP, pendant la guerre d\'Algérie.');

-- --------------------------------------------------------

--
-- Structure de la table `lespersonnes`
--

CREATE TABLE `lespersonnes` (
  `personneId` int(11) NOT NULL,
  `nom` varchar(256) NOT NULL,
  `prenom` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lespersonnes`
--

INSERT INTO `lespersonnes` (`personneId`, `nom`, `prenom`) VALUES
(1, 'Jolie', 'Angelina'),
(2, 'Nicholson', 'William'),
(3, 'O\'Connell', 'Jack'),
(4, 'Haggiag', 'Brahim'),
(5, 'Pontecorvo', 'Gillo'),
(6, 'Solinas', 'Franco'),
(7, 'Saâdi', 'Yacef');

-- --------------------------------------------------------

--
-- Structure de la table `lesroles`
--

CREATE TABLE `lesroles` (
  `filmId` int(11) NOT NULL,
  `personneId` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lesroles`
--

INSERT INTO `lesroles` (`filmId`, `personneId`, `role`) VALUES
(1, 1, 'Réalisation'),
(1, 2, 'Scénario'),
(1, 3, 'Acteur principal'),
(4, 4, 'Acteur principal'),
(4, 5, 'Réalisation'),
(4, 6, 'Scénario'),
(4, 7, 'Acteur principal'),
(4, 7, 'Scénario');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `lesfilms`
--
ALTER TABLE `lesfilms`
  ADD PRIMARY KEY (`filmId`);

--
-- Index pour la table `lespersonnes`
--
ALTER TABLE `lespersonnes`
  ADD PRIMARY KEY (`personneId`);

--
-- Index pour la table `lesroles`
--
ALTER TABLE `lesroles`
  ADD PRIMARY KEY (`filmId`,`personneId`,`role`),
  ADD KEY `personneID_constraint` (`personneId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `lesfilms`
--
ALTER TABLE `lesfilms`
  MODIFY `filmId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `lespersonnes`
--
ALTER TABLE `lespersonnes`
  MODIFY `personneId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `lesroles`
--
ALTER TABLE `lesroles`
  ADD CONSTRAINT `filmID_constraint` FOREIGN KEY (`filmId`) REFERENCES `lesfilms` (`filmId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personneID_constraint` FOREIGN KEY (`personneId`) REFERENCES `lespersonnes` (`personneId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
