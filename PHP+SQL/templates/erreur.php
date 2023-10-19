<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Problème tehnique</title>
  <link rel="stylesheet" type="text/css" href="css/styles.css?v=1.1">
</head>

<body>
  <main>
    <section id="erreur">
      <h1>Problème technique</h1>
      <h3>Message d'erreur:</h3>
      <p><?= $e->getMessage() ?></p>
    </section>
  </main>
</body>
</html>