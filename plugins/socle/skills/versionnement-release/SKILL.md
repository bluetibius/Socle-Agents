---
name: versionnement-release
description: Versionnement SemVer et cycle de release — choisir le rang, numéro de développement, notes de version, séquence gate → main → tag → push → test, états de preuve distincts. À charger à l'ouverture d'un chantier qui changera la version d'un produit, et avant toute décision de release, tout tag ou toute note de version.
---

# Versionnement et release

## Choisir le rang

| Rang | Sens |
|---|---|
| X.0.0 | rupture technique, de contrat public, ou d'interface majeure |
| X.Y.0 | capacité nouvelle rétrocompatible |
| X.Y.Z | correctif, sécurisation, amélioration d'un parcours ou refonte interne sans capacité nouvelle |

Question : « Peut-on faire quelque chose qu'on ne pouvait pas faire avant ? »
Pour un contrat ou une bibliothèque : « un consommateur dispose-t-il d'une
capacité nouvelle ? ». Une suppression incompatible impose le majeur, même
petite. Comparer les versions avec un comparateur sémantique (`0.10.0 > 0.9.0`).

Le rang se choisit **à l'ouverture**, puis se confronte au périmètre final.
Les séries existantes ne sont pas renumérotées.

## Pendant le chantier

1. Lire l'existant, la mémoire et la roadmap ; choisir la cible.
2. Une **source unique** du numéro dans le dépôt ; les autres projections sont
   générées ou contrôlées.
3. Numéro de développement `X.Y.Z-dev.AAAAMMJJHHMMSS`, horodaté à l'ouverture
   réelle de la branche (reflog de création, sinon premier commit), fuseau
   consigné. Traces absentes : déclarer la réserve plutôt qu'inventer.
4. Notes de destination préparées sans suffixe.

## Release

Une gate verte ne retire pas le suffixe : la release est une **décision**
distincte.

1. Finaliser les notes (nouveautés, corrections, ruptures, opérations
   nécessaires) ; retirer le suffixe dans le commit stable ; contrôler les
   projections.
2. Pousser le candidat ; gate sur son commit exact.
3. Fusion en fast-forward sur la branche publiée ; tag annoté `vX.Y.Z` sur ce
   commit ; pousser branche et tag. Divergence : réconcilier puis requalifier.
4. Livrer en test par le parcours du produit et qualifier (version et commit
   servis égaux au tag, santé, smoke).
5. Production : selon la skill `production-gardee`.

Un tag publié est **immuable** : un échec se reprend avec ce code ou par une
nouvelle version. Une publication Git ne prouve jamais une livraison.

## Notes de version

Une note par tag, qui correspond exactement à sa version. Pas de second
historique tenu à la main : `CHANGELOG.md` ou ce que le dépôt déclare.

## Preuves

La qualification cite séparément, avec date et preuve : cible en
développement, commit qualifié, publication Git, version servie en test,
version servie en production (ou distribuée). Un état non observé reste
« non observé ».
