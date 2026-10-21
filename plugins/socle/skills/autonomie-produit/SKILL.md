---
name: autonomie-produit
description: Doctrine d'autonomie fonctionnelle et opérationnelle — le code construit le produit, le produit gère son fonctionnement. Les six autonomies, les dix questions et la grille de verdicts. À charger pour concevoir ou qualifier une fonctionnalité, auditer un produit, ou quand une donnée métier, une date, une liste ou une tâche récurrente semble exiger une modification du code ou une intervention humaine régulière.
---

# Autonomie du produit

**Le code construit le produit. Le produit gère son fonctionnement.**

## A. Données métier

Toute donnée métier qui évolue normalement est persistée dans un stockage
adapté et modifiable par un mécanisme autorisé du produit, ou calculée depuis sa
source de vérité. Une liste, une date, une association ou une offre ordinaire ne
demande pas une modification du code à chaque évolution.

## B. Configuration

Les paramètres opérationnels évolutifs ont un mécanisme approprié :
administration, configuration persistante contrôlée, contrat entre produits,
synchronisation ou découverte. Secrets et paramètres d'infrastructure restent
dans une configuration d'environnement protégée. Réutiliser l'existant ; aucune
table par paramètre n'est imposée.

## C. Temps

Les opérations périodiques passent par l'ordonnanceur désigné par le profil.
Pas de nouveau cron parallèle, ni de script manuel récurrent. Une opération
événementielle reste native au produit. Les cadences respectent les sources et
leur fraîcheur.

## D. Maintenance

Imports et synchronisations se répètent sans intervention humaine normale.
Selon le cas : idempotence, observabilité, reprise, résilience, dernier état
valide conservé. Chaque traitement a un déclencheur, un propriétaire et une
gestion des échecs. Aucun succès fictif. Les identités et exceptions survivent
aux imports et aux redémarrages.

## E. Administration

Une correction métier ordinaire passe par une interface du produit, avec droits,
validations et audit. SQL direct, modification de source, constante
d'exception ou commit dédié ne sont pas des procédures normales.

## F. Après déploiement

Une release fonctionne durablement sans entretien récurrent de données par un
développeur ou une IA. **Aucune fonction d'exploitation normale ne dépend d'une
intervention récurrente d'un modèle d'IA.** L'IA développe, analyse, teste,
documente, propose et assiste ; elle n'est pas indispensable au fonctionnement
quotidien, même pendant des mois.

## Proportion

Restent légitimes dans le code : constantes protocolaires, algorithmes,
contraintes de sécurité, types, contrats d'API, invariants métier stables,
paramètres de démarrage, migrations, tests et fixtures. Un défaut raisonnable
dans le code est admis si sa valeur effective reste modifiable. Distinguer
invariant logiciel et donnée évolutive, sans multiplier paramètres et écrans.

## Les dix questions

Pour toute nouvelle fonctionnalité, y répondre dans sa qualification :

1. Comment les données sont-elles créées ?
2. Comment évoluent-elles ?
3. Comment sont-elles corrigées ?
4. Comment sont-elles supprimées ou archivées ?
5. Qui peut effectuer ces actions ?
6. Quelles opérations doivent être automatiques ?
7. Quelles opérations doivent être planifiées ?
8. Que se passe-t-il si une source devient indisponible ?
9. Que se passe-t-il après un nouvel import ou un redémarrage ?
10. Le fonctionnement normal exige-t-il encore une intervention dans le code ?

Une fonctionnalité n'est pas terminée si une intervention humaine récurrente
injustifiée reste indispensable. Qualifier : droits, modification sans commit,
persistance après redémarrage ou import, reprise, absence de duplication.

## Verdicts

Chaque constat est classé : **CONFORME**, **PARTIELLEMENT CONFORME**,
**NON CONFORME**, **EXCEPTION JUSTIFIÉE**, **DÉCISION PRODUIT**,
**HORS PÉRIMÈTRE**.

Une dette restante porte : propriétaire, priorité, preuve, périmètre, critère
de fermeture observable. Elle réutilise un chantier existant plutôt que d'en
dupliquer un. Une décision métier non prise reste au propriétaire.
