# Historique

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
