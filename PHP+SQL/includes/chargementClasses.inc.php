<?php 

/**
 * Fonction qui s'exécute dès qu'une classe est manipulée pour la première fois par l'application
 * @param string $classe, nom de la classe avec son namespace éventuel 
 */
function chargerClasse($classe) {
  require './Classe/'.$classe .'.class.php';
}

spl_autoload_register('chargerClasse');