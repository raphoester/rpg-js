<?php
include("../donnees/data.php");

function creerMonstre($pdo){
    $niveau = $_GET['niveau'];
    $tableau_monstres = $pdo->query('select * from monstre')->fetchAll();
    
    // var_dump ($tableau_monstres);
    $rand = rand(0, count($tableau_monstres)-1);
    // echo $rand;
    $nom = $tableau_monstres[$rand]["nom"];
    $image = $tableau_monstres[$rand]["image"];
    $id_monstre = $tableau_monstres[$rand]["id_monstre"];

    $force = rand(0,10);

    $monstre=[];
    $monstre["id"]=$id_monstre;
    $monstre["image"]=$image;
    $monstre["nom"]=$nom;
    $monstre["pV"]=($niveau*100)+(5*$force);
    $monstre["pM"]=($niveau*5)+($force);
    $monstre["pA"]=($niveau*6)+(2*$force);
    $monstre["esquive"]=($niveau*4)+($force);
    $monstre["vitesse"]=($niveau*3)+($force);
    $monstre["defPhys"]=($niveau*2)+(0.7*$force);
    $monstre["defMag"]=($niveau*2)+(0.5*$force);
    // var_dump($monstre);


    echo json_encode($monstre);
}


switch($_GET["fonction"]){

    case("creerMonstre"):
        creerMonstre($pdo);
    break;
    default:
        echo json_encode("erreur d'arguments");
    break;
}

?>