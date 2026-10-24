---
name: doctrine-ux
description: Doctrine UX/UI générique — principes et leur ordre, quatre espaces (usage, réglages, administration, exploitation), texte minimal, complexité progressive, une fonction un chemin, navigation, zone compte, pied, icônes, responsive, états, formulaires, retours d'action, anti-patterns. À charger pour concevoir, modifier ou relire une interface, et par les agents conformite-design-system et revue-epure. Le design system du projet prévaut sur ces règles.
---

# Doctrine UX

Doctrine par défaut. Le design system et la doctrine du projet, nommés par le
profil, **prévalent** ; ces règles comblent ce qu'ils ne disent pas. Détail des
formulaires, états, retours et anti-patterns :
[formulaires-etats-anti-patterns.md](formulaires-etats-anti-patterns.md).

## 1. Principes, dans l'ordre où ils tranchent

1. **Le parcours d'abord** : l'écran montre ce qui sert cette personne,
   maintenant — action, information utile, résultat, navigation évidente.
2. **La personne reste chez son application** : se connecter, obtenir de
   l'aide, signaler un problème sont des capacités de l'application, sous sa
   marque, pas des visites d'outils techniques nommés.
3. **Vrai, et dit en mots** : un libellé dit ce que fait le geste ; une
   absence dit son motif ; aucun code technique n'est la seule explication.
4. **Un mot, une chose** : un concept transverse porte le même nom partout
   (lexique).
5. **Retirer avant d'ajouter** : supprimer → simplifier → déplacer →
   convention existante → composant du design system → création.

La simplification ne retire **jamais** : libellé accessible, clavier,
contraste, focus visible, alternative textuelle, compréhension sans couleur.
Elle n'uniformise ni l'identité, ni la densité légitime d'un outil, ni le
métier.

## 2. Hiérarchie et espaces

| Type d'écran | Ordre |
|---|---|
| Usage | ce que la personne vient chercher → le résultat → ce qui change sa décision → le reste, replié |
| Outil interne | **état → action → problème → détails techniques** |

Chaque écran appartient à **un** espace :

| Espace | Pour qui | Ne contient jamais |
|---|---|---|
| Usage | qui utilise l'application | tâches planifiées, provenance technique, empreintes, commandes, variables, identifiants de permission |
| Réglages | la même personne, pour elle-même | la gestion d'autres personnes |
| Administration | qui gère personnes, catalogue, droits | la santé de l'installation |
| Exploitation | qui fait tourner le produit | — (densité légitime) |

Une interface publique ne ressemble pas à une console. L'administration a sa
propre navigation et n'ajoute rien à celle de l'usage.

## 3. Texte

- Un écran d'usage porte **au plus une phrase** d'orientation, et seulement si
  ses libellés ne suffisent pas.
- Plus long, par ordre de préférence : le libellé lui-même → une aide de champ
  → une infobulle → une section repliée « Comment ça marche » → la
  documentation.
- Jamais à l'écran d'usage : nom d'un composant interne comme cause, commande,
  variable d'environnement, chemin de documentation, valeur d'énumération
  brute, jargon d'implémentation (« ingestion »).
- ✓ Retirer les paragraphes d'un écran d'usage ne retire aucune capacité.

## 4. Complexité progressive

- Premier regard : l'objet, son état, l'action principale. Options avancées,
  réglages fins et provenance s'ouvrent à la demande (« Détails », « D'où vient
  cette information »).
- Une fonction n'est montrée qu'à qui peut s'en servir ; une action impossible
  est **absente** (pas grisée) et, si son absence surprend, expliquée.
- Au plus **trois** filtres visibles ; les autres derrière « Plus de filtres »,
  les critères actifs en puces.

## 5. Une fonction, un chemin

- Une fonction a **un** chemin principal. Un second accès (raccourci depuis
  l'objet) mène au **même** écran, jamais à un second formulaire.
- Un geste métier = un formulaire ; une donnée = un espace de travail.
- Le fil d'Ariane emploie le mot de l'entrée de navigation qu'il désigne.
- ✓ Lister les points d'entrée de chaque fonction : plus d'un sans
  justification = écart.

**Recherche et filtres de consultation** : actualisation dans la page pendant
la saisie quand le coût le permet ; saisie temporisée, réponses dépassées
ignorées, chargement, vide et erreur annoncés, focus, clavier et URL
préservés ; formulaire utilisable sans JavaScript. Aucune écriture pendant la
saisie ; une validation engageante reste explicite.

## 6. Navigation

- La navigation principale nomme les **objets du métier**, rien d'autre ; au
  delà de sept entrées dans un groupe, regrouper.
- **Pas de menu global** fourre-tout ni de menu listant d'autres produits ; un
  lien vers un produit lié n'existe que là où il sert la tâche, et mène à
  l'objet.
- Navigation secondaire : celle de l'objet courant, jamais une seconde barre
  globale.
- Tout écran secondaire offre un retour vers son parent.
- Tout choix qui change la vue (filtre, période, sélection, position) est dans
  l'adresse ; recharger restitue la vue.
- La navigation interne n'ouvre pas de nouvel onglet ; même regroupement à
  toutes les largeurs.

## 7. En-tête, zone compte, pied

- **En-tête** : identité de l'application servie → navigation principale →
  outil central si la recherche **est** l'usage → zone compte, toujours à la
  fin. Pas de liens vers d'autres produits, de version, de documentation ni de
  mentions légales. Test et Local peuvent se signaler ; la production ne se
  signale pas.
- **Zone compte** : non connecté → « Se connecter » (ou un avatar qui l'ouvre) ;
  connecté → nom, puis espaces accordés (un par espace, jamais par
  permission), « Mon compte », « Aide », « Se déconnecter », dans cet ordre.
  Administration et exploitation n'existent que pour qui y a droit. La
  déconnexion reste à deux gestes sur téléphone. Un refus d'accès pour le
  compte actif propose « Changer de compte ».
- **Pied** : quatre zones au plus — identification, assistance (« Aide »),
  mentions si nécessaires, version (lien vers une page dédiée sur un produit
  public ; mention discrète en espace connecté ou outil interne). Pas de liste
  de produits, de navigation répétée, de texte explicatif.
- **Une seule porte d'assistance** : « Aide ». Ni « Contact », ni « Feedback »,
  ni « Support » à côté. « Signaler un problème » l'accompagne si le
  signalement contextuel existe ; pas de capture jointe sur les écrans
  sensibles. L'adresse vient de la configuration, jamais du gabarit.

## 8. Icônes

- Icône seule seulement pour un sens universel dans le contexte (fermer,
  rechercher, retour, plus d'actions, zoom, copier) ; elle porte un nom
  accessible et une infobulle.
- Une action ambiguë, destructive ou rare garde son libellé.
- Deux entrées ne partagent pas une icône ; une icône ne porte jamais seule un
  état.
- Un seul jeu, un seul tracé ; une icône à côté d'un libellé est décorative
  (`aria-hidden`). La cible tactile se tient par le bouton.

## 9. Responsive et accessibilité

- Sur téléphone, l'ordre suit l'usage : ce qu'on vient chercher est dans le
  premier écran. Le mobile n'est pas une réduction mécanique du bureau.
- Cibles de 44 px, rien d'essentiel au survol, action principale visible
  au-dessus du clavier.
- Liste → cartes étiquetées ; dialogue → feuille en bas ; filtres → repliés
  avec puces ; un outil interne garde ses colonnes et défile dans son cadre.
- Vérifier à 375, 768, 1024 et 1440 px (et grand écran si le produit s'y
  affiche). WCAG 2.2 AA, zoom 200 %, réduction de mouvement.

## 10. Marque et structure commune

- Ce qui varie par marque : logo, nom, couleurs, typographie, ton. Ce qui ne
  varie pas : ordre de l'en-tête, menu de compte, zones du pied, anatomie des
  états et des champs, lexique, clavier.
- Un composant structurel ne contient aucun nom de marque ni couleur en dur ;
  l'identité passe par le thème, jamais par la surcharge d'un composant.
- Un bloc commun **remplace** sa variante locale ; les copies vendorisées ne
  se modifient pas ; ce qui reste local se déclare.
- Une particularité métier d'un produit ne devient pas un pattern commun parce
  qu'elle existe.
