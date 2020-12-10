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
            var joueur = chargerJoueur(index_joueur);
        }
    });

    
})

// class joueur{
//     constructor (nom, defMag, defPhys, esquive, vitesse, pA, pO, pM, pV, niveau){
//         this.
//     }
// }


function chargerJoueur(index_joueur){
    $.ajax({
        url:"php/personnage.php?fonction=afficherInfos",
        data: "id_perso="+index_joueur, 
        dataType:"json",
        success:function(reponse){
            // console.log(reponse);
            $("#img_joueur").attr("src", reponse["image"]);
            reponse["defMagique"]=parseInt(reponse["defMagique"]);
            reponse["defPhysique"]=parseInt(reponse["defPhysique"]);
            reponse["esquive"]=parseInt(reponse["esquive"]);
            reponse["vitesse"]=parseInt(reponse["vitesse"]);
            reponse["pA"]=parseInt(reponse["pA"]);
            reponse["pO"]=parseInt(reponse["pO"]);
            reponse["pM"]=parseInt(reponse["pM"]);
            reponse["pV"]=parseInt(reponse["pV"]);
            reponse["niveau"]=parseInt(reponse["niveau"]);
            
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

        if(monstre["pV"]<=0)
        {
            document.getElementById('contenu_histo').innerHTML += '<p class = "element_histo">' + monstre["nom"] +"est mort.</p>";
            $("#id_attaquer").unbind("click");
            nouvelleBoutique(joueur);
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
        
        $("#message").val();
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
    document.getElementById("id_Pv").innerHTML = (joueur["pV"]);
    document.getElementById("id_Pm").innerHTML = (joueur["pM"]);
    document.getElementById("id_Or").innerHTML = (joueur["pO"]);

    
}

function afficher_btk(boutique, perso){
    $("#contenu_boutique").val("");
    var i = 1;
    boutique.forEach(element => {
        charger_objet(element, i)     
        i+=1;
    });
    
    console.log("creation des cliqueurs");
    $("#acheter_1").click(function(){
        console.log('click1');
        acheter(boutique[0], perso);
    })   

    $("#acheter_2").click(function(){
        console.log('click2');
        acheter(boutique[1], perso);
    })

    $("#acheter_3").click(function(){
        console.log('click3');
        acheter(boutique[2], perso);
    })
}


function acheter(objet, perso){
    if(objet["prix"] <= perso["pO"]){
        $.ajax({
            url:"php/boutique.php?fonction=acheter",
            data:{ id_equip: objet["id_equipement"], id_perso: perso["id_personnage"]},
            success:function(rafraichir_inventaire){
                
            }
        })
    }
    else{
        alert("Vous n'avez pas assez d'or !");
    }
}

function charger_objet(equipement, i){
    console.log(i);
    document.getElementById("contenu_boutique").innerHTML += ('<TD><div class="equipement"><p>' + equipement["nom"] + '</p><p><i class="fas fa-heart"></i>:<strong>' + equipement["pV"] +'</strong></p><p><i class="fas fa-hat-wizard"></i> :<strong>' + equipement["pM"] +'</strong></p><p><i class="ri-sword-line"></i> :<strong>' + equipement["pA"] +'</strong></p><p><i class="fas fa-wind"></i> : <strong>' + equipement["esquive"] +'</strong></p><p><i class="ri-magic-line"></i> :<strong>' + equipement["defMagique"] +'</strong></p><p><i class="ri-shield-line"></i> :<strong>' + equipement["defPhysique"] +'</strong></p><p><i class="ri-speed-line"></i> :<strong>' + equipement["vitesse"] +'</strong></p><p><i class="fas fa-coins"></i> :<strong>' + equipement["prix"] +'</strong></p></div><button id="acheter_'+i+'">Acheter</button></TD>');
}
