$("h1").css({color:'blue'});



$("#btn_valider").unbind("click").click(function(e){
    e.preventDefault();
    const classe = $("input[name=classe]:checked", "#form_init").val();
    const nom = $('input[name=nom]', '#form_init').val();
    $(".choix").css({display:"initial"});
 
    $.ajax({
        url:"php/personnage.php?fonction=creerPerso",
        data:{nom, classe},
        
        success:function(reponse){
            $("#popup_init").css({display:"none"})
            var index_joueur = (JSON.parse(reponse)[0]);
            lancerPartie(index_joueur);
        }
    });

    
})




function chargerJoueur(joueur){
    
    $("#img_joueur").attr("src", joueur["image"]);
    $.ajax({
        url:"php/personnage.php?fonction=afficherInfos",
        data: "id_perso="+joueur["id_personnage"], 
        dataType:"json",
        success:function(joueur){
            
            ecrirePoubelle(joueur);
        }  
    })   
}

function ecrirePoubelle(joueur){
    console.log("remplissage de la poubelle");
    $("#pv_joueur").text(joueur['pV']);
    $("#nom_joueur").text(joueur['nom']);
    $("#defMag_joueur").text(joueur['defMagique']);
    $("#defPhys_joueur").text(joueur['defPhysique']);
    $("#pA_joueur").text(joueur['pA']);
    $("#pM_joueur").text(joueur['pM']);
    $("#pO_joueur").text(joueur['pO']);
    $("#classe_joueur").text(joueur['classe']);
    $("#esquive_joueur").text(joueur['esquive']);
    $("#vitesse_joueur").text(joueur['vitesse']);

    $("#niveau_joueur").text(joueur['niveau']);

}


function lirePoubelle(){
    var joueur = [];
    joueur["pV"]=$("#pv_joueur").text();
    joueur["nom"]=$("#nom_joueur").text();
    joueur["defMag"]=$("#defMag_joueur").text();
    joueur["defPhys"]=$("#defPhys_joueur").text();
    joueur["pA"]=$("#pA_joueur").text();
    joueur["pM"]=$("#pM_joueur").text();
    joueur["pO"]=$("#pO_joueur").text();
    joueur["classe"]=$("#classe_joueur").text();
    joueur["esquive"]=$("#esquive_joueur").text();
    joueur["vitesse"]=$("#vitesse_joueur").text();
    // joueur["image"]=$("#image_joueur").text();
    joueur["niveau"]=$("#niveau_joueur").text();
    return joueur;
}

function lancerPartie(index_joueur){
    $.ajax({
        url:"php/personnage.php?fonction=afficherInfos",
        data: "id_perso="+index_joueur, 
        dataType:"json",
        success:function(reponse){
            
            chargerJoueur(reponse);
            actualise_joueur(reponse);
            nouvelleBoutique(reponse);
        }  
    })

}




function nouveauMonstre(joueur){
    var niveau = joueur["niveau"];
    console.log("nouveaumonstre");
    $.ajax({
        url:"php/combat.php?fonction=creerMonstre",
        data:{niveau},
        dataType:"json",
        success:function(reponse){
            
            reponse["defMag"]=parseInt(reponse["defMag"]);
            reponse["defPhys"]=parseInt(reponse["defPhys"]);
            reponse["esquive"]=parseInt(reponse["esquive"]);
            reponse["vitesse"]=parseInt(reponse["vitesse"]);
            reponse["pA"]=parseInt(reponse["pA"]);
            reponse["pM"]=parseInt(reponse["pM"]);
            reponse["pV"]=parseInt(reponse["pV"]);
            combat(reponse, joueur);
        }
    })
}



function combat(monstre, joueur){

    interface_combat(monstre);
    if(monstre["vitesse"] > joueur["vitesse"]){
        tourDuJoueur = false;
    }


    console.log(monstre);
    console.log(joueur);
    $("#id_attaquer").unbind("click").click(function(e){
        
        monstre = joueurAttaque(monstre, joueur);

        if(monstre["pV"] <=0)
        {
            document.getElementById('contenu_histo').innerHTML += '<p class = "element_histo" style:"font-size: 50px;">' + monstre["nom"] +" est mort !</p>";
            document.getElementById('contenu_histo').innerHTML += '<p class = "element_histo" > Vous gagnez 5 pièces d\'or et un niveau!</p>';
            ajouterPieces(5, joueur);
            ajouterNiveau(joueur);
            
            $("#id_attaquer").unbind("click").click(function()
                {
                    $("#id_attaquer").click(function(){
                        nouvelleBoutique(joueur);
                    })
                });
            // 
        }
        else{
            joueur = monstreAttaque(monstre, joueur);
        }

        if(joueur["pV"]<=0){
            $("#id_attaquer").unbind("click");
            defaite();
            return;
        }
    });
}


function joueurAttaque(monstre, joueur){
    let coupPorte = false;

    console.log(joueur["nom"] + " a " + joueur["pV"] + " points de vie.");
    console.log(monstre["nom"] + " a " + monstre["pV"] + " points de vie.");
    


    if (monstre["defPhys"] < joueur["pA"]){

        monstre["pV"] -= (joueur["pA"] - monstre["defPhys"]);
        
        coupPorte = true;
        document.getElementById('contenu_histo').innerHTML += '<p class = "element_histo">' + joueur["nom"] +" inflige " + (joueur["pA"] - monstre["defPhys"] ) + " dégâts physiques.</p>";
    }

    if (monstre["defMag"] < joueur["pM"]){
        monstre["pV"] -= (joueur["pM"] - monstre["defMag"]);

        document.getElementById('contenu_histo').innerHTML += '<p class = "element_histo">' + joueur["nom"] + " inflige " + (joueur["pM"] - monstre["defMag"]) + " dégâts magiques. </p>";
        coupPorte = true;
    }
    if (coupPorte == false){
        document.getElementById('contenu_histo').innerHTML += '<p class = "element_histo">' + "Aucun dégât n'a été infligé à "+monstre["nom"] +"</p>";
    }
    
    return monstre;
}

function monstreAttaque(monstre, joueur){
    
    let coupPorte = false;
    if (joueur["defPhysique"] < monstre["pA"]){
        joueur["pV"] -= (monstre["pA"] - joueur["defPhysique"]);
        document.getElementById("contenu_histo").innerHTML += ("<p class = 'element_histo'>"+monstre["nom"] +" inflige " + (monstre["pA"] - joueur["defPhysique"]) + " dégâts physiques.</p>");
        coupPorte = true;
    }
    if (joueur["defMagique"] < monstre["pM"]){
        joueur["pV"] -= (monstre["pM"] - joueur["defMagique"]);
        document.getElementById("contenu_histo").innerHTML += ("<p class = 'element_histo'>" + monstre["nom"] +" inflige " + (monstre["pM"] - joueur["defMagique"]) + " dégâts magiques.</p>");
        coupPorte = true;
    }
    if (coupPorte == false){
        document.getElementById("contenu_histo").innerHTML += ("<p class = 'element_histo'>"+ monstre["nom"] + " échoue son attaque.</p>");
    }
    return joueur;
}



function interface_combat(monstre){
    $(".img1").css({display:"flex"});
    $("#img_monstre").attr("src", monstre["image"]);
    $(".boutique").css({display:"none"});
    $(".combat").css({display:"initial"});
    $(".actions_combat").css({display:"initial"});
    $(".histo1").css({display:"initial"});
}

function actualise_monstre(monstre)
{}

function defaite(){

}


function nouvelleBoutique(joueur){
    
    $.ajax({
        url:"php/boutique.php?fonction=nvBoutique",
        dataType: "json",
        success:function(reponse){
            reponse.forEach(element => {
                element["id_equipement"]=parseInt(element["id_equipement"]);
                element["pV"]=parseInt(element["pV"]);
                element["pM"]=parseInt(element["pM"]);
                element["pA"]=parseInt(element["pA"]);
                element["esquive"]=parseInt(element["esquive"]);
                element["defMagique"]=parseInt(element["defMagique"]);
                element["defPhysique"]=parseInt(element["defPhysique"]);
                element["vitesse"]=parseInt(element["vitesse"]);
                element["rarete"]=parseInt(element["rarete"]);
                element["prix"]=parseInt(element["prix"]);

            });
            boutique(joueur, reponse);
        }
        // error:function(reponse)
    })
}

function boutique(joueur, boutique){
    // chargerJoueur(joueur);
    // joueur= lirePoubelle();
    $("#btn_combat").css({display:"initial"});
    $(".combat").css({display:'none'});
    $(".histo1").css({display:"none"});
    $(".actions_combat").css({display:"none"});
    $(".boutique").css({display:"initial"});
    $(".inventaire").css({display:"initial"});
    $("#btn_combat").css({color:"red"});

    //affichage des objets :
    afficher_btk(boutique, joueur);

    $("#btn_combat").unbind("click").click(function(){
        nouveauMonstre(joueur);
    })

}

function actualise_joueur(joueur){
    document.getElementById("id_Pv").innerHTML = joueur["pV"];
    document.getElementById("id_Pm").innerHTML = joueur["pM"];
    document.getElementById("id_Or").innerHTML = joueur["pO"];
    document.getElementById("id_nom").innerHTML = joueur["nom"];
}

function afficher_btk(boutique, perso){
    $("#contenu_boutique").text("");
    var i = 1;
    boutique.forEach(element => {
        charger_objet(element, i)     
        i+=1;
    });
    
    console.log("creation des cliqueurs");
    $("#acheter_1").unbind("click").click(function(){
        console.log('click1');
        setTimeout(()=>{acheter(boutique[0], perso);}, 10);
    })   

    $("#acheter_2").unbind("click").click(function(){
        console.log('click2');
        setTimeout(()=>{acheter(boutique[1], perso);}, 10);
        
    })

    $("#acheter_3").unbind("click").click(function(){
        console.log('click3');
        setTimeout(()=>{acheter(boutique[2], perso);}, 10);
    })
}


function acheter(objet, perso){
    if(objet["prix"] <= perso["pO"]){
        $.ajax({
            url:"php/boutique.php?fonction=acheter",
            data:{ id_equip: objet["id_equipement"], id_perso: perso["id_personnage"]},
            success:function(){
                rafraichir_inventaire(perso);
                chargerJoueur(perso);
            }
        })
        console.log("la poubelle est lue");
        joueur=lirePoubelle();
        actualise_joueur(joueur);
    }
    else{
        alert("Vous n'avez pas assez d'or !");
    }
}   

function charger_objet(equipement, i){
    console.log(i);
    document.getElementById("contenu_boutique").innerHTML += ('<TD><div class="equipement"><p>' + equipement["nom"] + '</p><p><i class="fas fa-heart"></i>:<strong>' + equipement["pV"] +'</strong></p><p><i class="fas fa-hat-wizard"></i> :<strong>' + equipement["pM"] +'</strong></p><p><i class="ri-sword-line"></i> :<strong>' + equipement["pA"] +'</strong></p><p><i class="fas fa-wind"></i> : <strong>' + equipement["esquive"] +'</strong></p><p><i class="ri-magic-line"></i> :<strong>' + equipement["defMagique"] +'</strong></p><p><i class="ri-shield-line"></i> :<strong>' + equipement["defPhysique"] +'</strong></p><p><i class="ri-speed-line"></i> :<strong>' + equipement["vitesse"] +'</strong></p><p><i class="fas fa-coins"></i> :<strong>' + equipement["prix"] +'</strong></p></div><button id="acheter_'+i+'">Acheter</button></TD>');
}

function rafraichir_inventaire(perso)
{
    emplacements = ["chapeau", "veste", "futal", "chaussures", "arme"];
    emplacements.forEach(element => {
        // console.log(element);
        $("#contenu_inventaire").text("");
        $.ajax({
            url:'php/stats_equipement.php?fonction=equipement_'+element,
            dataType:"json",
            data:{id_utilisateur:perso["id_personnage"]},
            success:function(reponse){
                if(reponse==false){
                    document.getElementById("contenu_inventaire").innerHTML += '<TD><div class="equipement"><h4>Veste :</h4><p><i class="fas fa-heart"></i> :</p><p><i class="fas fa-hat-wizard"></i> :</p><p><i class="ri-sword-line"></i> :</p><p><i class="fas fa-wind"></i> : </p><p><i class="ri-magic-line"></i> :</p><p><i class="ri-shield-line"></i> :</p><p><i class="ri-speed-line"></i> :</p><p><i class="far fa-gem"></i> :</p></div></TD>'
                }
                else{
                    document.getElementById("contenu_inventaire").innerHTML+= '<TD><div class="equipement"><p><i class="fas fa-heart"></i> : <strong>'+reponse["pV"]+'</strong></p><p><i class="fas fa-hat-wizard"></i> : <strong>'+reponse["pM"]+'</strong></p><p><i class="ri-sword-line"></i> : <strong>'+reponse["pA"]+'</strong></p><p><i class="fas fa-wind"></i> : <strong>'+reponse["esquive"]+'</strong> </p><p><i class="ri-magic-line"></i> : <strong>'+reponse["defMagique"]+'</strong></p><p><i class="ri-shield-line"></i> : <strong>'+reponse["defPhysique"]+'</strong></p><p><i class="ri-speed-line"></i> : <strong>'+reponse["vitesse"]+'</strong></p></div></TD>';
            
                }
            },
            error:function(reponse){
                console.log("affichage de l'objet échoué.");
            }
        })
        
    });

    
}


function ajouterPieces(){

}

function ajouterNiveau(){

}