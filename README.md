# Socle Agents

*English version: repository Socle Agents EN (plugin `socle-en`), versions aligned.*

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
| `aiguillage` | quels rôles lancer ou écarter selon le travail ; proportion, escalade |
| `livrables` | fiche besoin, ADR, maquette, plans, qualification, incident : gabarits et passation |

### Agents (`plugins/socle/agents/`)

La session principale orchestre ; la skill `aiguillage` (ou l'agent
`aiguilleur`) dit quels rôles sont utiles pour un travail donné. Un bug
localisé n'a pas besoin d'architecte.

Une colonne « non » est garantie par la liste d'outils, sauf pour les agents qui
gardent un shell pour mesurer : leur lecture seule repose sur la règle « Shell en
lecture seule » de `principes-de-travail`.

| Phase | Agent | Livrable ou rôle | Écrit ? |
|---|---|---|---|
| Aiguillage | `aiguilleur` | plan d'intervention : rôles retenus et écartés | non |
| Besoin | `analyste-metier` | fiche besoin, critères, dix questions | documentation |
| Conception | `architecte` | décision d'architecture (ADR) | documentation |
| Conception | `concepteur-ux` | maquette d'écran | documentation |
| Conception | `gestionnaire-donnees` | plan de migration, migrations | code de schéma |
| Plan | `analyste-technique` | plan technique, lanes | documentation |
| Plan / réalisation | `testeur` | plan de qualification, tests | tests |
| Réalisation | `developpeur` | une lane jusqu'à la gate | code |
| Réalisation | `devops` | outillage de livraison et d'exploitation | outillage |
| Vérification | `gate-runner` | gate et preuve | non |
| Vérification | `revue-securite` | revue ciblée d'un changement | non |
| Vérification | `conformite-design-system` | interface contre DS et `doctrine-ux` | non |
| Vérification | `auditeur-autonomie` | verdicts d'autonomie et dettes | non |
| Vérification | `reviewer-refutation` | tente de réfuter un résultat déclaré | non |
| Livraison | `release` | release décidée, jusqu'au test | oui |
| Livraison | `preparateur-prod` | prépare la production, ne la déclenche pas | non |
| Exploitation | `diagnostic-incident` | rapport d'incident, lecture seule | rapport |
| Clôture | `gardien-memoire` | mémoire et roadmap | oui |
| Transverse | `redacteur-instructions` | écrit ou contrôle un `AGENTS.md` | oui |
| Transverse | `contenu-promotionnel` | contenu exact à partir du livré | fichiers |

## Installer

Claude Code, depuis un clone local ou un remote Git :

```
/plugin marketplace add <chemin-ou-url-du-depot>
/plugin install socle@socle-agents
```

Les skills deviennent `socle:<skill>` et les agents sont proposés à la
délégation. La traduction anglaise complète, aux mêmes règles, vit dans le dépôt
Socle Agents EN (marketplace `socle-agents-en`, plugin `socle-en`) : n'installer
qu'une langue. Pour un autre outil, pointer ses instructions vers les fichiers
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

## Auteur et licence

Auteur : Jonathan Estevez. Licence MIT — voir [LICENSE](LICENSE).
