# Historique

## 0.2.1 — 21/10/2026

Développée sous 0.2.1-dev.20261021194728 (ouverture 21/10/2026 19:47 CEST).

### Corrections

- Ajoute le fichier `LICENSE` (MIT), que `plugin.json` déclarait déjà sans
  que le texte de la licence soit fourni.

## 0.2.0 — 21/10/2026

Développée sous 0.2.0-dev.20261021193324 (ouverture 21/10/2026 19:33 CEST).

### Nouveautés

- Skills `donnees-et-migrations`, `exploitation-sure`, `tests-hermetiques` et
  `doctrine-ux` (avec formulaires, états, retours d'action et anti-patterns),
  tirées des pièges et précautions de dépôts réels, rendues génériques.
- Agents `revue-securite` (revue ciblée, lecture seule) et
  `contenu-promotionnel` (contenu exact à partir du livré, sans publication).
- `secrets-securite` : portes d'entrée et leurs gardes, SSRF, interfaces
  locales, journaux caviardés, vie privée, assouplissement d'un contrôle.
- `instructions-depot` : ce qu'un `AGENTS.md` doit rendre visible (code
  dupliqué exprès, copies, contrats, consommateurs, héritages) et la
  documentation à tenir après un ajout majeur.
- `verification-et-terminaison` : travail long et rapport de fin en trois
  rubriques (Blocked on me, Changed, Found).
- `versionnement-release` : plusieurs numéros par composant, cohérence
  contrôlée.
- `conformite-design-system` s'appuie sur `doctrine-ux`.

### Opérations

- Mettre à jour le plugin installé (`/plugin marketplace update socle-agents`).
  Aucun nom de skill ni d'agent ne change : aucune rupture.

## 0.1.0 — 21/10/2026

Première version. Développée sous 0.1.0-dev.20261021191837 (ouverture
21/10/2026 19:18 CEST).

### Nouveautés

- Plugin `socle` : dix skills génériques (principes de travail, Git parallèle,
  vérification, versionnement, production gardée, secrets, autonomie produit,
  instructions de dépôt, mission multi-agents, mémoire et roadmap).
- Huit agents spécialisés : `reviewer-refutation`, `auditeur-autonomie`,
  `gate-runner`, `release`, `preparateur-prod`, `gardien-memoire`,
  `redacteur-instructions`, `conformite-design-system`.
- Modèles : profil d'installation, `AGENTS.md`, prompt de mission.
- `bin/verifier.sh` : contrôle statique, dont la généricité.

### Opérations

- Installation : `/plugin marketplace add <chemin-ou-url-du-depot>` puis
  `/plugin install socle@socle-agents`.
- Pour le contrôle complet de généricité, créer la liste locale de termes
  interdits (`$SOCLE_TERMES_INTERDITS` ou
  `~/.config/socle-agents/termes-interdits.txt`).
