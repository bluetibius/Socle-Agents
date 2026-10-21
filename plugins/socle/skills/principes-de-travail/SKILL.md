---
name: principes-de-travail
description: Principes communs à tout agent qui travaille dans un dépôt — qui fait autorité, ordre de confiance, mesurer avant d'écrire, écarts déclarés, profil du projet. À charger au début de tout chantier, avant d'écrire du code ou de la documentation, et chaque fois qu'une source contredit une autre.
---

# Principes de travail

Plancher commun, indépendant de tout projet. Un dépôt ou une organisation peut
le renforcer ; il ne l'affaiblit qu'en le déclarant comme **écart** (voir plus
bas).

## Préséance

1. Les instructions du dépôt (`AGENTS.md`, et ce qu'il cite).
2. Le profil de l'organisation (règles communes à plusieurs dépôts).
3. Ce socle.

Une contradiction non résolue entre deux niveaux se signale avant l'action
concernée ; elle ne se tranche pas en silence.

## Le profil du projet

Les skills et agents du socle parlent de notions génériques. Le profil du
projet (une section de son `AGENTS.md`, ou une skill d'organisation) leur donne
leur valeur :

| Notion | Ce que le profil doit dire |
|---|---|
| Environnements | noms canoniques (local, test, production…) et machines |
| Machine de test | où s'exécutent tests, gates et qualifications |
| Commande de gate | la commande, sa machine, le nombre de tests attendu |
| Voie de Production | qui déclenche, par quel outil ; ce qu'un agent peut préparer |
| Remotes Git | nom du remote, branche publiée |
| Versionnement | source unique du numéro, notes de version |
| Mémoire et roadmap | emplacement, procédure de clôture |
| Langue | des commits, de la documentation, de l'interface |

Une notion que le profil ne renseigne pas se demande ; elle ne se devine pas.
Modèle à remplir : [modele-profil.md](modele-profil.md). Le profil vit chez
l'utilisateur du socle, pas dans le socle.

## Une question, une source

Chaque question (le produit existe-t-il ? où tourne-t-il ? quelle version est
servie ? qui décide de l'interface ?) a **une** source d'autorité, nommée par
le profil. Une mesure datée (rapport, état des lieux) informe ; elle ne décide
rien.

## Ordre de confiance

1. le code réellement servi ;
2. l'état réel des environnements ;
3. Git ;
4. les services qui exploitent le produit (ordonnanceur, identité, versions…) ;
5. l'audit et le backlog ;
6. les rapports ;
7. le prompt.

Une baseline donnée par un prompt est **attendue, à remesurer**. Un écart se
documente et le chantier s'adapte ; on ne force jamais l'état attendu.

## Déclarer ≠ adopter ≠ activer ≠ exécuter

Quatre états distincts, qui se mesurent séparément. De même : implémenté,
testé, publié dans Git, servi en test, servi en production, effet observé. On
ne déduit jamais l'un de l'autre ; un état non observé reste déclaré « non
observé ».

## Mesurer avant d'écrire

Lire l'état (Git, fichiers, environnement) avant de modifier. Relire juste
avant d'écrire un fichier partagé : un autre agent a pu le changer.

## Écarts

Un dépôt qui ne suit pas une règle commune le dit dans son `AGENTS.md`, sous
« Écarts », avec :

- la règle concernée ;
- la raison ;
- la **condition de retrait**, observable.

Un écart non déclaré est un défaut ; un écart déclaré est une dette connue.

## Ce que l'agent ne décide pas

Une décision métier, d'exploitation ou de sécurité non prise reste au
propriétaire. Une proposition reste distincte d'une décision. Un geste refusé
par les autorisations ne se contourne pas et ne se fait pas faire par un autre
agent : il remonte au propriétaire.

## Skills associées

`git-travail-parallele`, `verification-et-terminaison`, `versionnement-release`,
`production-gardee`, `secrets-securite`, `autonomie-produit`,
`instructions-depot`, `mission-multi-agents`, `memoire-roadmap`,
`donnees-et-migrations`, `exploitation-sure`, `tests-hermetiques`,
`doctrine-ux`.
