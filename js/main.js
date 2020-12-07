$("h1").css({color:'blue'});



$("#btn_valider").click(function(e){
    e.preventDefault();
    const classe = $("input[name=classe]:checked", "#form_init").val();
    const nom = $('input[name=nom]', '#form_init').val();
 
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

    interface_combat();
    if(monstre["vitesse"] > joueur["vitesse"]){
        tourDuJoueur = false;
    }

    $("#id_attaquer").click(function(e){
        
        interface_combat_joueur(monstre, joueur);
        monstre = joueurAttaque(monstre, joueur);

        interface_combat_monstre();
        joueur = monstreAttaque(monstre, joueur);
        
        if(monstre["pV"]<=0)
        {
            console.log("Le monstre est mort !");
            $("#id_attaquer").unbind("click");
            nouvelleBoutique(joueur)
        }
        else if(joueur["pV"]<=0){
            $("#id_attaquer").unbind("click");
            defaite();
            return;
        }
    });
}


function joueurAttaque(monstre, joueur){
    let coupPorte = false;

    if (monstre["defPhys"] < joueur["pA"]){

        monstre["pV"] -= (joueur["pA"] - monstre["defPhys"]);
        
        console.log("Le joueur inflige " + (joueur["pA"] - monstre["defPhys"] )+ " dégâts physiques.");
        coupPorte = true;
    }

    if (monstre["defMag"] < joueur["pM"]){
        monstre["pV"] -= (joueur["pM"] - monstre["defMag"]);

        console.log("Le joueur inflige " + (joueur["pM"] - monstre["defMag"] )+ " dégâts magiques.");
        coupPorte = true;
    }
    if (coupPorte == false){
        $("#message").val("Aucun dégât n'a été infligé au monstre.");
    }
    actualise_monstre(monstre)
    return monstre;
}

function monstreAttaque(monstre, joueur){
    
    let coupPorte = false;
    if (monstre["defPhys"] < joueur["pA"]){
        monstre.pdV -= (joueur["pdA"] - monstre["defPhy"]);
        // $("#message").val("Le joueur inflige " + joueur["pM"] - monstre["defMag"] + "dégâts physiques.");
        console.log("Le monstre inflige " + (joueur["pA"] - monstre["defPhys"]) + " dégâts physiques.");
        coupPorte = true;
    }
    if (joueur.defMag < monstre.pM){
        joueur.pdV -= (monstre.pM - joueur.defMag);
        // $("#message").val("Le monstre inflige " + (monstre["pM"] - joueur["defMag"]) + " dégâts magiques.");
        console.log("Le monstre inflige " + (monstre["pM"] - joueur["defMag"]) + " dégâts magiques.");
        coupPorte = true;
    }
    if (coupPorte == false){
        $("#message").val("Aucun dégât n'a été infligé au joueur.");
    }
    actualise_joueur(joueur);
    return joueur;
}

function interface_combat(monstre){
    $(".boutique").css({display:"none"});
    $(".combat").css({display:"initial"});
    $(".actions_combat").css({display:"initial"});
    $(".histo1").css({display:"initial"});
}

function actualise_monstre(monstre)
{}
function interface_combat_joueur(monstre, joueur){
    // $("").click(attaquer(monstre, joueur))
}

function interface_combat_monstre(){

}


function defaite(){

}


function nouvelleBoutique(joueur){
    
    $.ajax({
        url:"php/boutique.php?fonction=nvBoutique",
        dataType: "json",
        success:function(reponse){
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
    $("#btn_combat").click(function(){
        nouveauMonstre(joueur);
    })

}

function actualise_joueur(joueur){
    
}