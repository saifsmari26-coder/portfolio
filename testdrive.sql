-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Mar 06 Décembre 2022 à 08:59
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `testdrive`
--

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE IF NOT EXISTS `evaluation` (
  `numPermis` varchar(8) NOT NULL,
  `idmodele` int(11) NOT NULL,
  `dateTest` datetime NOT NULL,
  `securite` int(11) NOT NULL,
  `conduite` int(11) NOT NULL,
  `confort` int(11) NOT NULL,
  PRIMARY KEY (`numPermis`,`idmodele`),
  KEY `idmodele` (`idmodele`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `modelevoiture`
--

CREATE TABLE IF NOT EXISTS `modelevoiture` (
  `idModele` int(11) NOT NULL,
  `libelle` varchar(20) NOT NULL,
  PRIMARY KEY (`idModele`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `modelevoiture`
--

INSERT INTO `modelevoiture` (`idModele`, `libelle`) VALUES
(15, 'WALLYS IRIS'),
(26, 'WALLYS 619'),
(38, 'WALLYS 216');

-- --------------------------------------------------------

--
-- Structure de la table `testeur`
--

CREATE TABLE IF NOT EXISTS `testeur` (
  `numPermis` varchar(8) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `genre` char(1) NOT NULL,
  `idville` int(11) NOT NULL,
  PRIMARY KEY (`numPermis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `testeur`
--

INSERT INTO `testeur` (`numPermis`, `nom`, `prenom`, `genre`, `idville`) VALUES
('21/12345', 'Brini', 'Samir', 'M', 4),
('33/44444', 'Zaghdane', 'Olfa', 'F', 2),
('58/98765', 'Krimi', 'Fethi', 'M', 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_3` FOREIGN KEY (`idmodele`) REFERENCES `modelevoiture` (`idModele`),
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`numPermis`) REFERENCES `testeur` (`numPermis`),
  ADD CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`idmodele`) REFERENCES `modelevoiture` (`idModele`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
