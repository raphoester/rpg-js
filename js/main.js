
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
            return joueur;    
        }
    })
    return null;
}


function Partie(joueur){
    while (partieEnCours == true){
        partieEnCours = boutique(joueur);
        partieEnCours = combat(joueur);
    }
}


function boutique(joueur){

}

function combat(monstre, joueur){
    while (partieEnCours){
        combatEnCours = true;
        while (combatEnCours)
        {
            //combat... un tour de boucle par tour de jeu
            //le joueur attaque 
            //le monstre attaque
            
        }
    }
}
