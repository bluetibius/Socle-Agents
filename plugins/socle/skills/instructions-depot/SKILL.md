---
name: instructions-depot
description: Écrire ou relire le fichier d'instructions d'un dépôt (AGENTS.md, CLAUDE.md, GEMINI.md) — ce qu'il contient, ce qu'il ne contient pas, un seul fichier lu par tous les outils. À charger pour créer un dépôt, rédiger ou contrôler un AGENTS.md, ou quand une consigne semble devoir devenir permanente.
---

# Instructions d'un dépôt

## Un seul fichier

- `AGENTS.md` à la racine est **le** fichier d'instructions (lu par Codex et
  d'autres outils).
- `CLAUDE.md` contient la seule ligne `@AGENTS.md` (import lu par Claude Code) ;
  `GEMINI.md` de même s'il existe.
- Aucune copie, aucun lien symbolique entre ces fichiers.
- Un sous-dossier peut avoir son `AGENTS.md` pour ce qui ne vaut que là.

## Contenu

Court et actionnable, dans cet ordre (modèle : [modele-AGENTS.md](modele-AGENTS.md)) :

1. Ce qu'est le produit, en quelques lignes.
2. Le renvoi aux règles communes (profil d'organisation, puis ce socle) —
   un renvoi, **pas une copie**.
3. **Terminé** : la gate, sa machine, le nombre de tests attendu.
4. Commandes.
5. Structure : où se trouve quoi, quels documents font autorité.
6. Environnements du produit.
7. Règles propres au produit et pièges.
8. Écarts aux règles communes, chacun avec sa condition de retrait.
9. Précautions : les opérations qui demandent un accord ou une prudence.

## Ce qui n'y va pas

- L'histoire : elle va dans `docs/` ou dans Git.
- Une consigne de chantier ponctuel : elle reste dans ce chantier, et n'entre
  dans `AGENTS.md` que si elle devient une règle permanente du produit.
- Une copie des règles communes : on cite, on ne recopie pas.
- Une exigence d'outil que tous les agents n'ont pas (un serveur MCP
  particulier, par exemple).

## Ce qu'un AGENTS.md doit rendre visible

Ces situations se perdent si elles ne sont pas écrites :

- **Code dupliqué exprès** : les paires de fichiers « à modifier des deux
  côtés » (validateur client ↔ serveur, clé calculée dans deux langages), avec
  le contrat qui les relie.
- **Copies et sources** : les fichiers vendorisés ou synchronisés, l'outil qui
  les met à jour (depuis un tag publié) ; ils ne se modifient jamais à la main.
- **Une seule liste** : quand une liste fait autorité (exclusions, routes
  mesurées, tâches), dire où elle est ; on ne la recopie pas.
- **Contrats publics** : codes de sortie, formats, endpoints dont d'autres
  dépendent ; leur sens ne change pas sans version.
- **Consommateurs** : qui reprend ce paquet ou ce contrat. Un changement de
  comportement se signale à chacun ; la reprise est un geste de leur propre
  chantier.
- **Héritages conservés** : anciens identifiants qu'on ne renomme pas
  « en passant » (nom d'application, cookie, base, script appelé par un
  outil) ; la prose emploie le terme actuel.
- **Documents historiques** : quels fichiers à la racine sont historiques, et
  lesquels font foi.
- **Données irremplaçables** et commandes destructrices
  (`donnees-et-migrations`).

## Documentation à tenir après un ajout majeur

Le dépôt dit ce qu'un **ajout majeur** (nouvelle page, nouveau module ou
fonctionnalité visible, nouvelle logique métier, refonte visuelle d'une
section) impose de mettre à jour — README, liste des fonctionnalités,
nouveautés affichées aux utilisateurs (et leurs langues) — et ce qui ne compte
pas (correction, ajustement CSS, refactorisation sans effet visible).

## Contrôle

Si l'organisation a un contrôleur d'instructions, le lancer après chaque
modification. À défaut, vérifier au moins : `CLAUDE.md` == `@AGENTS.md`, le
renvoi aux règles communes présent, une gate nommée, chaque écart avec sa
condition de retrait.
