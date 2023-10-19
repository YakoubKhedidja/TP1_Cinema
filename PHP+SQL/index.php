<?php
try {
  require 'includes/config.php';  
  require 'includes/chargementClasses.inc.php';  
  require 'includes/connexionPDO.inc.php';
  $oRequetesSQL = new RequetesSQL();
  $films = $oRequetesSQL->getFilms('enSalle');
} catch(Error | Exception $e) {
  require "templates/erreur.php";
  exit;
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="robots" content="noindex, nofollow">
  <title>À l'affiche</title>
  <link rel="stylesheet" type="text/css" href="css/styles.css?v=1.1">
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
      <h1>À L'AFFICHE</h1>
      <div>
      <?php if (count($films) !== 0) : ?>
        <?php foreach ($films as $film) :?>
        <div>
          <a href="film.php?id_film=<?= $film['id_film'] ?>"><img src="<?= $film['affiche'] ?>" alt=""></a>
          <p class="legende"><?= $film['nom']." - ".$film['annee_sortie']." - ".$film['duree'] ?> min</p>
        </div>
        <?php endforeach ?>
      <?php else : ?>
        <div>Aucun film.</div>
      <?php endif ?>
      </div>
    </section>
  </main>

  <footer>
    &copy; 2023 Ciné-FiveStarz
  </footer>
</body>
</html>