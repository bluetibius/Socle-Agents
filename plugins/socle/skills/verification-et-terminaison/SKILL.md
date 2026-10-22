---
name: verification-et-terminaison
description: Ce que « terminé » veut dire et comment le prouver — gate du dépôt, machine d'exécution des tests, preuves dans un rapport, vérification d'interface. À charger avant de déclarer un travail terminé, de lancer une suite de tests ou une gate, ou d'écrire un rapport de fin.
---

# Vérifier, terminer

## Terminé

**Terminé** = la gate du dépôt est verte, sur la machine prévue par le profil ;
le changement est commité ; il est poussé si le dépôt le prévoit. Un rapport ne
remplace pas une preuve.

Le nombre de tests se **lit dans le journal** de la gate et se rapporte ; il ne
s'écrit pas dans les instructions, où il vieillit. Si une baisse doit bloquer,
c'est la gate qui contrôle un minimum.

Le dépôt nomme sa gate dans son `AGENTS.md`. Sans gate nommée, le dire, et ne
pas en inventer une.

## Où s'exécutent les tests

Le profil sépare souvent :

- **le poste** : éditer, versionner, orchestrer, inspecter statiquement (lint,
  analyse, formatage), compiler ;
- **la machine de test** : suites, gates, smoke, bases de test, qualifications
  de release.

Quand le profil le prévoit :

- une compilation réussie sur le poste n'est jamais une preuve ;
- les points d'entrée de tests refusent le poste (garde-fou) ; on ne cherche
  pas à le lever ;
- machine de test occupée : attendre, jamais déplacer la gate vers le poste ;
- une base de test est dédiée à sa suite : jamais une base servie, jamais une
  copie de données de production.

## Ne jamais

- contourner, désactiver ou affaiblir un test ou un contrôle de sécurité ;
- annoncer vert sur la foi d'un sous-ensemble ;
- annoncer un succès fictif : l'erreur est rapportée telle quelle.

## Le rapport

Chaque gate citée porte :

- la commande et le commit exact ;
- la machine (`hostname`, `uname -s`) ;
- le chemin du journal ;
- le résultat et le nombre de tests.

## Travail long

- Quand une étape ne demande pas l'humain, continuer ; donner l'état dans le
  même message que l'action suivante.
- S'arrêter et demander seulement quand on ne peut pas continuer sans lui, ou
  avant un geste destructeur ou irréversible.

## Rapport de fin

Tout travail long se termine par trois rubriques, dans cet ordre :

1. **Blocked on me** — ce qu'aucun agent ne peut faire : décision, geste
   humain, accès manquant. « Rien » si rien.
2. **Changed** — ce qui a changé : fichiers, commits, versions,
   environnements ; ce qui n'a **pas** été fait ou vérifié.
3. **Found** — ce qui a été appris : constats, risques, écarts, preuves.

Un échec se rapporte avec sa sortie ; une étape sautée se dit.

## Interface

- Qualifier d'abord **sans navigateur** : requêtes HTTP scriptées (`curl`,
  jeton de formulaire lu dans la page). Quand il faut une session
  authentifiée, un **outil versionné** du dépôt la crée ; il est refusé hors
  de l'environnement de test et supprime ce qu'il a créé.
- Un navigateur piloté (intégré, extension, Playwright du dépôt) seulement s'il
  tient dans la session. S'il bloque sans demande visible, l'abandonner et le
  consigner dans le profil.
- Ce qu'aucun outil ne prouve (lecture visuelle, zoom à 200 %) se demande à
  l'humain et se nomme dans le rapport, comme non vérifié par l'agent.
- Aucun serveur MCP particulier n'est exigé.

## Proportion

Une modification purement documentaire ou d'outillage ne justifie ni release
fonctionnelle ni déploiement.
