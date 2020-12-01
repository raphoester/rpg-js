
                                          
<?php
include("../donnees/data.php");





function inventaire($id_perso){
    $pdo = new PDO("mysql:host=localhost; dbname=rpg_js", "root", "" , array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
    $sth = $pdo->query("SELECT * FROM equipement e right join possede p on e.id_equipement = p.id_equipement where e.id_personnage = 1 ");
    $result = $sth->fetchAll(PDO::FETCH_OBJ);
    echo json_encode($result);
}

function afficher_equipement($id_perso, $id_equip){
    $pdo = new PDO("mysql:host=localhost; dbname=rpg_js", "root", "" , array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
    $sth1 = $pdo->query("SELECT * FROM equipement WHERE id_equipement= 1 ");
    $result1 = $sth1->fetchAll(PDO::FETCH_OBJ); 
    echo json_encode($result1);

}





?>