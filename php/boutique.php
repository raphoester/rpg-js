<?php 

include("donnees/data.php");
// $pdo = new PDO("mysql:host=localhost; dbname=rpg_js", "root", "" , array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
$tableauEquipement =  $pdo->query("select * from equipement")->fetchAll(); 
$tabEquip = [];




function tirageEquipement($tabEquip){
    $tabTirage = [];
    foreach ($tabEquip as $element){
        for ($i = 0; $i > $element["rarete"]; $i++)
        {
            $tabTirage->append($element);
        }
    }
    
    // var_dump($tabTirage);

}

tirageEquipement($tableauEquipement);

?>