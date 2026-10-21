# Socle Agents — instructions du dépôt

Socle générique de règles, skills et agents pour agents de code, publié comme
marketplace de plugins Claude Code (`.claude-plugin/marketplace.json`, plugin
`plugins/socle`). Markdown et JSON seulement ; aucun code exécuté hors du
contrôle `bin/verifier.sh`.

Règles communes : le socle s'applique à lui-même
(`plugins/socle/skills/principes-de-travail/SKILL.md` et les skills qu'il
cite). Les règles de l'installation où ce dépôt est cloné s'y ajoutent par son
profil, jamais par ce dépôt.

**Terminé** = `sh bin/verifier.sh` affiche `VERT`, avec la liste locale de
termes interdits présente ; changement commité ; poussé si un remote existe.

## Commandes

- `sh bin/verifier.sh` — contrôle statique (structure, liens, versions,
  généricité). Inspection de fichiers : s'exécute sur le poste.
- `claude plugin validate .` — validation des manifestes par Claude Code.

## Structure

- `VERSION` — **source unique** du numéro ; `plugin.json` et
  `marketplace.json` en sont des projections contrôlées.
- `plugins/socle/skills/<nom>/SKILL.md` — une règle par domaine ; ses modèles à
  côté (`modele-*.md`).
- `plugins/socle/agents/<nom>.md` — agents spécialisés ; leur champ `skills`
  ne cite que des skills du plugin.
- `CHANGELOG.md` — historique des versions.

## Règles propres au dépôt

- **Généricité absolue** : aucun nom d'organisation, de produit, de machine,
  de domaine réel, d'adresse IP, de chemin personnel. Ce qui est propre à une
  installation va dans son profil. La liste des termes interdits d'une
  installation reste hors du dépôt.
- Une règle entre au socle seulement si elle vaut pour n'importe quel dépôt ;
  sinon elle appartient à un profil ou à un `AGENTS.md`.
- Une skill porte une règle une seule fois ; les autres la citent par son nom.
- Les noms de skills et d'agents sont stables : un renommage est une rupture
  (version majeure).
- Le `description` d'une skill ou d'un agent dit **quand** l'utiliser : c'est
  ce que l'outil lit pour décider de la charger.

## Précautions

- Ne pas importer de skills tierces (frameworks, bibliothèques) : elles ont
  leur propre outil de distribution et de mise à jour.
