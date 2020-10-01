-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  lun. 02 déc. 2019 à 15:08
-- Version du serveur :  10.3.20-MariaDB
-- Version de PHP :  7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `lafr0800_db_expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

CREATE TABLE `adresses` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `rue` varchar(100) NOT NULL,
  `code_postal` int(11) NOT NULL,
  `ville` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `adresses`
--

INSERT INTO `adresses` (`id`, `type`, `numero`, `rue`, `code_postal`, `ville`) VALUES
(1, 'livraison', '169', 'Chemin des Résistants', 74350, 'Cruseilles'),
(2, 'facturation', '169', 'Chemin des Résistants', 74350, 'Cruseilles'),
(3, 'livraison', '7', 'Cité Paradis', 75010, 'Paris'),
(4, 'livraison', '5', 'Rue du Môle', 74100, 'Annemasse'),
(5, 'facturation', '2', 'Place du marché', 74330, 'Epagny');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL,
  `adresse_livraison_id` int(11) NOT NULL,
  `adresse_facturation_id` int(11) NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `date_commande` datetime NOT NULL,
  `date_livraison` datetime NOT NULL,
  `numero_facture` int(11) NOT NULL,
  `statut` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `adresse_livraison_id`, `adresse_facturation_id`, `livreur_id`, `client_id`, `date_commande`, `date_livraison`, `numero_facture`, `statut`) VALUES
(1, 1, 2, 2, 1, '2019-11-24 00:00:00', '2019-11-25 12:20:00', 1, 'en livraison'),
(2, 4, 5, 6, 4, '2019-11-24 00:00:00', '2019-11-25 13:30:00', 2, 'livrée');

-- --------------------------------------------------------

--
-- Structure de la table `commande_plat`
--

CREATE TABLE `commande_plat` (
  `plat_id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande_plat`
--

INSERT INTO `commande_plat` (`plat_id`, `commande_id`, `quantite`) VALUES
(1, 2, 2),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `livreur_stock`
--

CREATE TABLE `livreur_stock` (
  `utilisateur_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livreur_stock`
--

INSERT INTO `livreur_stock` (`utilisateur_id`, `plat_id`, `quantite`) VALUES
(2, 4, 4),
(5, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `plat_id`, `date`) VALUES
(1, 1, '2019-11-24'),
(2, 2, '2019-11-24'),
(3, 4, '2019-11-24'),
(4, 3, '2019-11-24');

-- --------------------------------------------------------

--
-- Structure de la table `plats`
--

CREATE TABLE `plats` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `descr` varchar(250) NOT NULL,
  `prix` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `plats`
--

INSERT INTO `plats` (`id`, `nom`, `type`, `descr`, `prix`) VALUES
(1, 'sushi 2', 'plat', 'des sushis', 10),
(2, 'crepes', 'dessert', 'fait maison', 5),
(3, 'Panacotta', 'dessert', 'avec crumble et coulis de fraises', 7),
(4, 'Carpaccio', 'plat', 'accompagné de roquette et a sauce', 12);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `statut` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `login`, `password`, `email`, `telephone`, `created_at`, `updated_at`, `latitude`, `longitude`, `statut`, `type`) VALUES
(1, 'Labeau', 'François', 'flab', '1234', 'labeau.francois@gmail.com', '0658732561', '2019-10-01 00:00:00', '2019-11-22 00:00:00', '', '', 'connecté', 'client'),
(2, 'Gaillard', 'David', 'dgai', '0000', 'david.gaillard@gmail.com', '0600000001', '2019-11-01 00:00:00', '2019-11-13 11:00:00', '-20.01', '57.57', 'disponible', 'livreur'),
(3, 'Laniesse', 'Christel', 'clan', '0001', 'christel.laniesse@gmail.com', '0700000000', '2019-11-04 06:17:00', '2019-11-19 13:00:17', '', '', 'hors-ligne', 'client'),
(4, 'Labeau', 'Augustin', 'alab', '0002', 'augustin@hotmail.com', '0601020304', '2019-10-07 11:16:00', '2019-11-07 16:00:00', '', '', 'connecté', 'client'),
(5, 'Dalton', 'Joe', 'jdal', '9999', 'j.dalton@hotmail.com', '0612344556', '2019-11-10 13:24:11', '2019-11-23 08:12:28', '35.02', '27', 'en livraison', 'livreur'),
(6, 'Dalton', 'Averell', 'adal', '8888', 'a.dalton@hotmail.com', '0698765432', '2019-11-10 17:21:00', '2019-11-22 16:13:19', '30', '25.25', 'disponible', 'livreur');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateurs_commandes_fk` (`client_id`),
  ADD KEY `utilisateurs_commandes_fk1` (`livreur_id`),
  ADD KEY `adresses_commandes_fk` (`adresse_livraison_id`),
  ADD KEY `adresses_commandes_fk1` (`adresse_facturation_id`);

--
-- Index pour la table `commande_plat`
--
ALTER TABLE `commande_plat`
  ADD PRIMARY KEY (`plat_id`,`commande_id`),
  ADD KEY `commandes_commande_plat_fk` (`commande_id`);

--
-- Index pour la table `livreur_stock`
--
ALTER TABLE `livreur_stock`
  ADD PRIMARY KEY (`utilisateur_id`,`plat_id`),
  ADD KEY `plat_livreur_stock_fk` (`plat_id`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plat_menus_fk` (`plat_id`);

--
-- Index pour la table `plats`
--
ALTER TABLE `plats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresses`
--
ALTER TABLE `adresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `plats`
--
ALTER TABLE `plats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `adresses_commandes_fk` FOREIGN KEY (`adresse_livraison_id`) REFERENCES `adresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `adresses_commandes_fk1` FOREIGN KEY (`adresse_facturation_id`) REFERENCES `adresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `utilisateurs_commandes_fk` FOREIGN KEY (`client_id`) REFERENCES `utilisateurs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `utilisateurs_commandes_fk1` FOREIGN KEY (`livreur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande_plat`
--
ALTER TABLE `commande_plat`
  ADD CONSTRAINT `commandes_commande_plat_fk` FOREIGN KEY (`commande_id`) REFERENCES `commandes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `plat_commande_plat_fk` FOREIGN KEY (`plat_id`) REFERENCES `plats` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur_stock`
--
ALTER TABLE `livreur_stock`
  ADD CONSTRAINT `plat_livreur_stock_fk` FOREIGN KEY (`plat_id`) REFERENCES `plats` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `utilisateurs_livreur_stock_fk` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `plat_menus_fk` FOREIGN KEY (`plat_id`) REFERENCES `plats` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
