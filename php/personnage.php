<?php
include("../donnees/data.php");

function statPerso($pdo, $id_joueur){
    $joueur=$pdo->query("SELECT * FROM personnage WHERE id_personnage = $id_joueur")->fetch();
    echo json_encode($joueur) ;
}

function creerPerso($pdo){
    // echo isset($pdo);
    $classe = $_GET["classe"];
    $nom = $_GET["nom"];
    
    switch($classe){
        case "crs":
            $pdo->exec("insert into personnage (nom, pV, pM, pA, pO, classe, esquive, defMagique, defPhysique, vitesse, image, niveau)
            values ('$nom', 500, 10, 30, 10, 'crs', 20, 30, 40, 10, 'img/crs.jpg', 1)");
        break;
        case "gilet_jaune":
            $pdo->exec("insert into personnage (nom, pV, pM, pA, pO, classe, esquive, defMagique, defPhysique, vitesse, image, niveau)
            values ('$nom', 100, 20, 100, 10, 'gilet jaune de combat', 50, 5, 15, 60, 'img/gilet_jaune.jpg', 1)");
        break;
        case "militant":
            $pdo->exec("insert into personnage (nom, pV, pM, pA, pO, classe, esquive, defMagique, defPhysique, vitesse, image, niveau)
            values ('$nom', 70, 120, 10, 10, 'militant antifa', 70, 10, 5, 90, 'img/militant.jpg', 1)");
        break;
        case "chef_kebabier":
            $pdo->exec("insert into personnage (nom, pV, pM, pA, pO, classe, esquive, defMagique, defPhysique, vitesse, image, niveau)
            values ('$nom', 200, 60, 60, 10, 'chef kebabier', 20, 20, 20, 45, 'img/kebabier.jpg', 1)");
        break;
        default:
            echo json_encode("Erreur de l'argument classe lors de la création du personnage");
        break;
        }
    echo json_encode($pdo->query("select MAX(id_personnage) from personnage")->fetch());
}


switch($_GET["fonction"]){

    case("creerPerso"):
        creerPerso($pdo);
    break;

    case("afficherInfos"):
        $id_perso = $_GET["id_perso"];
        statPerso($pdo, $id_perso);
    break;

    default:
        echo json_encode("erreur d'arguments");
    break;
}

?>