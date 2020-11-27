<?php 

define('TAILLE_BOUTIQUE', 6);
include("../donnees/data.php");
// $pdo = new PDO("mysql:host=localhost; dbname=rpg_js", "root", "" , array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
$tableauEquipement =  $pdo->query("select * from equipement where id_joueur = null")->fetchAll(); 
// var_dump($tableauEquipement);

function tirageEquipement($tabEquip){
    $tabTirage = array(); //tirer un élement au hasard dans la base de données
    
    for ($i = 0 ; $i < count($tabEquip) ; $i++){

        for ($j = 0; $j < intval($tabEquip[$i]["rarete"]); $j++)
        {
            $tabTirage[]=$tabEquip[$i];
        }
    }
    // var_dump($tabTirage);
    $rand = rand(0, count($tabTirage)-1);

    return $tabTirage[$rand];
}

function nouvelleBoutique ($tabEquip){//créer une nouvelle boutique de 6 objets (tableau)
    $boutique = array(); 
    for($i = 0 ; $i < TAILLE_BOUTIQUE ; $i++ ){
        $boutique[] = tirageEquipement($tabEquip);
    }
    return $boutique;
}

function acheter($id_equip, $id_perso){
    $donnees_equip=$pdo->query("select * from equipement where id_equipement = "+"$id_equip")->fetch();
    $pdo->exec("update personnage set pO = pO - "+$donnees_equip['prix']+"where id_personnage = $id_perso");
    $pdo->exec("insert into possede(id_personnage, id_equipement) values($id_equip, $id_perso)");
}



switch($_GET['fonction']){
    case "nvBoutique": //obtenir une nouvelle boutique à partir de rien
        echo json_encode(nouvelleBoutique($tableauEquipement));
    break;
    case "acheter":
        acheter($_GET["id_equip"], $_GET["id_perso"]);
    break;
    default:{
        echo json_encode("Errreur d'argument !");
    }
}?>
