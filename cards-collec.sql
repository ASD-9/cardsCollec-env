-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : mysqldb
-- Généré le : mar. 14 jan. 2025 à 17:30
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cards-collec`
--

-- --------------------------------------------------------

--
-- Structure de la table `Avatars`
--

CREATE TABLE `Avatars` (
  `id_avatar` smallint UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `image_path` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Avatars`
--

INSERT INTO `Avatars` (`id_avatar`, `name`, `image_path`) VALUES
(1, 'test', 'path/to/test.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `Cards`
--

CREATE TABLE `Cards` (
  `id_card` smallint UNSIGNED NOT NULL,
  `image_path` varchar(128) NOT NULL,
  `number` smallint UNSIGNED NOT NULL,
  `id_rarity` smallint UNSIGNED NOT NULL,
  `id_set` smallint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Collections`
--

CREATE TABLE `Collections` (
  `id_collection` smallint UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `image_path` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Rarities`
--

CREATE TABLE `Rarities` (
  `id_rarity` smallint UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `abbreviated_name` varchar(8) NOT NULL,
  `rank` tinyint UNSIGNED NOT NULL,
  `id_collection` smallint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Roles`
--

CREATE TABLE `Roles` (
  `id_role` smallint UNSIGNED NOT NULL,
  `name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Roles`
--

INSERT INTO `Roles` (`id_role`, `name`) VALUES
(2, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `Sets`
--

CREATE TABLE `Sets` (
  `id_set` smallint UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `image_path` varchar(128) NOT NULL,
  `id_collection` smallint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE `Users` (
  `id_user` smallint UNSIGNED NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_role` smallint UNSIGNED NOT NULL,
  `id_avatar` smallint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Users`
--

INSERT INTO `Users` (`id_user`, `username`, `password`, `id_role`, `id_avatar`) VALUES
(1, 'Updated Username', 'Psw', 2, 1),
(2, 'John Doe', 'password', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Users_Cards`
--

CREATE TABLE `Users_Cards` (
  `id_user` smallint UNSIGNED NOT NULL,
  `id_card` smallint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Avatars`
--
ALTER TABLE `Avatars`
  ADD PRIMARY KEY (`id_avatar`);

--
-- Index pour la table `Cards`
--
ALTER TABLE `Cards`
  ADD PRIMARY KEY (`id_card`),
  ADD KEY `card_set` (`id_set`),
  ADD KEY `card_rarity` (`id_rarity`);

--
-- Index pour la table `Collections`
--
ALTER TABLE `Collections`
  ADD PRIMARY KEY (`id_collection`);

--
-- Index pour la table `Rarities`
--
ALTER TABLE `Rarities`
  ADD PRIMARY KEY (`id_rarity`),
  ADD KEY `rarity_collection` (`id_collection`);

--
-- Index pour la table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `Sets`
--
ALTER TABLE `Sets`
  ADD PRIMARY KEY (`id_set`),
  ADD KEY `set_collection` (`id_collection`);

--
-- Index pour la table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `user_role` (`id_role`),
  ADD KEY `user_avatar` (`id_avatar`);

--
-- Index pour la table `Users_Cards`
--
ALTER TABLE `Users_Cards`
  ADD KEY `user_card` (`id_user`),
  ADD KEY `card_user` (`id_card`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Avatars`
--
ALTER TABLE `Avatars`
  MODIFY `id_avatar` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Cards`
--
ALTER TABLE `Cards`
  MODIFY `id_card` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Collections`
--
ALTER TABLE `Collections`
  MODIFY `id_collection` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Rarities`
--
ALTER TABLE `Rarities`
  MODIFY `id_rarity` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Roles`
--
ALTER TABLE `Roles`
  MODIFY `id_role` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Sets`
--
ALTER TABLE `Sets`
  MODIFY `id_set` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`
  MODIFY `id_user` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Cards`
--
ALTER TABLE `Cards`
  ADD CONSTRAINT `card_rarity` FOREIGN KEY (`id_rarity`) REFERENCES `Rarities` (`id_rarity`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `card_set` FOREIGN KEY (`id_set`) REFERENCES `Sets` (`id_set`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Rarities`
--
ALTER TABLE `Rarities`
  ADD CONSTRAINT `rarity_collection` FOREIGN KEY (`id_collection`) REFERENCES `Collections` (`id_collection`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Sets`
--
ALTER TABLE `Sets`
  ADD CONSTRAINT `set_collection` FOREIGN KEY (`id_collection`) REFERENCES `Collections` (`id_collection`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `user_avatar` FOREIGN KEY (`id_avatar`) REFERENCES `Avatars` (`id_avatar`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `user_role` FOREIGN KEY (`id_role`) REFERENCES `Roles` (`id_role`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `Users_Cards`
--
ALTER TABLE `Users_Cards`
  ADD CONSTRAINT `card_user` FOREIGN KEY (`id_card`) REFERENCES `Cards` (`id_card`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_card` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
