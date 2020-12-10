<?php 

define('TAILLE_BOUTIQUE', 3);
include("../donnees/data.php");
// $pdo = new PDO("mysql:host=localhost; dbname=rpg_js", "root", "" , array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
$tableauEquipement =  $pdo->query("SELECT * from equipement")->fetchAll(); 
// var_dump($tableauEquipement);

function tirageEquipement($tabEquip){//tirer unéquipement au hasard dans la base de données en respectant les indices de rareté
    
    $tabTirage = array(); //construction du tableau de tirage en créant une fréquence différenciée artificielle
    for ($i = 0 ; $i < count($tabEquip) ; $i++){

        for ($j = 0; $j < intval($tabEquip[$i]["rarete"]); $j++)
        {
            $tabTirage[]=$tabEquip[$i];
        }
    }
    //tirage du nombre aléatoire à partir de la longueur de $tabTirage
    $rand = rand(0, count($tabTirage)-1);

    return $tabTirage[$rand];
}

function nouvelleBoutique ($tabEquip){//créer une nouvelle boutique de 6 objets (renvoie un tableau)

    
    $boutique = array(); 
    for($i = 0 ; $i < TAILLE_BOUTIQUE ; $i++ ){
        $boutique[] = tirageEquipement($tabEquip);
    }
    return $boutique;
}

function acheter($id_equip, $id_perso, $pdo){
    //selection de la bonne pièce d'équipement dans la table 
    $donnees_equip=$pdo->query("SELECT * from equipement where id_equipement = $id_equip;")->fetch();
    // le prix de l'équipement est décompté du solde du joueur (aucune vérification - chiffres négatifs autorisés)
    $pdo->exec("UPDATE personnage set pO = pO - ".$donnees_equip['prix']." where id_personnage = $id_perso;");
    //création d'une entrée dans la table relationnelle possède
    echo "INSERT into possede(id_personnage, id_equipement) values($id_equip, $id_perso)";

    
}



switch($_GET['fonction']){
    case "nvBoutique": //obtenir une nouvelle boutique à partir de rien
        echo json_encode(nouvelleBoutique($tableauEquipement));
    break;
    case "acheter"://acheter une pièce d'équipement
        acheter($_GET["id_equip"], $_GET["id_perso"], $pdo);
    break;
    default:{//erreur dans les paramètres GET
        echo json_encode("Errreur d'argument !");
    }
}?>
