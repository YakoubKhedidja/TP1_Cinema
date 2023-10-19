<?php
/*
// SERVERUR WEBDEV
// Adresse du serveur de base de données
define('DB_SERVEUR', 'localhost');
// Nom de la base de données
define('DB_NOM','e2295558');
// Data Source Name : driver + adresse serveur + nom bdd + charset à utiliser
define('DB_DSN','mysql:host='. DB_SERVEUR .';dbname='. DB_NOM.';charset=utf8');
// Login
define('DB_LOGIN','e2295558');
// Mot de passe
define('DB_PASSWORD','NbWPQ6dWlPHMp1wgYtT8');
*/

// SERVERUR XAMPP
// Adresse du serveur de base de données
define('DB_SERVEUR', 'localhost');
// Nom de la base de données
define('DB_NOM','cinema');
// Data Source Name : driver + adresse serveur + nom bdd + charset à utiliser
define('DB_DSN','mysql:host='. DB_SERVEUR .';dbname='. DB_NOM.';charset=utf8');
// Login
define('DB_LOGIN','root');
// Mot de passe
define('DB_PASSWORD','');


// Variable globale pour utilisation dans des méthodes
global $oPDO;

$options = [
  PDO::ATTR_ERRMODE           => PDO::ERRMODE_EXCEPTION,  // Gestion des erreurs par des exceptions de la classe PDOException
  PDO::ATTR_EMULATE_PREPARES  => false                    // Préparation des requêtes non émulée
];
$oPDO = new PDO(DB_DSN, DB_LOGIN, DB_PASSWORD, $options); // Instanciation de la connexion
$oPDO->query("SET lc_time_names = 'fr_FR'");              // Pour afficher les jours en français 