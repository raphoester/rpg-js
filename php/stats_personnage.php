<?php
include("../donnees/data.php");
 $sth = $pdo->query("SELECT * FROM personnage WHERE id_personnage= 1 ");
 

$result = $sth->fetchAll(PDO::FETCH_OBJ);

echo json_encode($result) ;

?>