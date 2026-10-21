---
name: verification-et-terminaison
description: Ce que « terminé » veut dire et comment le prouver — gate du dépôt, machine d'exécution des tests, preuves dans un rapport, vérification d'interface. À charger avant de déclarer un travail terminé, de lancer une suite de tests ou une gate, ou d'écrire un rapport de fin.
---

# Vérifier, terminer

## Terminé

**Terminé** = la gate du dépôt est verte, sur la machine prévue par le profil,
avec le nombre de tests attendu ; le changement est commité ; il est poussé si
le dépôt le prévoit. Un rapport ne remplace pas une preuve.

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

Vérifier avec les outils réellement disponibles dans la session (navigateur
intégré, extension navigateur, Playwright du dépôt s'il y est installé).
Aucun serveur MCP particulier n'est exigé.

## Proportion

Une modification purement documentaire ou d'outillage ne justifie ni release
fonctionnelle ni déploiement.
