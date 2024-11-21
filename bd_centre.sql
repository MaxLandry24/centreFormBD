-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 21 nov. 2024 à 12:19
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET
    time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `centre_formation`
--

-- --------------------------------------------------------

--
-- Structure de la table `catalogue`
--

CREATE TABLE `catalogue`
(
    `codeForm` varchar(8) NOT NULL,
    `codeSpec` varchar(8) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Déchargement des données de la table `catalogue`
--

INSERT INTO `catalogue` (`codeForm`, `codeSpec`)
VALUES ('11', '101'),
       ('12', '101'),
       ('13', '103'),
       ('13', '104'),
       ('14', '104'),
       ('15', '101'),
       ('15', '102'),
       ('16', '104');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant`
(
    `NumCNIEtu`     varchar(20) NOT NULL,
    `nomEtu`        varchar(30) DEFAULT NULL,
    `prenomEtu`     varchar(30) DEFAULT NULL,
    `dateNaissance` date        DEFAULT NULL,
    `adresseEtu`    varchar(50) DEFAULT NULL,
    `villeEtu`      varchar(30) DEFAULT NULL,
    `niveauEtu`     varchar(10) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`NumCNIEtu`, `nomEtu`, `prenomEtu`, `dateNaissance`, `adresseEtu`, `villeEtu`, `niveauEtu`)
VALUES ('AB234567', 'Alami', 'Ahmad', '1987-01-02', 'Rue du port, 13', 'Kenitra', 'bac'),
       ('C0987265', 'Souni', 'Sanaa', '1998-04-30', 'Place du peuple n 2', 'Tanger', 'Niveau bac'),
       ('D2356903', 'Idrissi Alami', 'Mohammed', '1996-05-05', 'Lotissement najah, rue n 12 immeuble 3', 'Rabat',
        'Bac+ 4'),
       ('F9827363', 'Boudiaf', 'Fatima Zohra', '1997-01-10', 'Immeuble iftikhar, n 13 ettakaddoum', 'Rabat', 'Bac+ 2'),
       ('G5346789', 'Toumi', 'Aicha', '2000-12-03', 'N12 immeuble Jaouhara', 'Casablanca', 'Bac+ 5'),
       ('J3578902', 'Ben Omar', 'Abd Allah', '1990-06-25', 'Villa Amina n12 bir rami', 'Kenitra', 'Doctorat'),
       ('Y1234987', 'Ouled thami', 'Ali', '1979-12-04', 'La ville haute, rue chouhada n 6', 'Tanger', 'Bac+ 4');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation`
(
    `codeForm`  varchar(8) NOT NULL,
    `titreForm` varchar(20) DEFAULT NULL,
    `dureeForm` int(11)     DEFAULT NULL,
    `prixForm`  float       DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`codeForm`, `titreForm`, `dureeForm`, `prixForm`)
VALUES ('11', 'developpement Java', 12, 3600),
       ('12', 'web developpment', 14, 4200),
       ('13', 'Anglais technique', 15, 3750),
       ('14', 'Communication', 10, 2500),
       ('15', 'Base de données Orac', 20, 6000),
       ('16', 'Soft skills', 12, 3000);

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription`
(
    `codeSess`       varchar(8)  NOT NULL,
    `NumCNIEtu`      varchar(20) NOT NULL,
    `TypeCours`      varchar(12) NOT NULL,
    `numInscription` varchar(30) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`codeSess`, `NumCNIEtu`, `TypeCours`, `numInscription`)
VALUES ('1101', 'AB234567', 'Distanciel', '1101AB234567'),
       ('1101', 'C0987265', 'Distanciel', '1101C0987265'),
       ('1101', 'D2356903', 'Distanciel', '1101D2356903'),
       ('1101', 'F9827363', 'Distanciel', '1101F9827363'),
       ('1101', 'G5346789', 'Distanciel', '1101G5346789'),
       ('1101', 'J3578902', 'Distanciel', '1101J3578902'),
       ('1101', 'Y1234987', 'Distanciel', '1101Y1234987'),
       ('1201', 'AB234567', 'Presentiel', '1201AB234567'),
       ('1201', 'C0987265', 'Presentiel', '1201C0987265'),
       ('1201', 'D2356903', 'Presentiel', '1201D2356903'),
       ('1201', 'G5346789', 'Distanciel', '1201G5346789'),
       ('1201', 'J3578902', 'Presentiel', '1201J3578902'),
       ('1201', 'Y1234987', 'Presentiel', '1201Y1234987'),
       ('1302', 'AB234567', 'Presentiel', '1302AB234567'),
       ('1302', 'C0987265', 'Presentiel', '1302C0987265'),
       ('1302', 'D2356903', 'Presentiel', '1302D2356903'),
       ('1302', 'G5346789', 'Distanciel', '1302G5346789'),
       ('1302', 'Y1234987', 'Presentiel', '1302Y1234987'),
       ('1401', 'C0987265', 'Distanciel', '1401C0987265'),
       ('1401', 'D2356903', 'Distanciel', '1401D2356903'),
       ('1401', 'F9827363', 'Distanciel', '1401F9827363'),
       ('1401', 'G5346789', 'Distanciel', '1401G5346789'),
       ('1401', 'J3578902', 'Distanciel', '1401J3578902'),
       ('1401', 'Y1234987', 'Distanciel', '1401Y1234987'),
       ('1501', 'AB234567', 'Distanciel', '1501AB234567'),
       ('1501', 'C0987265', 'Distanciel', '1501C0987265'),
       ('1501', 'D2356903', 'Presentiel', '1501D2356903'),
       ('1501', 'F9827363', 'Presentiel', '1501F9827363'),
       ('1501', 'G5346789', 'Distanciel', '1501G5346789'),
       ('1501', 'J3578902', 'Presentiel', '1501J3578902'),
       ('1501', 'Y1234987', 'Presentiel', '1501Y1234987');

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session`
(
    `codeSess`  varchar(8) NOT NULL,
    `nomSess`   varchar(20) DEFAULT NULL,
    `dateDebut` date        DEFAULT NULL,
    `dateFin`   date        DEFAULT NULL,
    `codeForm`  varchar(8) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`codeSess`, `nomSess`, `dateDebut`, `dateFin`, `codeForm`)
VALUES ('1101', 'Session 1101', '2022-01-02', '2022-01-14', '11'),
       ('1102', 'Session 1102', '2022-02-03', '2022-02-15', '11'),
       ('1104', 'Session 1104', '2022-10-15', '2022-10-27', '11'),
       ('1201', 'Session 1201', '2022-03-04', '2022-03-18', '12'),
       ('1202', 'Session 1202', '2022-04-05', '2022-04-19', '12'),
       ('1203', 'Session 1203', '2022-11-16', '2022-11-30', '12'),
       ('1204', 'Session 1204', '2022-12-17', '2022-12-31', '12'),
       ('1301', 'Session 1301', '2022-01-06', '2022-01-21', '13'),
       ('1302', 'Session 1302', '2022-05-07', '2022-05-22', '13'),
       ('1303', 'Session 1303', '2022-06-08', '2022-06-23', '13'),
       ('1401', 'Session 1401', '2022-09-01', '2022-09-11', '14'),
       ('1402', 'Session 1402', '2022-08-08', '2022-08-18', '14'),
       ('1501', 'Session 1501', '2022-11-11', '2022-12-01', '15'),
       ('1502', 'Session 1502', '2022-09-12', '2022-10-02', '15'),
       ('1601', 'Session 1601', '2022-09-13', '2022-09-25', '16'),
       ('1602', 'Session 1602', '2022-10-14', '2022-10-26', '16');

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE `specialite`
(
    `codeSpec` varchar(8) NOT NULL,
    `nomSpec`  varchar(20)  DEFAULT NULL,
    `descSpec` varchar(255) DEFAULT NULL,
    `Active`   tinyint(1)   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`codeSpec`, `nomSpec`, `descSpec`, `Active`)
VALUES ('101', 'GL', 'Genie logiciel et develloppement', 1),
       ('102', 'Data', 'Data engineering', 1),
       ('103', 'Langues', 'Anglais Français', 1),
       ('104', 'Communication', 'Communication', 1),
       ('105', 'Securite', 'Reseaux et securite', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `catalogue`
--
ALTER TABLE `catalogue`
    ADD PRIMARY KEY (`codeForm`, `codeSpec`),
    ADD KEY `codeSpec` (`codeSpec`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
    ADD PRIMARY KEY (`NumCNIEtu`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
    ADD PRIMARY KEY (`codeForm`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
    ADD PRIMARY KEY (`codeSess`, `NumCNIEtu`),
    ADD KEY `NumCNIEtu` (`NumCNIEtu`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
    ADD PRIMARY KEY (`codeSess`),
    ADD KEY `codeForm` (`codeForm`);

--
-- Index pour la table `specialite`
--
ALTER TABLE `specialite`
    ADD PRIMARY KEY (`codeSpec`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `catalogue`
--
ALTER TABLE `catalogue`
    ADD CONSTRAINT `catalogue_ibfk_1` FOREIGN KEY (`codeForm`) REFERENCES `formation` (`codeForm`),
    ADD CONSTRAINT `catalogue_ibfk_2` FOREIGN KEY (`codeSpec`) REFERENCES `specialite` (`codeSpec`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
    ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`codeSess`) REFERENCES `session` (`codeSess`),
    ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`NumCNIEtu`) REFERENCES `etudiant` (`NumCNIEtu`);

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
    ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`codeForm`) REFERENCES `formation` (`codeForm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
