<?php

/**
 * Classe des requêtes SQL
 *
 */
class RequetesSQL extends RequetesPDO {

  /**
   * Récupération des films à l'affiche ou prochainement
   * @param  string $critere
   * @return array tableau des lignes produites par la select   
   */ 
  public function getFilms($critere = 'enSalle') {
    $oAujourdhui = ENV === "DEV" ? new DateTime(MOCK_NOW) : new DateTime();
    $aujourdhui  = $oAujourdhui->format('Y-m-d');
    $dernierJour = $oAujourdhui->modify('+6 day')->format('Y-m-d');
    $this->sql = "
      SELECT id_film, titre, duree, annee_sortie, resume,
             affiche, statut, genre.nom
      FROM film
      INNER JOIN genre ON id_genre = genre_id
      WHERE statut = ".Film::STATUT_VISIBLE;

      switch($critere) {
        case 'enSalle':
          $this->sql .= " AND id_film IN (SELECT DISTINCT film_id FROM seance
                                         WHERE seance.date >='$aujourdhui' AND seance.date <= '$dernierJour')";
          break;
        case 'prochainement':
          $this->sql .= " AND id_film NOT IN (SELECT DISTINCT film_id FROM seance
                                             WHERE seance.date <= '$dernierJour')";
          break;
      }      
    return $this->getLignes();
  }

  /**
   * Récupération d'un film
   * @param int $film_id, clé du film 
   * @return array|false tableau associatif de la ligne produite par la select, false si aucune ligne  
   */ 
  public function getFilm($film_id) {
    $this->sql = "
      SELECT id_film, titre, duree, annee_sortie, resume,
             affiche, statut, genre.nom
      FROM film
      INNER JOIN genre ON id_genre = genre_id
      WHERE id_film = :id_film AND statut = ".Film::STATUT_VISIBLE;

    return $this->getLignes(['id_film' => $film_id], RequetesPDO::UNE_SEULE_LIGNE);
  }

  /**
   * Récupération des réalisateurs d'un film
   * @param int $film_id, clé du film
   * @return array tableau des lignes produites par la select 
   */ 
  public function getRealisateursFilm($film_id) {
    $this->sql = "
      SELECT nom, prenom
      FROM realisateur
      INNER JOIN film_realisateur ON f_r_realisateur_id = id_realisateur
      WHERE f_r_film_id = :id_film";

    return $this->getLignes(['id_film' => $film_id]);
  }

  /**
   * Récupération des pays d'un film
   * @param int $film_id, clé du film
   * @return array tableau des lignes produites par la select 
   */ 
  public function getPaysFilm($film_id) {
    $this->sql = "
      SELECT nom
      FROM pays
      INNER JOIN film_pays ON f_p_pays_id = id_pays
      WHERE f_p_film_id = :id_film";

    return $this->getLignes(['id_film' => $film_id]);
  }

  /**
   * Récupération des acteurs d'un film
   * @param int $film_id, clé du film
   * @return array tableau des lignes produites par la select 
   */ 
  public function getActeursFilm($film_id) {
    $this->sql = "
      SELECT nom, prenom
      FROM acteur
      INNER JOIN film_acteur ON f_a_acteur_id = id_acteur
      WHERE f_a_film_id = :id_film
      ORDER BY f_a_priorite ASC";

    return $this->getLignes(['id_film' => $film_id]);
  }

  /**
   * Récupération des séances d'un film
   * @param int $film_id, clé du film
   * @return array tableau des lignes produites par la select 
   */ 
  public function getSeancesFilm($film_id) {
    $oAujourdhui = ENV === "DEV" ? new DateTime(MOCK_NOW) : new DateTime();
    $aujourdhui  = $oAujourdhui->format('Y-m-d');
    $dernierJour = $oAujourdhui->modify('+6 day')->format('Y-m-d');
    $this->sql = "
      SELECT DATE_FORMAT(date, '%W') AS seance_jour, date, heure
      FROM seance
      INNER JOIN film ON seance.film_id = id_film
      WHERE seance.film_id = :id_film AND seance.date >='$aujourdhui' AND seance.date <= '$dernierJour'
      ORDER BY seance.date, seance.heure";

    return $this->getLignes(['id_film' => $film_id]);
  }
}