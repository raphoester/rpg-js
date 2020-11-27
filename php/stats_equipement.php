
                                          
<?php
include("../donnees/data.php");
$sth = $pdo->query("SELECT * FROM equipement WHERE id_equipement = 1 ");
 

$result = $sth->fetchAll(PDO::FETCH_OBJ);

echo json_encode($result) ;

?>