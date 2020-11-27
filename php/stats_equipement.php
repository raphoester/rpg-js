
                                          
<?php $sth = $dbh->prepare("SELECT * FROM equipement WHERE id_personnage= ".$_GET['id']);
$sth->execute();

$result = $sth->fetchAll();
json_encode($result) ;

?>