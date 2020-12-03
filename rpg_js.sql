-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 03 déc. 2020 à 12:09
-- Version du serveur :  10.4.16-MariaDB
-- Version de PHP : 7.4.12

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
  `rarete` int(11) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `type_equipement` enum('arme','chapeau','veste','chaussures') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `equipement`
--

INSERT INTO `equipement` (`id_equipement`, `nom`, `pV`, `pM`, `pA`, `esquive`, `defMagique`, `defPhysique`, `vitesse`, `type`, `rarete`, `prix`, `type_equipement`) VALUES
(1, 'Potion_test', 10, 10, 10, 10, 10, 10, 10, 'potion', 1, 10, 'arme');

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
  `classe` set('crs','gilet jaune de combat','militant antifa','chef kebabier') DEFAULT NULL,
  `esquive` int(11) DEFAULT NULL,
  `defMagique` int(11) DEFAULT NULL,
  `defPhysique` int(11) DEFAULT NULL,
  `vitesse` int(11) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `niveau` int(11) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `personnage`
--

INSERT INTO `personnage` (`id_personnage`, `nom`, `pV`, `pM`, `pA`, `pO`, `classe`, `esquive`, `defMagique`, `defPhysique`, `vitesse`, `image`, `niveau`) VALUES
(30, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(31, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(32, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(33, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(34, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(35, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(36, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(37, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(38, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(39, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(40, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(41, 'Jean Charles', 70, 120, 10, 10, 'militant antifa', 70, 10, 5, 90, '../img/militant.jpg', 1),
(42, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD PRIMARY KEY (`id_equipement`);

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
  MODIFY `id_personnage` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
