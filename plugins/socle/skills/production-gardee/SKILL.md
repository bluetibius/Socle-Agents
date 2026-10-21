---
name: production-gardee
description: Règle de la Production gardée par un humain — ce qu'un agent prépare, où il s'arrête, ce qu'il mesure après. À charger dès qu'une demande, un plan ou un script touche un environnement de production (déploiement, migration, données, secrets, configuration), même en lecture.
---

# Production gardée

## La règle

**Un agent ne déploie jamais en production**, y compris en pilotant une
console (navigateur, API, script). C'est un humain, désigné par le profil, qui
déclenche, par la voie unique que le profil nomme.

Aucune autre voie, même sur demande, même urgente : ni script de déploiement
avec une cible de production, ni transfert ou shell à la main pour livrer du
code. Un écart à cette règle n'existe que s'il est décidé par le propriétaire
et déclaré dans l'`AGENTS.md` du dépôt, avec sa condition de retrait.

## Ce que l'agent prépare

1. Version étiquetée et poussée (`versionnement-release`).
2. Test déployé et qualifié sur ce même commit.
3. Dry-run et préflight en **lecture**.
4. État de production relevé (version et commit servis).
5. La marche à suivre pour l'humain, pas à pas.

Puis il **s'arrête et le dit**. Un déploiement de test réussi ne déclenche
jamais une production.

## Après

L'agent peut mesurer, en lecture seule : version et commit servis, santé,
smoke. La production se lit en `SELECT` et par des commandes de lecture.

## Impossible par la voie prévue

C'est un **défaut à corriger**, pas une voie à contourner. On corrige l'outil de
déploiement ou le produit jusqu'à ce qu'il le puisse. D'ici là, le produit ne
part pas en production, et son `AGENTS.md` le déclare comme écart, avec pour
condition de retrait « déployable en production par la voie prévue ».
