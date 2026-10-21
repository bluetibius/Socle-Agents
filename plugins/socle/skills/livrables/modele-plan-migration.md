# Migration — <sujet>

Produit par : <rôle>, le <date>. Entrées : <fiche besoin, ADR, plan technique>.

## Changement de schéma

| Objet | Avant | Après | Compatible avec l'ancien code ? |
|---|---|---|---|

## Données

- Volume concerné (mesuré) : <…>.
- Reprise ou remplissage : <règle ; jamais d'invention, absence ≠ zéro>.
- Données irremplaçables touchées : aucune | <lesquelles, protection>.

## Exécution

1. Sauvegarde vérifiée : <référence, vérification>.
2. Plan / simulation : <commande> → <résultat attendu>.
3. Application : <commande>, fenêtre : <hors exécutions planifiées>.
4. Contrôle après : <requêtes de lecture, compteurs>.

## Retour arrière

<Procédure ; ce qui est perdu si on revient ; jamais de `down()` destructeur
sur des données réelles.>

## Index et performances

<Requêtes concernées, index ajoutés, coût mesuré en test.>

## Tests

<Migrations appliquées sur une base de test dédiée ; cas limites.>
