# Socle Agents

Un socle de règles, de skills et d'agents spécialisés pour les agents de code
(Claude Code, Codex, et tout outil qui lit `AGENTS.md` ou le format `SKILL.md`).
Il ne nomme aucune installation : chaque utilisateur le relie à la sienne par un
**profil**.

## Trois niveaux

1. **Ce socle** : principes portables, valables pour n'importe quel dépôt.
2. **Le profil** d'une organisation ou d'un projet : machines, outils, voies de
   déploiement, sources d'autorité. Il vit chez l'utilisateur, pas ici.
   Modèle : [modele-profil.md](plugins/socle/skills/principes-de-travail/modele-profil.md).
3. **L'`AGENTS.md`** de chaque dépôt : commandes, gate, pièges, écarts.
   Modèle : [modele-AGENTS.md](plugins/socle/skills/instructions-depot/modele-AGENTS.md).

Le niveau le plus proche du dépôt prévaut ; un affaiblissement du socle se
déclare comme écart, avec sa condition de retrait.

## Contenu

### Skills (`plugins/socle/skills/`)

| Skill | Pour |
|---|---|
| `principes-de-travail` | autorité, ordre de confiance, profil, écarts |
| `git-travail-parallele` | plusieurs agents sur les mêmes dépôts |
| `verification-et-terminaison` | « terminé », gates, preuves |
| `versionnement-release` | SemVer, numéro de développement, release |
| `production-gardee` | ce qu'un agent prépare et où il s'arrête |
| `secrets-securite` | ce qui ne sort jamais, surfaces, sauvegardes |
| `autonomie-produit` | le produit gère son fonctionnement ; dix questions |
| `instructions-depot` | écrire un `AGENTS.md` |
| `mission-multi-agents` | lanes, revue par réfutation, rapport final |
| `memoire-roadmap` | mémoire produit partagée, clôture documentaire |
| `donnees-et-migrations` | bases de test, migrations, simulation, restauration, absence ≠ zéro |
| `exploitation-sure` | une tâche une horloge, verrous, gestes réels, mesure après déploiement |
| `tests-hermetiques` | suites isolées, fixtures anonymisées, garde-fous, tests structurels |
| `doctrine-ux` | principes, espaces, navigation, états, formulaires, anti-patterns |

### Agents (`plugins/socle/agents/`)

| Agent | Rôle | Écrit ? |
|---|---|---|
| `reviewer-refutation` | tente de réfuter un résultat déclaré | non |
| `auditeur-autonomie` | audit d'autonomie, verdicts et dettes | non |
| `gate-runner` | lance la gate, rapporte la preuve | non |
| `release` | conduit une release décidée, jusqu'au test | oui |
| `preparateur-prod` | prépare la production, ne la déclenche pas | non |
| `gardien-memoire` | clôture documentaire mémoire/roadmap | oui |
| `redacteur-instructions` | écrit ou contrôle un `AGENTS.md` | oui |
| `conformite-design-system` | contrôle une interface contre son DS et `doctrine-ux` | non |
| `revue-securite` | revue ciblée d'un changement : portes, secrets, SSRF, données | non |
| `contenu-promotionnel` | slides et légendes exactes à partir du livré ; ne publie pas | oui |

## Installer

Claude Code, depuis un clone local ou un remote Git :

```
/plugin marketplace add <chemin-ou-url-du-depot>
/plugin install socle@socle-agents
```

Les skills deviennent `socle:<skill>` et les agents sont proposés à la
délégation. Pour un autre outil, pointer ses instructions vers les fichiers
`SKILL.md` (format ouvert), par exemple depuis l'`AGENTS.md` d'un dépôt.

## Relier à une installation

1. Copier `modele-profil.md` chez soi et le remplir.
2. Dans l'`AGENTS.md` de chaque dépôt : renvoyer au profil puis au socle, et ne
   garder que ce qui est propre au dépôt.

## Contrôle

```
sh bin/verifier.sh
```

Contrôle statique : frontmatter des skills et agents, liens, manifestes,
version unique (`VERSION`), et **généricité** — aucun chemin personnel,
aucune IP privée, aucun domaine réel. Les termes propres à une installation se
listent hors du dépôt, dans `$SOCLE_TERMES_INTERDITS` ou
`~/.config/socle-agents/termes-interdits.txt`.
