# Formulaires, états, retours d'action, anti-patterns

## Formulaires

- **Libellé** toujours visible, au-dessus du contrôle, jamais remplacé par un
  exemple. « (facultatif) » marque l'exception ; l'obligatoire ne se marque
  pas.
- **Aide** : une phrase au plus, entre libellé et contrôle, reliée par
  `aria-describedby`.
- **Erreur** au champ, sous le contrôle, en mots, avec l'exemple utile ; jamais
  seulement en tête de page ni par la couleur. La saisie est conservée.
- **Validation** à l'envoi, puis au champ dès qu'il est corrigé ; pas de
  reproche pendant la frappe. Le serveur revalide toujours.
- **Boutons** : une action principale, nommée par son verbe ; « Annuler » en
  second, sans aplat. Pendant l'envoi, le bouton le dit et ne s'envoie pas deux
  fois.
- **Action destructive** : bordée, à l'écart de l'action principale, son
  libellé nomme l'objet (« Supprimer le client »).
- **Confirmation** seulement pour l'irréversible ou le coûteux : titre qui
  nomme l'objet, texte qui dit la conséquence, bouton qui nomme l'acte, focus
  sur « Annuler ». Un geste réversible ne se confirme pas : il s'annule
  (« Archivé · Restaurer »).
- **Formulaire long** : le choix qui décide des champs vient d'abord.
- ✓ Envoyer le formulaire vide : chaque champ fautif porte son erreur, la
  saisie est intacte, le focus est au premier champ fautif.

## États de l'interface

Une anatomie : icône, titre, une phrase, une action.

| État | Règle |
|---|---|
| Vide | « Aucune donnée » propose de créer ; « Aucun résultat » de réinitialiser |
| Chargement | porte un texte ; squelette si la forme est connue |
| Erreur | à sa portée ; cause en mots, conséquence, geste ; référence repliée ; « Aide » à côté |
| Succès | page seulement si l'issue a sa page ; sinon toast ou bannière |
| Indisponible | sur la fonction touchée, pas toute la page ; dit ce qui marche encore et la date de la dernière donnée |
| Accès refusé | nomme le compte reconnu et le geste qui ouvrirait l'accès ; ne renvoie pas à la connexion une personne connectée |

Un état ne se reconnaît jamais à sa seule couleur.

## Retours d'action : un canal par conséquence

| Canal | Quand |
|---|---|
| Au champ | erreur ou état d'un champ, d'une section |
| Toast | action ordinaire réussie, rien à relire |
| Bannière | résultat ou avertissement qui doit rester visible |
| Dialogue | décision bloquante, erreur qui empêche, résultat détaillé |
| Page | issue qui change ce qu'on peut faire, ou résultat adressable |

Une seule région vivante polie par écran. La déconnexion a aussi un retour.

## Dialogues

- `alert()`, `confirm()`, `prompt()` ne sont jamais un mécanisme d'interface :
  `<dialog>` ouvert par `showModal()`.
- Focus initial défini, piégé, restitué au déclencheur ; Échap ferme sauf
  pendant l'envoi ; fond inerte ; `alertdialog` pour le destructif.
- Pas de modale pour : long formulaire, contenu partageable par adresse,
  information sans décision, fiche consultée en manipulant une carte.

## Pages système

Un navigateur reçoit toujours du HTML : jamais la page par défaut d'un
framework, jamais le JSON d'une API. Erreur, maintenance, session expirée et
accès refusé ont leur page, en mots, avec « Aide ».

## Contraintes techniques

- Pas de style ni de script en ligne (politique CSP stricte) ; aucune couleur
  écrite dans une page : classes et jetons.
- Pas d'invention de classe du design system ; pas de redéfinition locale d'un
  bloc commun.

## Anti-patterns

| Anti-pattern | À la place |
|---|---|
| Menu global « Menu » qui double la navigation | navigation par objets ; lien contextuel vers l'objet lié |
| Paragraphe « comment fonctionne cet écran » | libellés clairs, aide repliée |
| Tableau de diagnostic sur l'écran d'usage | espace Exploitation |
| Deux menus pour la même fonction | un chemin principal |
| « Continuer avec <service d'identité> » | « Se connecter » |
| Entrée « Admin » visible pour tous, grisée | absente sans droit |
| Icône seule pour un geste ambigu | icône + libellé |
| `alert()` / `confirm()` | `dialog` |
| Version et commit au pied d'une vitrine publique | lien « Version » vers une page dédiée |
| Pied qui liste tous les produits | quatre zones au plus |
| Pied, menu de compte ou état écrit à la main | les blocs communs |
| « Contact », « Feedback », « Support » et « Aide » ensemble | « Aide » |
| Écran public qui ressemble à une console | espace d'administration ou d'exploitation |
| Badge « Production » permanent | seuls Test et Local se signalent |
| Variable de configuration affichée quand elle manque | « … n'est pas configuré » + « Aide » ; la variable au journal |
| « Échec de l'import (503) » | « … pas disponible pour le moment » + fraîcheur + « Aide » |
