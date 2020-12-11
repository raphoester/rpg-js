-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 11 déc. 2020 à 23:47
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
  `rarete` int(11) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `type_equipement` enum('arme','futal','chapeau','veste','chaussures') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `equipement`
--

INSERT INTO `equipement` (`id_equipement`, `nom`, `pV`, `pM`, `pA`, `esquive`, `defMagique`, `defPhysique`, `vitesse`, `rarete`, `prix`, `type_equipement`) VALUES
(1, 'Potion_test', 10, 10, 10, 10, 10, 10, 10, 1, 10, 'arme'),
(2, 'epee basique', 0, 20, 15, 2, 0, 0, 15, 3, 7, 'arme'),
(3, 'armure en fer', 100, 10, 10, 0, 20, 50, 10, 4, 9, 'veste'),
(4, 'pantalon en cuir', 20, 10, 0, 0, 10, 30, 20, 1, 3, 'futal'),
(5, 'kippa', 10, 10, 10, 10, 10, 10, 10, 10, 7, 'chapeau'),
(6, 'crocs', 5, 5, 5, 5, 5, 5, 5, 5, 3, 'chaussures');

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
(243, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(244, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(245, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(246, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(247, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(248, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(249, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(250, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(251, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(252, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(253, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(254, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(255, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(256, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(257, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(258, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(259, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(260, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(261, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(262, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(263, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(264, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(265, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(266, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(267, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(268, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(269, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(270, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(271, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(272, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(273, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(274, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(275, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(276, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(277, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(278, 'Jean Charles', 500, 10, 30, -40, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(279, 'Jean Charles', 500, 10, 30, 0, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(280, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(281, 'Jean Charles', 200, 60, 60, -30, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(282, 'Jean Charles', 500, 10, 30, 0, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(283, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(284, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(285, 'Jean Charles', 500, 10, 30, -20, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(286, 'Jean Charles', 500, 10, 30, -170, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(287, 'Jean Charles', 500, 10, 30, 0, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(288, 'Jean Charles', 500, 10, 30, -30, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(289, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(290, 'Jean Charles', 500, 10, 30, -30, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(291, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(292, 'Jean Charles', 500, 10, 30, -50, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(293, 'Jean Charles', 500, 10, 30, -70, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(294, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(295, 'Jean Charles', 200, 60, 60, -50, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(296, 'Jean Charles', 200, 60, 60, -30, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(297, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(298, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(299, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(300, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(301, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(302, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(303, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(304, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(305, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(306, 'Jean Charles', 200, 60, 60, -10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(307, 'Jean Charles', 200, 60, 60, -40, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(308, 'Jean Charles', 200, 60, 60, -60, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(309, 'Jean Charles', 200, 60, 60, -40, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(310, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(311, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(312, 'Jean Charles', 200, 60, 60, -70, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(313, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(314, 'Jean Charles', 200, 60, 60, -70, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(315, 'Jean Charles', 200, 60, 60, -50, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(316, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(317, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(318, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(319, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(320, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(321, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(322, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(323, 'Jean Charles', 500, 10, 30, -230, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(324, 'Jean Charles', 500, 10, 30, -40, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(325, 'Jean Charles', 500, 10, 30, 0, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(326, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(327, 'Jean Charles', 200, 60, 60, -10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(328, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(329, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(330, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(331, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(332, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(333, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(334, 'Jean Charles', 200, 60, 60, -10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(335, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(336, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(337, 'Jean Charles', 200, 60, 60, -180, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(338, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(339, 'Jean Charles', 200, 60, 60, -10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(340, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(341, 'Jean Charles', 200, 60, 60, -20, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(342, 'Jean Charles', 200, 60, 60, -10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(343, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(344, 'Jean Charles', 200, 60, 60, -10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(345, 'Jean Charles', 200, 60, 60, 0, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(346, 'Jean Charles', 200, 60, 60, -80, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(347, 'Jean Charles', 500, 10, 30, 0, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(348, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(349, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(350, 'Jean Charles', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(351, 'Jean Charles', 500, 10, 30, -10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(352, 'Jean Charles', 500, 10, 30, -13, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1),
(353, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(354, 'Jean Charles', 200, 60, 60, 3, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1),
(355, 'Jean Charles', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1);

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
  MODIFY `id_equipement` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `monstre`
--
ALTER TABLE `monstre`
  MODIFY `id_monstre` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `personnage`
--
ALTER TABLE `personnage`
  MODIFY `id_personnage` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
