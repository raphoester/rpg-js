<?php

require_once ('auth.php');

// Connexion � la base de donn�es MySQL 
$pdo = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
 
// V�rifier la connexion
if($pdo === false){
    die("ERREUR : Impossible de se connecter. " . mysqli_connect_error());
}
?>