---
name: git-travail-parallele
description: Règles Git quand plusieurs sessions ou agents travaillent en même temps sur les mêmes dépôts — mesurer l'état, worktree par chantier, réserver un numéro de version, intégrer par fusion, déployer sur un environnement partagé, ce qu'on ne touche jamais, ménage des branches. À charger avant toute écriture dans un dépôt Git, avant un commit, un push, un stash, un reset ou la suppression d'une branche ou d'un worktree, et avant d'ouvrir un numéro de version ou de déployer en test.
---

# Git et travail parallèle

## Avant d'écrire

```
git status
git branch --show-current
git worktree list
git remote
```

- Un travail non commité qui n'est pas le sien ne se modifie pas, ne se remise
  pas (`stash`), ne se réinitialise pas.
- Une copie de travail principale peut être sur la branche d'un autre
  chantier : vérifier avant d'y écrire.

## Un chantier, un worktree

```
git worktree add ../<depot>-<sujet> -b chantier/<sujet> main
```

- Dépendances installées (`vendor/`, `node_modules/`…) : les **copier** dans le
  worktree (`cp -cR` sur APFS), jamais un lien symbolique — l'autoload suivrait
  le lien vers l'autre copie.
- On ne touche ni aux worktrees ni aux branches des autres chantiers.

## Historique

- Pas de force-push, pas de réécriture d'un historique publié.
- La branche publiée (souvent `main`) avance par fusion de chantiers
  qualifiés ; un tag publié est immuable.
- Messages de commit qui disent **pourquoi**, dans la langue du profil.
- `git remote` avant de pousser : le nom du remote varie selon les dépôts.

## Plusieurs agents sur un même produit

Des outils différents (sessions, agents de fournisseurs différents) ne se
voient pas : seuls le dépôt distant, la mémoire et ce qui est servi font foi.

- **Réserver un numéro** avant le premier commit qui le porte : branche de
  chantier poussée qui le nomme, et entrée « en cours » dans la mémoire produit
  si le profil en désigne une. Avant de réserver, vérifier qu'aucune branche
  distante (`git ls-remote`) ni entrée de mémoire ne le tient déjà ; sinon
  prendre le suivant ou se coordonner.
- **Intégrer par fusion**, jamais en réappliquant le travail d'un autre
  (`cherry-pick`, `rebase` de ses commits, copie de fichiers) : réappliqué, il
  change d'empreintes et devient un doublon que son auteur ne reconnaît plus.
- **Un environnement partagé** (test) se déploie depuis une seule branche
  d'intégration, que le profil ou le dépôt nomme et où chaque chantier
  fusionne. Avant tout déploiement, mesurer la version et le commit servis : le
  commit déployé **contient** le commit servi
  (`git merge-base --is-ancestor <servi> <à déployer>`). Sinon fusionner
  d'abord, ou s'arrêter et identifier l'auteur du déploiement en place. Un
  retour arrière est une décision, pas un écrasement.

## Ménage

On retire un worktree ou une branche locale seulement s'il est :

- propre ;
- poussé ;
- contenu dans la branche publiée distante ;
- inutilisé par une autre session.

Les branches distantes utiles restent. On ne supprime jamais la branche ou le
worktree d'un autre chantier.
