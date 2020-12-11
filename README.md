EXPLICATION DU CODE :

n'ayant pas trouvé comment utiliser un return propre sur un appel AJAX, j'ai été dans l'incapacité de coder quelque chose de propre. En effet, après chaque appel, le seul moyen de récupérer les données est d'appeler une autre fonction à la suite, ce qui limite très largement la modularité de la programmation. Les fonctions ne peuvent pas être séparées les unes des autres et doivent forcément s'enchaîner. 

Pour pallier ce problème, j'ai essayer de faire persister les données récupérées en AJAX dans le texte HTML, dans une section appelée "poubelle de variable". L'idée était de les conserver dans un champ en display:none pour pouvoir y accéder à tout moment. Je n'ai pas réussi à pousser cette technique assez loin pour que ce soit complètement fonctionnel. Le problème que j'ai rencontré est que la lecture de la poubelle bloquait l'exécution du code par exemple.
 
De ce fait, le jeu n'est pas complètement terminé. Les fonctionnalités ne sont pas toutes présentes, mais l'idée générale est là. 

Avec plus de temps (et d'aide, se référer à la répartition des commits), j'aurais intégré un système pour accéder depuis l'écran d'accueil à des parties précédemment sauvegardées. J'aurais aussi équilibré le jeu de façon à offrir plus de choix au joueur et mieux doser la force des monstres. 

Toutefois, je m'interroge grandement sur l'intérêt du Jquery dans un projet comme celui-ci. C'était en fait plus un obstacle qu'autre chose.

Merci de votre correction et de vos cours

Bonne journée
Raphaël Oester





--- Énoncé ---



Évaluation de JavaScript :

Cette évaluation est à réaliser en équipe de 5. Vous me donnerez les équipes au début du cours.

Vous devrez réaliser un mini RPG simple. Toutes les notions vues en cours sont attendues.



Présentation de la page :

En haut à gauche vous afficherez un encadré indiquant le nom du personnage ses points de vie ses points de magie et son or.
En cliquant sur le nom du personnage, un encadré apparaît au milieu de la page présentant les caractéristiques de ce personnage 
(sa classe, ses points de vie, ses points de magie, son attaque, sa défense, sa magie, sa défense magique, son esquive et sa vitesse). 
Cet encadré aura également une croix pour le fermer et revenir sur l’affichage principale. 

A droite de l’écran vous afficherez une liste d’option améliorer l’arme, la protection, la magie, restaurer les pv et mp (et autres si vous souhaitez).

En bas de l’écran un encadré présente l’historique des actions réalisées par le personnage et par l’adversaire. 
En dessous, une liste des actions réalisables par le joueur (attaquer, défendre, utiliser un sort, fuir)

Au centre de la page, vous pourrez afficher une image de l’adversaire ou autre.

Lorsqu’un joueur démarre, il a la possibilité de choisir sa classe (une guerrière, une magique, une stratégique, … (je vous laisse être inventif)). Chaque classe a des caractéristiques différentes. 
L’adversaire clique sur un bouton attaquer pour lancer un combat. 
Un adversaire se présente (les adversaires peuvent aussi avoir des classes différentes et des caractéristiques différentes). 
Vous ferez en sorte que les caractéristiques des adversaires soient toujours assez proches de celles du personnage (différence de 10% en supérieur ou inférieur par exemple). 

Le personnage le plus rapide commence à attaquer. Et le combat se déroule de façon classique. 
A chaque dégâts, la barre de vie diminue et à l’utilisation des sorts, la barre de magie diminue. Arrivé à 0 en points de vie, le personnage a perdu.

A la victoire contre ennemi, le personnage gagne de l’or qu’il peut dépenser pour augmenter ses caractéristiques ou se soigner. A chaque achat d’augmentation de caractéristiques, le prix augmente.

Les données du personnage seront sauvegardées soit sur le localstorage, soit sur un csv.

J'attends un code clair et commenté (points prévus sur cette partie)

Le rendu se fera avant vendredi 4 décembre minuit. Vous mettrez votre projet sur un repo et vous m’enverrez le lien par mail: alexandre.gaillot@ynov.com (si ça ne passe pas: contact@steptosuccess.fr)