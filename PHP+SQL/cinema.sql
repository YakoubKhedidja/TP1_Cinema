--
-- Base de données : `cinema`
--

DROP SCHEMA IF EXISTS `cinema`;
CREATE SCHEMA `cinema` DEFAULT CHARACTER SET utf8 ;
USE `cinema` ;

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

CREATE TABLE `acteur` (
  `id_acteur` int(10) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `acteur`
--

INSERT INTO `acteur` (`id_acteur`, `nom`, `prenom`) VALUES
(1, 'Montand', 'Yves'),
(2, 'Depardieu', 'Gérard'),
(3, 'Auteuil', 'Daniel'),
(4, 'Depardieu', 'Élisabeth'),
(5, 'Béart', 'Emmanuelle'),
(6, 'Girardot', 'Hippolyte'),
(7, 'De Tonquedec', 'Guillaume'),
(8, 'Carré', 'Isabelle'),
(9, 'Bouillette', 'Christian'),
(10, 'Lavernhe', 'Benjamin'),
(11, 'Gadebois', 'Grégory'),
(12, 'Lefèbvre', 'Lorenzo'),
(13, 'Montpetit', 'Sara'),
(14, 'Ricard', 'Sébastien'),
(15, 'Florent', 'Hélène'),
(16, 'Schneider', 'Émile'),
(17, 'Pilon', 'Antoine Olivier'),
(18, 'Naylor', 'Robert'),
(19, 'Dubreuil', 'Martin'),
(20, 'Gilmore', 'Danny'),
(21, 'Arcand', 'Gabriel'),
(22, 'Sicotte', 'Gilbert'),
(23, 'Bibeau', 'Émilie'),
(24, 'Cloutier', 'Fabien'),
(25, 'Papineau', 'François'),
(26, 'Girard', 'Rémy'),
(27, 'Vachon', 'Arnaud'),
(28, 'Huard', 'Xavier'),
(29, 'Dujardin', 'Jean'),
(30, 'Lindinger', 'Natacha'),
(31, 'NDiaye', 'Fatou'),
(32, 'Yordanoff', 'Wladimir '),
(33, 'Casta', 'Melodie'),
(34, 'Niney', 'Pierre'),
(35, 'Merad', 'Kad'),
(36, 'Ayala', 'David'),
(37, 'Cissokho', 'Lamine'),
(38, 'Khammes', 'Sofian'),
(39, 'Lottin', 'Pierre'),
(40, 'Nabié', 'Wabinlé'),
(41, 'Medvedev', 'Alexandre'),
(42, 'Benchnafa', 'Saïd'),
(43, 'Hands', 'Marina'),
(44, 'Stocker', 'Laurent'),
(45, 'Seydoux', 'Léa'),
(46, 'Köhler', 'Juliane'),
(47, 'Biolay', 'Benjamin'),
(48, 'Gardin', 'Blanche'),
(49, 'Arioli', 'Emanuele'),
(50, 'Zemmar', 'Jawad'),
(51, 'Kunz', 'Molly'),
(52, 'Greene', 'Graham'),
(53, 'Carrick', 'Charlie'),
(54, 'Perin', 'Jacques'),
(55, 'Fresnay', 'Pierre'),
(56, 'Francey', 'Micheline'),
(57, 'Leclerc', 'Ginette'),
(58, 'Manson', 'Helena'),
(59, 'Black', 'Jack'),
(60, 'Hong', 'James'),
(61, 'Chan', 'Jackie'),
(62, 'Hoffman', 'Dustin');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id_film` int(10) UNSIGNED NOT NULL,
  `titre` varchar(255) NOT NULL,
  `duree` smallint(5) UNSIGNED NOT NULL,
  `annee_sortie` smallint(5) UNSIGNED NOT NULL,
  `resume` text NOT NULL,
  `affiche` varchar(255) NOT NULL,
  `statut` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `genre_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id_film`, `titre`, `duree`, `annee_sortie`, `resume`, `affiche`, `statut`, `genre_id`) VALUES
(1, 'MARIA CHAPDELAINE', 158, 2021, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'medias/affiches/a-1-1634825410.jpg', 1, 4),

(2, 'LE LOUP ET LE LION', 99, 2021, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'medias/affiches/leloupetlelion_affiche.jpeg', 1, 4),

(3, 'Kung Fu Panda', 92, 2008, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'medias/affiches/kung-panda.jpg', 1, 1),

(4, 'LE CLUB VINLAND', 125, 2020, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'medias/affiches/a-4-1634836393.jpg', 1, 2),

(5, 'LE CORBEAU', 92, 1943, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'medias/affiches/lecorbeau.jpg', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `film_acteur`
--

CREATE TABLE `film_acteur` (
  `f_a_film_id` int(10) UNSIGNED NOT NULL,
  `f_a_acteur_id` int(10) UNSIGNED NOT NULL,
  `f_a_priorite` tinyint(3) UNSIGNED NOT NULL DEFAULT 99
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `film_acteur`
--

INSERT INTO `film_acteur` (`f_a_film_id`, `f_a_acteur_id`, `f_a_priorite`) VALUES
(1, 13, 1),
(1, 14, 2),
(1, 15, 3),
(1, 16, 4),
(1, 17, 5),
(1, 18, 6),
(1, 19, 7),
(1, 20, 8),
(1, 21, 9),
(1, 22, 10),
(2, 51, 1),
(2, 52, 2),
(2, 53, 3),
(2, 54, 4),
(3, 59, 1),
(3, 60, 2),
(3, 61, 3),
(3, 62, 4),
(4, 14, 6),
(4, 23, 1),
(4, 24, 2),
(4, 25, 3),
(4, 26, 4),
(4, 27, 5),
(4, 28, 7),
(5, 55, 1),
(5, 56, 2),
(5, 57, 3),
(5, 58, 4);


-- --------------------------------------------------------

--
-- Structure de la table `film_pays`
--

CREATE TABLE `film_pays` (
  `f_p_film_id` int(10) UNSIGNED NOT NULL,
  `f_p_pays_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `film_pays`
--

INSERT INTO `film_pays` (`f_p_film_id`, `f_p_pays_id`) VALUES
(1, 1),
(2, 4),
(3, 2),
(4, 1),
(5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `film_realisateur`
--

CREATE TABLE `film_realisateur` (
  `f_r_film_id` int(10) UNSIGNED NOT NULL,
  `f_r_realisateur_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `film_realisateur`
--

INSERT INTO `film_realisateur` (`f_r_film_id`, `f_r_realisateur_id`) VALUES
(1, 2),
(2, 10),
(3, 12),
(4, 3),
(5, 11);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id_genre` tinyint(3) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id_genre`, `nom`) VALUES
(1, 'Animation'),
(2, 'Comédie'),
(3, 'Aventure'),
(4, 'Drame'),
(5, 'Documentaire');

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `id_pays` int(10) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id_pays`, `nom`) VALUES
(1, 'Canada'),
(2, 'États-Unis'),
(3, 'Espagne'),
(4, 'France'),
(5, 'Grande-Bretagne'),
(6, 'Italie'),
(7, 'Suisse'),
(8, 'Autriche'),
(9, 'Allemagne'),
(10, 'Belgique');

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

CREATE TABLE `realisateur` (
  `id_realisateur` int(10) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `realisateur`
--

INSERT INTO `realisateur` (`id_realisateur`, `nom`, `prenom`) VALUES
(1, 'Berri', 'Claude'),
(2, 'Pilote', 'Sébastien'),
(3, 'Pilon', 'Benoît'),
(4, ' Besnard', 'Éric'),
(5, 'Bedos', 'Nicolas'),
(6, 'Courcol', 'Emmanuel'),
(7, 'Aurel', ''),
(8, 'Dumont', 'Bruno'),
(9, 'Vasseur', 'Flore'),
(10, 'De Maistre', 'Gilles'),
(11, 'Clouzot', 'Henri-Georges'),
(12, 'Osborne', 'Mark');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `numero` tinyint(3) UNSIGNED NOT NULL,
  `nb_places` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`numero`, `nb_places`) VALUES
(1, 200),
(2, 120),
(3, 50);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `film_id` int(10) UNSIGNED NOT NULL,
  `salle_numero` tinyint(3) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`film_id`, `salle_numero`, `date`, `heure`) VALUES
(2, 1, '2022-07-25', '15:00:00'),
(2, 1, '2022-07-25', '17:00:00'),
(2, 1, '2022-07-26', '10:00:00'),
(2, 1, '2022-07-26', '12:00:00'),
(2, 1, '2022-07-26', '15:00:00'),
(2, 1, '2022-07-26', '17:00:00'),
(2, 1, '2022-07-26', '19:00:00'),
(2, 1, '2022-07-26', '21:00:00'),
(2, 1, '2022-07-31', '15:00:00'),
(3, 3, '2022-08-01', '18:00:00'),
(3, 3, '2022-08-01', '21:00:00'),
(3, 3, '2022-08-02', '16:00:00'),
(5, 2, '2022-07-25', '16:00:00'),
(5, 2, '2022-07-26', '18:00:00');

-- --------------------------------------------------------

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acteur`
--
ALTER TABLE `acteur`
  ADD PRIMARY KEY (`id_acteur`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`),
  ADD KEY `fk_film_genre_idx` (`genre_id`);

--
-- Index pour la table `film_acteur`
--
ALTER TABLE `film_acteur`
  ADD PRIMARY KEY (`f_a_film_id`,`f_a_acteur_id`),
  ADD KEY `fk_f_a_acteur_idx` (`f_a_acteur_id`),
  ADD KEY `fk_f_a_film_idx` (`f_a_film_id`);

--
-- Index pour la table `film_pays`
--
ALTER TABLE `film_pays`
  ADD PRIMARY KEY (`f_p_film_id`,`f_p_pays_id`),
  ADD KEY `fk_f_p_pays_idx` (`f_p_pays_id`),
  ADD KEY `fk_f_p_film_idx` (`f_p_film_id`);

--
-- Index pour la table `film_realisateur`
--
ALTER TABLE `film_realisateur`
  ADD PRIMARY KEY (`f_r_film_id`,`f_r_realisateur_id`),
  ADD KEY `fk_f_r_realisateur_idx` (`f_r_realisateur_id`),
  ADD KEY `fk_f_r_film_idx` (`f_r_film_id`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id_pays`);

--
-- Index pour la table `realisateur`
--
ALTER TABLE `realisateur`
  ADD PRIMARY KEY (`id_realisateur`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`numero`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`film_id`,`salle_numero`,`date`,`heure`),
  ADD KEY `fk_seance_salle_idx` (`salle_numero`),
  ADD KEY `fk_seance_film_idx` (`film_id`);

-- --------------------------------------------------------

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acteur`
--
ALTER TABLE `acteur`
  MODIFY `id_acteur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id_pays` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `realisateur`
--
ALTER TABLE `realisateur`
  MODIFY `id_realisateur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

-- --------------------------------------------------------

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `fk_film_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id_genre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `film_acteur`
--
ALTER TABLE `film_acteur`
  ADD CONSTRAINT `fk_f_a_acteur` FOREIGN KEY (`f_a_acteur_id`) REFERENCES `acteur` (`id_acteur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_f_a_film` FOREIGN KEY (`f_a_film_id`) REFERENCES `film` (`id_film`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `film_pays`
--
ALTER TABLE `film_pays`
  ADD CONSTRAINT `fk_f_p_film` FOREIGN KEY (`f_p_film_id`) REFERENCES `film` (`id_film`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_f_p_pays` FOREIGN KEY (`f_p_pays_id`) REFERENCES `pays` (`id_pays`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `film_realisateur`
--
ALTER TABLE `film_realisateur`
  ADD CONSTRAINT `fk_f_r_film` FOREIGN KEY (`f_r_film_id`) REFERENCES `film` (`id_film`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_f_r_realisateur` FOREIGN KEY (`f_r_realisateur_id`) REFERENCES `realisateur` (`id_realisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `fk_seance_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`id_film`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seance_salle` FOREIGN KEY (`salle_numero`) REFERENCES `salle` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION;