# Historique

## 0.3.1 — 21/10/2026

Développée sous 0.3.1-dev.20261021214441. Correctif : aucun nom de skill ni
d'agent ne change.

### Corrections

- `aiguilleur`, `auditeur-autonomie`, `conformite-design-system`,
  `analyste-technique`, `architecte` et `concepteur-ux` n'ont plus de shell :
  ils lisent des fichiers, et leur lecture seule est désormais imposée par
  l'outil, pas seulement par leur consigne.
- Règle « Shell en lecture seule » dans `principes-de-travail`, citée par les
  cinq agents de lecture qui gardent un shell pour mesurer (`reviewer-refutation`,
  `revue-securite`, `gate-runner`, `preparateur-prod`, `diagnostic-incident`).
- `bin/verifier.sh` refuse un agent de lecture qui a `Edit`, ou un shell sans
  cette règle.

## 0.3.0 — 21/10/2026

Développée sous 0.3.0-dev.20261021200601 (ouverture 21/10/2026 20:06 CEST).

### Nouveautés

- Skill `aiguillage` : la session principale décide quels rôles sont utiles
  pour un travail (signaux mesurés, proportion, étapes toujours obligatoires,
  parcours types, escalade, rôles écartés justifiés).
- Skill `livrables` : chaîne des livrables entre rôles et sept gabarits
  (fiche besoin, ADR, maquette d'écran, plan de migration, plan technique,
  plan de qualification, rapport d'incident).
- Dix agents : `aiguilleur`, `analyste-metier`, `architecte`,
  `analyste-technique`, `concepteur-ux`, `gestionnaire-donnees`,
  `developpeur`, `testeur`, `devops`, `diagnostic-incident`.
- `mission-multi-agents` : aiguillage préalable et correspondance phase → rôles.
- README : agents présentés par phase.

### Opérations

- Mettre à jour le plugin installé (`/plugin marketplace update socle-agents`).
  Aucun nom existant ne change : aucune rupture.

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
