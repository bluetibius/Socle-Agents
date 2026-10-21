---
name: secrets-securite
description: Secrets et sécurité au quotidien — ce qui ne sort jamais, comment rapporter sans divulguer, surfaces d'API, sauvegardes. À charger avant d'écrire un rapport, un commit, un journal ou une sortie qui pourrait contenir un secret ou une donnée personnelle, et avant de toucher à l'authentification ou aux droits.
---

# Secrets et sécurité

## Ce qui ne sort jamais

Aucun secret, jeton complet, cookie, session ni donnée personnelle dans :
un dépôt, une URL, un journal, un rapport, une sortie, un message de commit.

- On **compte**, on **masque**, on **hache** au lieu de citer.
- `.env.example` (ou équivalent) garde ses secrets vides.
- Les tests négatifs utilisent des valeurs artificielles.
- Aucune copie de données de production sur un poste de développement.

## Surfaces

- Inventorier les surfaces d'API critiques ; authentifier et autoriser ce qui
  doit l'être ; restreindre par réseau ou IP quand c'est pertinent.
- Préserver les flux machine à machine légitimes avec une identité ou un jeton
  dédiés.
- Un endpoint public n'est pas une vulnérabilité parce qu'il est public.
- Les invariants de sécurité ne deviennent pas librement modifiables par une
  interface d'administration.

## Audits

Les constats en cours vivent dans l'audit de sécurité que le profil désigne.
Un chantier qui n'est pas celui de la sécurité ne relance pas d'audit : il
relaie ce qu'il voit.

## Sauvegardes

La référence est la sauvegarde de l'hébergeur pour ce qu'il héberge. Ne pas
affirmer qu'une base est couverte sans l'avoir mesuré. Un code HTTP 200 n'est
pas la preuve qu'une sauvegarde a réussi.
