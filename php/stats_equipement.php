
                                          
<?php
include("../donnees/data.php");





function inventaire($pdo, $type_equipement, $id_perso ){
    $sth = $pdo->query("SELECT * FROM equipement e inner join possede p on e.id_equipement = p.id_equipement where p.id_personnage =". $id_perso ." and type_equipement ='".$type_equipement."';");
    $result = $sth->fetch();
    echo json_encode($result);
    // var_dump($result);
}

function ajouterPieces($pdo, $qtePieces, $id_joueur){
    $pdo->exec("update personnage set pO = pO + $qtePieces where id_personnage = $id_joueur");
}




switch($_GET["fonction"]){
    case "equipement_veste":
        inventaire($pdo, "veste", $_GET["id_utilisateur"]);
        break;
    case "equipement_chapeau":
        inventaire($pdo, "chapeau", $_GET["id_utilisateur"]);
        break;
    case "equipement_arme":
        inventaire($pdo, "arme", $_GET["id_utilisateur"]);
        break;
    case "equipement_futal":
        inventaire($pdo, "futal", $_GET["id_utilisateur"]);
        break;
    case "equipement_chaussures":
        inventaire($pdo, "chaussures", $_GET["id_utilisateur"]);
        break;
    case "gagnerdelargent":
        ajouterPieces($pdo, $_GET["qtePieces"], $_GET["id_utilisateur"]);
        break;
}
?>