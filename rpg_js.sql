-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 03 déc. 2020 à 19:45
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
  `type` enum('arme','armure','chaussures','chapeau','pantalon') DEFAULT NULL,
  `rarete` int(11) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `type_equipement` enum('arme','chapeau','veste','chaussures') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `equipement`
--

INSERT INTO `equipement` (`id_equipement`, `nom`, `pV`, `pM`, `pA`, `esquive`, `defMagique`, `defPhysique`, `vitesse`, `type`, `rarete`, `prix`, `type_equipement`) VALUES
(1, 'Potion_test', 10, 10, 10, 10, 10, 10, 10, '', 1, 10, 'arme');

-- --------------------------------------------------------

--
-- Structure de la table `monstre`
--

CREATE TABLE `monstre` (
  `id_monstre` int(3) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `monstre`
--

INSERT INTO `monstre` (`id_monstre`, `nom`, `image`) VALUES
(1, 'Clément', NULL);

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
(42, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(43, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(44, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(45, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(46, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(47, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(48, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(49, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(50, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(51, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(52, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(53, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(54, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(55, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(56, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(57, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(58, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(59, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(60, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(61, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(62, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(63, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(64, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(65, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(66, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(67, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(68, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(69, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(70, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(71, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(72, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(73, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(74, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(75, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(76, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(77, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(78, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(79, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(80, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(81, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(82, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(83, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(84, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(85, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(86, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(87, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(88, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(89, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(90, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(91, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(92, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(93, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(94, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(95, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(96, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(97, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(98, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(99, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(100, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(101, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(102, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(103, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(104, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(105, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(106, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(107, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(108, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(109, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(110, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(111, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(112, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(113, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(114, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(115, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(116, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(117, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(118, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1);

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
  MODIFY `id_monstre` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `personnage`
--
ALTER TABLE `personnage`
  MODIFY `id_personnage` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
