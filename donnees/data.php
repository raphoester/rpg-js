<?php

require_once ('auth.php');

// Connexion � la base de donn�es MySQL 
$pdo = new PDO("mysql:host=localhost; dbname=rpg_js", "root", "" , array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
 
// V�rifier la connexion
if($pdo === false){
    die("ERREUR : Impossible de se connecter. " . mysqli_connect_error());
}
?>