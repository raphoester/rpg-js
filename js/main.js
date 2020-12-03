
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
            Partie(joueur);
        }
    });
})



function chargerJoueur(index_joueur){
    $.ajax({
        url:"php/personnage.php?fonction=afficherInfos",
        data: "id_perso="+index_joueur, 
        dataType:"json",
        success:function(reponse){
            return reponse;
        }
    })
    return null;
}

//Gestion du jeu dans une boucle.
function Partie(joueur){
    var boutique = nouvelleBoutique(); 
    while (partieEnCours == true){
        partieEnCours = boutique(joueur, boutique);
        partieEnCours = combat(joueur);
    }
}

function nouvelleBoutique(){
    $.ajax({
        url:"php/boutique.php?fonction=nvBoutique",
        dataType: "json",
        success:function(reponse){
            return reponse;
        }
    })
}

function boutique(joueur, boutique){
    interface_boutique();
}

function combat(monstre, joueur){
    interface_combat();
    var combatEnCours = true;

    let tourDuJoueur = true;
    if(monstre.vitesse > joueur.vitesse){
        tourDuJoueur = false;
    }

    //boucle de combat : une entité joue par boucle
    while (combatEnCours)
    {
        if(tourDuJoueur = true)
        {
            // le joueur joue
            interface_combat_joueur(monstre, joueur);
            tourDuJoueur = false;
        }
        else{
            //le monstre joue
            interface_combat_monstre();
            tourDuJoueur=true;
        }
    }
}



function joueurAttaque(monstre, joueur){
    if (monstre.defPhys < joueur.pA){
        monstre.pdV -= (joueur.pdA - monstre.defPhy);
        $("#message").val("Le joueur inflige " + joueur.pM - monstre.defMag + "dégâts physiques.");
    }
    if (monstre.defMag < joueur.pM){
        monstre.pdV -= (joueur.pM - monstre.defMag);
        $("#message").val("Le joueur inflige " + joueur.pM - monstre.defMag + "dégâts magiques.");
    }
    return monstre;
}

function monstreAttaque(monstre, joueur){
    //il se fait casser la gueule
    return joueur;
}

function interface_boutique(){

}

function interface_combat(){

}

function interface_combat_joueur(monstre, joueur){
    $("").click(attaquer(monstre, joueur))
}

function interface_combat_monstre(){

}