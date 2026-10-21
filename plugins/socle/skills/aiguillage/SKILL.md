---
name: aiguillage
description: Décider, au début de toute demande de travail, quels rôles spécialisés sont pertinents et lesquels ne le sont pas — principe de proportion, signaux qui déclenchent un rôle, étapes obligatoires, parcours types, escalade en cours de route. À charger par la session principale avant de déléguer à un agent du socle, et dès qu'un travail change de nature en cours de route.
---

# Aiguillage

La session principale est l'orchestrateur : elle seule lance des agents (un
sous-agent ne peut pas en lancer d'autres). Cette skill lui dit **qui lancer, et
qui ne pas lancer**. Pour un cas ambigu, l'agent `aiguilleur` mesure le terrain
et rend un plan ; la session l'exécute.

## Proportion

- On part **du plus léger** : la session seule. Un rôle n'est ajouté que sur un
  **signal mesuré** dans le travail (fichiers, contrats, schéma, interface),
  jamais par principe ni parce qu'il existe.
- Chaque agent démarre sans contexte et coûte : un rôle qui n'apporte pas de
  livrable propre n'est pas lancé.
- Un rôle écarté est **nommé, avec sa raison**, dans le plan annoncé.

## Signaux → rôles

| Signal mesuré | Rôle |
|---|---|
| capacité nouvelle, besoin flou, plusieurs publics touchés | `analyste-metier` (puis décision du propriétaire) |
| contrat public, API, format partagé, plusieurs dépôts, choix difficile à défaire | `architecte` |
| écran créé ou modifié de façon visible | `concepteur-ux`, puis `conformite-design-system` |
| schéma, migration, import, index, données réelles | `gestionnaire-donnees` |
| authentification, droits, entrées externes, requêtes sortantes, secrets, collecte | `revue-securite` |
| déploiement, gate, tâche planifiée, supervision, sauvegarde, configuration serveur | `devops` |
| plus de quelques fichiers, ou ordre d'implémentation non évident | `analyste-technique` |
| comportement observable modifié | `testeur` (au minimum : un test de régression) |
| lanes parallèles d'une mission | `developpeur`, une instance par lane |
| fonctionnalité nouvelle ou donnée qui évolue | `auditeur-autonomie` avant « terminé » |
| résultat déclaré par un autre agent ou une lane | `reviewer-refutation` |
| incident en cours | `diagnostic-incident`, puis nouvel aiguillage pour le correctif |
| release décidée | `release`, puis `preparateur-prod` si une production suit |
| fin de chantier, mémoire désignée par le profil | `gardien-memoire` |

## Toujours, quelle que soit la taille

L'aiguillage ne retire **jamais** :

- mesurer avant d'écrire (`principes-de-travail`) ;
- la gate verte avant « terminé » (`verification-et-terminaison`) ;
- aucun secret dans les sorties (`secrets-securite`) ;
- la production gardée (`production-gardee`) ;
- la clôture de la mémoire quand le profil en désigne une (`memoire-roadmap`).

## Parcours types

| Travail | Parcours | Écartés, et pourquoi |
|---|---|---|
| bug localisé dans un script | session : reproduire → corriger → test de régression → gate | architecte, analyste métier (aucun contrat ni besoin nouveau) ; release corrective seulement si le code est livré |
| texte ou documentation | session seule | gate fonctionnelle et release (aucun comportement changé) |
| petite évolution d'écran avec une donnée nouvelle | `gestionnaire-donnees` → `concepteur-ux` (léger) → session → `testeur` → gate | architecte (pas de contrat), analyste métier si le besoin est déjà décidé |
| fonctionnalité transverse | `analyste-metier` → décision → `architecte` → `concepteur-ux` / `gestionnaire-donnees` → `analyste-technique` + plan de `testeur` → réalisation → vérifications → `release` | — |
| dépendance ou outil mis à jour | `devops` → gate → release corrective | architecte sauf rupture de contrat |
| incident de production | `diagnostic-incident` (lecture seule) → aiguillage du correctif | toute écriture tant que la cause n'est pas établie |
| audit demandé | l'agent d'audit concerné (`auditeur-autonomie`, `revue-securite`, `conformite-design-system`) | réalisation (un audit ne corrige pas) |

## Escalade

Un travail jugé léger qui révèle un signal (un contrat touché, une donnée
réelle, une surface d'authentification) **ajoute le rôle à ce moment-là**, et
le dit. On ne repart pas de zéro ; on ne masque pas le changement de nature.
À l'inverse, un rôle prévu devenu sans objet est retiré, et le plan le dit.

## Passation

Chaque rôle reçoit le **livrable du précédent** (skill `livrables`) et le
cite ; il ne refait pas l'analyse. Le brief d'un agent contient : l'objectif,
les livrables d'entrée (chemins), son périmètre (dépôts, fichiers), ce qu'il
ne doit pas faire, et la forme de son rendu.

## Annonce du plan

Avant de lancer quoi que ce soit, la session annonce en quelques lignes :
rôles retenus et ordre, rôles écartés avec leur raison, décisions attendues du
propriétaire. Un travail trivial s'annonce en une phrase.
