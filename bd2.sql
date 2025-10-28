-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 20 fév. 2025 à 09:54
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bd2`
--

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `numPermis` varchar(8) NOT NULL,
  `idmodele` int(11) NOT NULL,
  `dateTest` datetime NOT NULL,
  `securite` int(11) NOT NULL,
  `conduite` int(11) NOT NULL,
  `confort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `modelevoiture`
--

CREATE TABLE `modelevoiture` (
  `idModele` int(11) NOT NULL,
  `libelle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `modelevoiture`
--

INSERT INTO `modelevoiture` (`idModele`, `libelle`) VALUES
(15, 'WALLYS IRIS'),
(26, 'WALLYS 619'),
(38, 'WALLYS 216');

-- --------------------------------------------------------

--
-- Structure de la table `testeur`
--

CREATE TABLE `testeur` (
  `numPermis` varchar(8) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `genre` char(1) NOT NULL,
  `idville` int(11) NOT NULL
) ;

--
-- Déchargement des données de la table `testeur`
--

INSERT INTO `testeur` (`numPermis`, `nom`, `prenom`, `genre`, `idville`) VALUES
('21/12345', 'Brini', 'Samir', 'M', 4),
('33/44444', 'Zaghdane', 'Olfa', 'F', 2),
('58/98765', 'Krimi', 'Fethi', 'M', 1);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `idville` int(11) NOT NULL,
  `libville` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`numPermis`,`idmodele`),
  ADD KEY `idmodele` (`idmodele`);

--
-- Index pour la table `modelevoiture`
--
ALTER TABLE `modelevoiture`
  ADD PRIMARY KEY (`idModele`);

--
-- Index pour la table `testeur`
--
ALTER TABLE `testeur`
  ADD PRIMARY KEY (`numPermis`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`idville`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `idville` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`numPermis`) REFERENCES `testeur` (`numPermis`),
  ADD CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`idmodele`) REFERENCES `modelevoiture` (`idModele`),
  ADD CONSTRAINT `evaluation_ibfk_3` FOREIGN KEY (`idmodele`) REFERENCES `modelevoiture` (`idModele`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
