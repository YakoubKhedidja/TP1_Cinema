<?php
try {
  require 'includes/config.php';  
  require 'includes/chargementClasses.inc.php';  
  require 'includes/connexionPDO.inc.php';

  $film = false;
  $film_id = $_GET['id_film'] ?? null; 
  if (!is_null($film_id)) {
    $oRequetesSQL = new RequetesSQL();
    $film         = $oRequetesSQL->getFilm($film_id);
    $realisateurs = $oRequetesSQL->getRealisateursFilm($film_id);
    $pays         = $oRequetesSQL->getPaysFilm($film_id);
    $acteurs      = $oRequetesSQL->getActeursFilm($film_id);
    $seancesTemp  = $oRequetesSQL->getSeancesFilm($film_id);
    // Création d'un tableau des séances avec pour chaque date de séance (clé associative)
    // un sous-tableau composé d'une clé 'jour' qui contient le nom du jour en français,
    // et d'une clé 'heures' qui contient un tableau des heures de séances 
    $seances = [];
    foreach ($seancesTemp as $seance) {
      $seances[$seance['date']]['jour']     = $seance['seance_jour'];
      $seances[$seance['date']]['heures'][] = $seance['heure'];
    }
  }
  if (!$film) throw new Exception("Film inexistant.");
} catch(Error | Exception $e) {
  require "templates/erreur.php";
  exit;
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Film <?= $film['titre'] ?></title>          <!-- a revoir -->
  <meta name="robots" content="noindex, nofollow">
  <link rel="stylesheet" type="text/css" href="css/styles.css">
  <link href="https://fonts.googleapis.com/css2?family=Sansita+Swashed&display=swap" rel="stylesheet">
</head>
<body>
  <header>
    <div id="logo">Ciné-FiveStarz</div>
    <nav>
      <ul>
        <li><a href="index.php">À l'affiche</a></li>
        <li><a href="prochainement.php">Prochainement</a></li>
      </ul>
    </nav>
  </header>
  <main>
    <section>
      <h1><?= $film['titre'] ?></h1>
      <div>
        <img src="<?= $film['affiche'] ?>" alt="">
        <div class="info">
          <p><?= $film['resume'] ?></p>
          <hr>
          <ul>
            <li><span>Genre:</span><span><?= $film['nom'] ?></span></li>
            <li><span>Année:</span><span><?= $film['annee_sortie'] ?></span></li>
            <li><span>Durée:</span><span><?= $film['duree'] ?> minutes</span></li>

            <!-- liste des réalisateurs --> 
            <li><span>Réalisateur:</span><span>
<?php $liste = "";
foreach ($realisateurs as $realisateur) :
  $liste .= $realisateur['prenom']." ".$realisateur['nom'].", "; 
endforeach ?>
              <?= substr($liste, 0, -2) ?></span></li>

            <!-- liste des pays --> 
            <li><span>Pays:</span><span>
<?php $liste = "";
foreach ($pays as $unPays) :
  $liste .= $unPays['nom'].", ";
endforeach ?>
              <?= substr($liste, 0, -2) ?></span></li>

            <!-- liste des acteurs --> 
            <li><span>Acteurs:</span><span>
<?php foreach ($acteurs as $acteur) : ?>
              <?= $acteur['prenom']." ".$acteur['nom']."<br>" ?> 
<?php endforeach ?>
              </span></li>
              
          </ul>
        </div>
        <div class="ba">
<!-- horaires -->  
<?php if (count($seances) > 0) : ?>
          <section>
            <h2>Horaires</h2>
            <div id="horaires">
            <?php   foreach($seances as $seance_date => $seance) : ?>
              <div class="jour"><?= ucfirst($seance['jour'])." ".substr($seance_date, 8) ?></div>
              <div class="heures">
              <?php   foreach($seance['heures'] as $heure) : ?>            
                <div><?= substr($heure, 0, 5) ?></div>  
              <?php   endforeach ?>
              </div>
            <?php   endforeach ?>  
            </div>
          </section>
  
<?php endif ?>
        </div>
      </div>  
    </section>
  </main>

  <footer>
    &copy; 2023 Ciné-FiveStarz
  </footer>

</body>
</html>