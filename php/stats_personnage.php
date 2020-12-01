<?php
include("../donnees/data.php");





function statperso($id_perso){
    $pdo = new PDO("mysql:host=localhost; dbname=rpg_js", "root", "" , array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
    $sth = $pdo->query("SELECT * FROM personnage WHERE id_personnage= 1 ");
 

    $result = $sth->fetchAll(PDO::FETCH_OBJ);
    
    echo json_encode($result) ;


}
?>