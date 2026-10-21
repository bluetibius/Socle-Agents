---
name: livrables
description: Les livrables qui passent d'un rôle à l'autre dans un chantier — fiche besoin, décision d'architecture (ADR), maquette d'écran, plan de migration, plan technique, plan de qualification, rapport d'incident — leurs gabarits, où les ranger et comment les citer. À charger pour produire ou consommer un livrable entre agents, ou pour briefer un agent spécialisé.
---

# Livrables de chantier

Un rôle spécialisé ne vaut que par son **livrable** : un document court,
daté, rangé dans le dépôt, que le rôle suivant **cite** au lieu de refaire
l'analyse.

## La chaîne

| Phase | Rôle | Livrable | Gabarit |
|---|---|---|---|
| Besoin | `analyste-metier` | fiche besoin | [modele-fiche-besoin.md](modele-fiche-besoin.md) |
| Décision | le propriétaire | statut de la fiche : décidée / à discuter / refusée | — |
| Conception | `architecte` | décision d'architecture (ADR) | [modele-adr.md](modele-adr.md) |
| Conception | `concepteur-ux` | maquette d'écran | [modele-maquette-ecran.md](modele-maquette-ecran.md) |
| Conception | `gestionnaire-donnees` | plan de migration | [modele-plan-migration.md](modele-plan-migration.md) |
| Plan | `analyste-technique` | plan technique | [modele-plan-technique.md](modele-plan-technique.md) |
| Plan | `testeur` | plan de qualification | [modele-plan-qualification.md](modele-plan-qualification.md) |
| Réalisation | `developpeur`, `devops`, `gestionnaire-donnees`, `testeur` | commits, gate verte | — |
| Vérification | `gate-runner`, `revue-securite`, `conformite-design-system`, `auditeur-autonomie`, `reviewer-refutation` | rapports de contrôle | — |
| Livraison | `release`, `preparateur-prod` | tag, test qualifié, marche à suivre | — |
| Exploitation | `diagnostic-incident` | rapport d'incident | [modele-rapport-incident.md](modele-rapport-incident.md) |
| Clôture | `gardien-memoire` | mémoire et roadmap réconciliées | — |

La skill `aiguillage` décide quels maillons sont utiles ; aucun n'est
obligatoire par principe.

## Où les ranger

Là où le dépôt le déclare (`AGENTS.md`). À défaut :

- `docs/besoins/AAAA-MM-JJ-<sujet>.md`
- `docs/adr/NNNN-<sujet>.md` (numérotation continue)
- `docs/chantiers/<sujet>/` pour maquette, plans et qualification
- `docs/incidents/AAAA-MM-JJ-<sujet>.md`

## Règles communes

- Un livrable dit **qui** l'a produit, **quand**, et à partir de **quels**
  livrables d'entrée (chemins).
- Il sépare ce qui est **mesuré**, ce qui est **décidé** et ce qui est
  **proposé**.
- Il est court : ce qui ne sert pas au rôle suivant n'y va pas.
- Une décision prise ensuite par le propriétaire s'y inscrit, datée ; on ne
  réécrit pas l'historique d'un livrable clos, on en ajoute un nouveau.
- Aucun secret ni donnée personnelle (`secrets-securite`).
