-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 09 déc. 2020 à 18:42
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
(1, 'Clément', 'img/clement.png'),
(2, 'xavier dupont de ligonnès', 'img/xavier_dupont.jpg'),
(3, 'Marcia', 'img/marcia.jpg'),
(4, 'Thanos', 'img/thanos.jpg'),
(5, 'Ben Laden', 'img/ben_laden.jpg');

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
(182, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(183, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(184, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(185, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(186, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(187, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(188, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(189, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(190, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(191, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(192, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(193, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(194, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, '../img/crs.jpg', 1),
(195, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, '../img/kebabier.jpg', 1),
(196, 'Jean Charles', 100, 20, 100, 10, 'gilet jaune de combat', 50, 5, 15, 60, 'img/gilet_jaune.jpg', 1),
(197, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(198, 'Jean Charles', 100, 20, 100, 10, 'gilet jaune de combat', 50, 5, 15, 60, 'img/gilet_jaune.jpg', 1),
(199, 'Jean Charles', 100, 20, 100, 10, 'gilet jaune de combat', 50, 5, 15, 60, 'img/gilet_jaune.jpg', 1),
(200, 'Jean Charles', 100, 20, 100, 10, 'gilet jaune de combat', 50, 5, 15, 60, 'img/gilet_jaune.jpg', 1),
(201, 'Jean Charles', 100, 20, 100, 10, 'gilet jaune de combat', 50, 5, 15, 60, 'img/gilet_jaune.jpg', 1),
(202, 'Jean Charles', 100, 20, 100, 10, 'gilet jaune de combat', 50, 5, 15, 60, 'img/gilet_jaune.jpg', 1),
(203, 'Jean Charles', 100, 20, 100, 10, 'gilet jaune de combat', 50, 5, 15, 60, 'img/gilet_jaune.jpg', 1),
(204, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(205, 'Jean Charles', 70, 120, 10, 10, 'militant antifa', 70, 10, 5, 90, 'img/militant.jpg', 1),
(206, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(207, 'Le roi des juifs', 100, 20, 100, 10, 'gilet jaune de combat', 50, 5, 15, 60, 'img/gilet_jaune.jpg', 1),
(208, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(209, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(210, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(211, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(212, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(213, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(214, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(215, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(216, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(217, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(218, 'Le roi des juifs', 100, 20, 100, 10, 'gilet jaune de combat', 50, 5, 15, 60, 'img/gilet_jaune.jpg', 1),
(219, 'Le roi des juifs', 70, 120, 10, 10, 'militant antifa', 70, 10, 5, 90, 'img/militant.jpg', 1),
(220, 'Le roi des juifs', 70, 120, 10, 10, 'militant antifa', 70, 10, 5, 90, 'img/militant.jpg', 1),
(221, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(222, 'Le roi des juifs', 70, 120, 10, 10, 'militant antifa', 70, 10, 5, 90, 'img/militant.jpg', 1),
(223, 'Le roi des juifs', 70, 120, 10, 10, 'militant antifa', 70, 10, 5, 90, 'img/militant.jpg', 1),
(224, 'Le roi des juifs', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(225, 'Le roi des juifs', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(226, 'Le roi des juifs', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(227, 'Le roi des juifs', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(228, 'Le roi des juifs', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(229, 'Le roi des juifs', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(230, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(231, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(232, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(233, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(234, 'Le roi des juifs', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(235, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(236, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(237, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(238, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(239, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(240, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(241, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(242, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(243, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1);

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
  MODIFY `id_monstre` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `personnage`
--
ALTER TABLE `personnage`
  MODIFY `id_personnage` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
