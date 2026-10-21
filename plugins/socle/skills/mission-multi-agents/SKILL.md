---
name: mission-multi-agents
description: Gabarit d'une mission confiée à plusieurs agents — lecture préalable, lanes et propriété des dépôts, séquence de livraison, revue indépendante par réfutation, tenue de l'audit et du backlog, forme du rapport final. À charger pour orchestrer des sous-agents ou des sessions parallèles, rédiger un prompt de mission, ou en exécuter une lane.
---

# Mission multi-agents

Un prompt de mission dit « Applique le gabarit de mission » et ne porte que le
**delta** : objectifs, baseline attendue, lanes, interdits propres, priorités
de repli. Modèle : [modele-prompt-mission.md](modele-prompt-mission.md).

## 1. À lire avant d'agir

L'orchestrateur **et chaque** sous-agent lisent : ce gabarit, les règles
communes (`principes-de-travail` et le profil), l'`AGENTS.md` de chaque dépôt
touché. Un sous-agent ne voit pas le prompt de mission : l'orchestrateur lui
transmet le delta qui le concerne et lui renvoie ce gabarit plutôt que d'en
recopier le contenu.

## 2. Mesure

Ordre de confiance et « baseline attendue, à remesurer » :
`principes-de-travail`. Ne pas confondre déclarer, adopter, activer, exécuter.

## 3. Lanes

- Une lane **possède** des dépôts nommés. Deux lanes n'écrivent jamais dans le
  même dépôt en même temps. Une découverte hors périmètre se relaie à
  l'orchestrateur.
- Chaque lane travaille dans son worktree (`git-travail-parallele`).
- Une responsabilité transverse (déploiement, verrou, backlog) a **un seul**
  responsable nommé, ou la règle dit « chaque lane, sous le verrou ».

## 4. Sécurité

Aucune écriture en production sans demande explicite de la mission
(`production-gardee`). Rien de sensible dans les sorties (`secrets-securite`).
Un geste refusé remonte au propriétaire.

## 5. Livraison, par produit modifié

1. gate complète verte sur la machine prévue ;
2. fusion sur la branche publiée ;
3. tag ;
4. push ;
5. déploiement en test, sous le verrou s'il existe, sans garder le verrou
   pendant une gate ;
6. qualification : version et commit servis égaux au tag, santé, smoke.

Critère d'autonomie (`autonomie-produit`) appliqué avant clôture. Une
modification d'outillage ou de documentation ne justifie pas de release.

## 6. Revue indépendante

Un agent **qui n'a rien corrigé** tente de **réfuter** chaque verdict (agent
`reviewer-refutation`). Un défaut bloquant ou majeur dans le périmètre se
corrige avant le verdict, puis on refait la vérification correspondante.

## 7. Audit, backlog, ménage

- Relire juste avant d'écrire.
- Ajouter une section datée, sans réécrire les précédentes.
- Mettre à jour une entrée existante plutôt qu'en créer une nouvelle.
- Ne fermer une entrée que sur preuve ; citer chaque identifiant avec son
  intitulé.
- Ménage Git : `git-travail-parallele`.

## 8. Rapport final

1. Le verdict, dans les termes demandés par la mission.
2. **Blocked on me** : seulement ce qu'aucun agent ne peut faire.
3. Les faits marquants.
4. Le tableau des versions : produit, avant, branche publiée, tag, test,
   production.
5. Un renvoi à la section de l'audit qui porte les preuves.

L'audit est la source ; le rapport ne le recopie pas.
