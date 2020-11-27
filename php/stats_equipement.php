<?php

$result = $pdo->query("SELECT * FROM equipement WHERE id_personnage= ".$_GET['id']);
								while($equipement = $result->fetch(PDO::FETCH_OBJ)) { ?>

                                    <div>
                                        <h3><?php echo $equipement["vitesse"];?></h3>
                                        <h3><?php echo $equipement["vitesse"];?></h3>
                                        <h3><?php echo $equipement["vitesse"];?></h3>
                                        <h3><?php echo $equipement["vitesse"];?></h3>
                                        <h3><?php echo $equipement["vitesse"];?></h3>
                                        <h3><?php echo $equipement["vitesse"];?></h3>
                                        <h3><?php echo $equipement["vitesse"];?></h3>
                                        <h3><?php echo $equipement["vitesse"];?></h3>
                                        <h3><?php echo $equipement["vitesse"];?></h3>
														
									</div>
                                    
                                    
                                <?php }?>

