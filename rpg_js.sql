-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 27 nov. 2020 à 11:13
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `rpg_js`
--

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

CREATE TABLE `equipement` (
  `id_equipement` int(3) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `pV` int(11) DEFAULT NULL,
  `pM` int(11) DEFAULT NULL,
  `pA` int(11) DEFAULT NULL,
  `esquive` int(11) DEFAULT NULL,
  `defMagique` int(11) DEFAULT NULL,
  `defPhysique` int(11) DEFAULT NULL,
  `vitesse` int(11) DEFAULT NULL,
  `type` enum('arme','armure','potion','chapeau','pantalon') DEFAULT NULL,
  `id_personnage` int(11) DEFAULT NULL,
  `rarete` int(11) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `equipement`
--

INSERT INTO `equipement` (`id_equipement`, `nom`, `pV`, `pM`, `pA`, `esquive`, `defMagique`, `defPhysique`, `vitesse`, `type`, `id_personnage`, `rarete`, `prix`) VALUES
(1, 'Potion_test', 10, 10, 10, 10, 10, 10, 10, 'potion', 1, 1, 10);

-- --------------------------------------------------------

--
-- Structure de la table `monstre`
--

CREATE TABLE `monstre` (
  `id_monstre` int(3) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `pV` int(11) DEFAULT NULL,
  `pM` int(11) DEFAULT NULL,
  `pA` int(11) DEFAULT NULL,
  `esquive` int(11) DEFAULT NULL,
  `defMagique` int(11) DEFAULT NULL,
  `defPhysique` int(11) DEFAULT NULL,
  `vitesse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `personnage`
--

CREATE TABLE `personnage` (
  `id_personnage` int(3) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `pV` int(11) DEFAULT NULL,
  `pM` int(11) DEFAULT NULL,
  `pA` int(11) DEFAULT NULL,
  `pO` int(11) DEFAULT NULL,
  `class` enum('crs','clown tueur','militant antifa') DEFAULT NULL,
  `esquive` int(11) DEFAULT NULL,
  `defMagique` int(11) DEFAULT NULL,
  `defPhysique` int(11) DEFAULT NULL,
  `vitesse` int(11) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `personnage`
--

INSERT INTO `personnage` (`id_personnage`, `nom`, `pV`, `pM`, `pA`, `pO`, `class`, `esquive`, `defMagique`, `defPhysique`, `vitesse`, `image`) VALUES
(1, 'Monperso', 10, 10, 10, 10, 'crs', 10, 10, 10, 10, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD PRIMARY KEY (`id_equipement`),
  ADD KEY `id_personnage` (`id_personnage`);

--
-- Index pour la table `monstre`
--
ALTER TABLE `monstre`
  ADD PRIMARY KEY (`id_monstre`);

--
-- Index pour la table `personnage`
--
ALTER TABLE `personnage`
  ADD PRIMARY KEY (`id_personnage`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `equipement`
--
ALTER TABLE `equipement`
  MODIFY `id_equipement` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `monstre`
--
ALTER TABLE `monstre`
  MODIFY `id_monstre` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personnage`
--
ALTER TABLE `personnage`
  MODIFY `id_personnage` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD CONSTRAINT `equipement_ibfk_1` FOREIGN KEY (`id_personnage`) REFERENCES `personnage` (`id_personnage`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
