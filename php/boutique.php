<?php 

define('TAILLE_BOUTIQUE', 6);
include("../donnees/data.php");
// $pdo = new PDO("mysql:host=localhost; dbname=rpg_js", "root", "" , array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
$tableauEquipement =  $pdo->query("select * from equipement")->fetchAll(); 

function tirageEquipement($tabEquip){
    $tabTirage = []; //tirer un élement au hasard dans la base de données
    foreach ($tabEquip as $element){
        for ($i = 0; $i > $element["rarete"]; $i++)
        {
            $tabTirage->append($element);
        }
    }
    return $tabTirage[$array_rand($tabTirage)];
}

function nouvelleBoutique (){
    $boutique = [];//créer une nouvelle boutique de 6 objets (tableau)
    for($i = 0 ; $i < 'TAILLE_BOUTIQUE' ; $i++ ){
        $boutique.append(tirageEquipement($tableauEquipement));
    }
    return $boutique;
}



switch($_GET['fonction']){
    case "nvBoutique": //obtenir une nouvelle boutique à partir de rien
        echo json_encode(nouvelleBoutique($tableauEquipement));
    break;
    default:{
        echo json_encode("Errreur d'argument !");
    }
}



?>

