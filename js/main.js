
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
            console.log(index_joueur);
        }
    });
})

// partieEnCours = true;

// function jouer(){
//     while (partieEnCours){
//         combatEnCours = true;
//         while (combatEnCours)
//         {
//             //combat... un tour de boucle par tour de jeu
//             //le joueur attaque 
//             //le monstre attaque
    
//         }
//     }
// }
