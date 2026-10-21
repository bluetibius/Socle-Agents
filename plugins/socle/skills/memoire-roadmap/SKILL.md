---
name: memoire-roadmap
description: Tenir une mémoire produit et une roadmap partagées entre agents — lire avant le chantier, consigner les décisions pendant, réconcilier à la clôture, niveaux de preuve, écriture concurrente sous verrou. À charger au début et à la fin de tout chantier quand le profil désigne une mémoire ou une roadmap, et dès qu'une nouveauté est décidée par le propriétaire.
---

# Mémoire et roadmap

Le profil désigne l'emplacement de la mémoire (fiches produit, roadmap,
décisions, comptes rendus) et peut préciser la procédure. Ce qui suit est le
plancher.

## Avant le chantier

Lire le sommaire de la mémoire, la fiche du produit, la roadmap et les
instructions du dépôt. Comparer la demande aux décisions, acquis, limites et
restes. Relever les écarts plutôt que reproduire un chantier déjà clos. Le bref
état de départ nomme les références lues et ce qui reste à vérifier.

## Pendant

Dès qu'une nouveauté est **décidée par le propriétaire**, la consigner (fiche et
roadmap) avec besoin, comportement attendu, critères, dépendances et statut.
Une suggestion reste « proposition à discuter » : ni décision, ni acquis, ni
priorité.

## À la clôture

Étape **obligatoire**, faite par l'agent de lui-même, avant sa réponse finale,
même pour une correction, un audit ou de la documentation :

- fiche produit : acquis, état, décisions, limites, prochaine action ;
- roadmap : clôtures, restes, dépendances — sans inventer de priorité, date ou
  release ;
- un compte rendu daté du chantier : objectif, résultat, version/commit, état
  par environnement, preuves, limites, prochaine action.

Arrêt pour décision humaine : consigner dès la passation les acquis et les
étapes en attente.

## Niveaux de preuve

proposé, implémenté, testé, publié Git, servi en test, servi en production,
adopté, activé, effet observé. Ne pas déduire l'un de l'autre. Un état non
remesuré garde sa date et sa réserve.

## Concurrence

- Les sources historiques et comptes rendus clos sont des preuves : ne pas les
  réécrire.
- Relire juste avant d'écrire ; conserver les contributions concurrentes ; un
  conflit ne se résout jamais en écrasant.
- Si le profil prévoit un verrou (dossier créé atomiquement) ou un manifeste
  d'empreintes, les respecter ; ne jamais retirer le verrou d'un autre agent.
- Aucun secret, jeton ni donnée personnelle dans les synthèses.

## Accès manquant

Préparer le complément à un emplacement autorisé, avec sa destination, et
annoncer « mémoire non synchronisée — clôture documentaire en attente » avec la
cause. La mémoire décrit les preuves ; elle n'autorise aucune opération
d'exploitation.
