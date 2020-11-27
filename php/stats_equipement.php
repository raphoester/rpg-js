
                                          
<?php
include("../donnees/data.php");
$sth = $pdo->query("SELECT * FROM equipement WHERE id_personnage= 1 ");
$result = $sth->fetchAll(PDO::FETCH_OBJ);

$sth1 = $pdo->query("SELECT * FROM equipement WHERE id_equipement= 1 ");
$result1 = $sth1->fetchAll(PDO::FETCH_OBJ); 




switch($_GET['inventaire']){
    case "equipement": //Affiche l'inventaire en fonction de l'id du joueur
        echo json_encode($result);
    break;
    case "Stat": //Affiche les caractéristique d'un objet/potion/armure en fonction de l'id de celui ci 
        echo json_encode($result1);
    break;
    default:{
        echo json_encode("Errreur d'argument !");
    }
}



?>