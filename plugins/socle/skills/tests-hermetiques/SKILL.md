---
name: tests-hermetiques
description: Écrire des suites de tests hermétiques et des garde-fous qui tiennent — aucune dépendance au réseau, aux dépôts voisins ni aux vrais services, fixtures anonymisées, garde-fou de machine importé partout, règles importantes tenues par des tests structurels. À charger pour écrire ou revoir des tests, ajouter un point d'entrée de tests, ou transformer une règle d'architecture en contrôle automatique.
---

# Tests hermétiques

## Hermétiques

- La suite ne dépend d'aucun dépôt voisin, d'aucun service réel (identité,
  assistance, forge, fournisseur) ni du réseau. Une épreuve qui a besoin d'un
  service pose sa propre configuration ou un double.
- Configuration, clés, langue et chemins sont posés par la configuration de
  test ; un fichier laissé dans la copie par un déploiement ne change rien.
- Un test n'ouvre jamais un vrai site tiers : fixture enregistrée et
  **anonymisée**.
- La suite ne détruit jamais un fichier réel du dépôt ou de l'environnement.
- Base : `donnees-et-migrations` (base dédiée, barrières de nom).

## Fixtures

- Aucune donnée réelle : ni personne, ni identifiant d'appareil, ni adresse,
  ni nom d'organisation, ni position. Domaines réservés (`example.com`).
- Valeurs artificielles pour les tests négatifs de sécurité.
- Ne créer que les enregistrements qui préparent le comportement ou servent
  une assertion.

## Garde-fou de machine

Quand le profil réserve les tests à une machine :

- chaque point d'entrée (script de gate, bootstrap du framework de test,
  classe de base, chaque fichier de test d'un runner sans bootstrap) importe le
  garde-fou **en première instruction** ;
- le garde-fou sort avec un code dédié avant tout test et renvoie à la
  commande de gate ;
- aucune variable de contournement ; une option du runner (`--bootstrap`,
  `--no-configuration`) ne doit pas l'éviter ;
- tout nouveau point d'entrée de tests le porte.

## Règles tenues par des tests

Une règle d'architecture qui compte ne repose pas sur la mémoire des agents :
un **test structurel** la tient. Exemples :

- chaque route ou point d'entrée a sa garde d'authentification adaptée ;
- aucune URL de fournisseur, aucun client HTTP hors du module prévu ;
- aucun processus lancé depuis le code servi quand l'hébergement l'interdit ;
- copies vendorisées identiques à leur source (empreinte) ;
- versions déclarées cohérentes entre `VERSION`, README et CHANGELOG ;
- un seul ordonnanceur ;
- documentation d'autorité citée par le code (noms d'hôtes, routes) alignée.

Le test qui tient une règle porte un nom qui la dit, et l'`AGENTS.md` le
nomme à côté de la règle.

## Revue d'une suite

- Chaque test vérifie un comportement, pas une implémentation.
- Une régression corrigée laisse un test qui l'aurait attrapée.
- Un test lent ou instable se corrige ; il ne se désactive pas.
