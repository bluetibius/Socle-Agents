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

## Contrôle

Si l'organisation a un contrôleur d'instructions, le lancer après chaque
modification. À défaut, vérifier au moins : `CLAUDE.md` == `@AGENTS.md`, le
renvoi aux règles communes présent, une gate nommée, chaque écart avec sa
condition de retrait.
