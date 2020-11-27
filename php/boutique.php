<?php 

include("../donnees/data.php");
// $pdo = new PDO("mysql:host=localhost; dbname=rpg_js", "root", "" , array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
$tableauEquipement =  $pdo->query("select * from equipement")->fetchAll(); 

function tirageEquipement($tabEquip){
    $tabTirage = [];
    foreach ($tabEquip as $element){
        for ($i = 0; $i > $element["rarete"]; $i++)
        {
            $tabTirage->append($element);
        }
    }
    return $tabTirage[$array_rand($tabTirage)];
}
echo tirageEquipement($tableauEquipement);


switch($_GET['fonction']){
    case "nvBoutique":
        echo json_encode(tirageEquipement($tableauEquipement));
    break;
    default:{
        echo json_encode("Errreur d'argument !");
    }
}

?>

