---
name: donnees-et-migrations
description: Protéger les données réelles — bases de test isolées, commandes destructrices, migrations, simulation avant écriture, sauvegarde et restauration, clés de chiffrement, vérité des données affichées (absence ≠ zéro). À charger avant d'écrire une migration, de lancer une commande qui écrit, purge, importe ou restaure, de toucher une clé de chiffrement, ou d'afficher une donnée qui peut manquer.
---

# Données et migrations

## Bases de test

- Une suite de tests a **sa** base, dédiée : jamais une base servie (même de
  test), jamais une copie de données de production.
- Les commandes destructrices (vider, recréer, revenir en arrière) **refusent**
  toute base dont le nom ne porte pas le marqueur de test convenu (par exemple
  le suffixe `_test`). Le compte de la suite n'a aucun droit sur la base
  servie. Ne jamais affaiblir ces barrières ; une variable qui les lève est un
  geste délibéré sur sa propre base, pas un contournement.
- La suite refuse une configuration mise en cache qui viserait une autre base.

## Migrations

- On **ajoute** une migration ; on ne modifie jamais une migration déjà livrée.
- Une migration ne supprime jamais de données d'utilisateurs ; un retour
  arrière (`down()`) ne touche pas aux données réelles et ne se joue pas en
  production sans préparation.
- Les scripts de schéma ou de reconstruction lisent en **plan** par défaut et
  n'écrivent qu'avec une option explicite (`--apply`) ; on relit le plan.
- Ne jamais générer un schéma depuis la production, ni créer une table à la
  main.
- Avant une migration risquée : sauvegarde **vérifiée** (pas seulement
  lancée), et sauvegarde à part de la configuration qui porte les clés.

## Écrire sur des données réelles

- Simuler d'abord : `--dry-run`, `--simuler`, plan. Relire le résultat ligne à
  ligne avant d'exécuter.
- Une écriture manuelle (import, synchronisation, recalcul) peut entrer en
  course avec une exécution planifiée : vérifier le verrou ou la fenêtre, lire
  l'état (`doctor`, statut) d'abord.
- Les données **irremplaçables** (mesures de terrain, décisions humaines,
  surcharges déclarées, configuration secrète) sont nommées dans l'`AGENTS.md`
  du dépôt : aucune écriture de masse, aucune clé étrangère qui les
  recalculerait, jamais écrasées par une semence ou un import.
- Une purge ou une suppression définitive s'exécute en connaissant la
  politique de rétention, après simulation.
- Une suppression ordinaire passe par le service du produit (règles,
  audit, dernier administrateur protégé), jamais par SQL.

## Incidents, sauvegardes, restauration

- On ne recrée jamais une base pour corriger un incident applicatif.
- Restaurer passe par l'outil prévu (qui exige une confirmation nommant la
  base) ; jamais une copie de fichier sur une base en cours d'écriture
  (SQLite en WAL, par exemple).
- Un outil de restauration refuse la production par défaut : une
  restauration de production se décide.
- La sauvegarde de référence est celle désignée par le profil ; un dump local
  n'est qu'un filet.

## Clés et configuration

- Les clés de chiffrement d'une instance qui a des données ne changent
  jamais : documents et identifiants chiffrés deviendraient illisibles. Une
  rotation suit sa procédure écrite.
- Une clé de signature publiée ne se retire pas avant l'expiration des jetons
  qu'elle a signés.
- Ne pas éditer une configuration serveur par substitution de texte en place
  (`sed -i`) : propriétaire, groupe ou droits peuvent être perdus. Après
  modification, recharger la configuration de façon atomique quand le
  framework la met en cache.
- Changer un identifiant technique (nom d'application, nom de cookie, nom de
  base) a des effets en chaîne (sessions perdues, chemins) : pas « en
  passant ».

## Vérité des données affichées

- Une absence n'est pas un zéro ; `null` n'est pas `0` ; « inconnu » n'est
  jamais une conclusion, ni un état favorable.
- Une donnée périmée n'est pas du temps réel : dater ce qu'on affiche.
- N'afficher aucun état que la source ne publie pas ; ne rien inventer, ne
  rien rétro-remplir, ne rien fusionner sans règle.
- Les provenances (officielle, observée, inférée, validée) ne se mélangent
  pas ; une observation n'écrase pas une donnée officielle.
- Une donnée non conservée s'affiche « non conservée », pas 0.
- Un échec de mesure ne clôt pas une période : « dernière valeur connue ».
- Un libellé traduit ne se persiste pas ; on stocke la clé ou la valeur.
