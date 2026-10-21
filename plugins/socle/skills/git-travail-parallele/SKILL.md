---
name: git-travail-parallele
description: Règles Git quand plusieurs sessions ou agents travaillent en même temps sur les mêmes dépôts — mesurer l'état, worktree par chantier, ce qu'on ne touche jamais, ménage des branches. À charger avant toute écriture dans un dépôt Git, avant un commit, un push, un stash, un reset ou la suppression d'une branche ou d'un worktree.
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

## Ménage

On retire un worktree ou une branche locale seulement s'il est :

- propre ;
- poussé ;
- contenu dans la branche publiée distante ;
- inutilisé par une autre session.

Les branches distantes utiles restent. On ne supprime jamais la branche ou le
worktree d'un autre chantier.
