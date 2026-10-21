# Profil — <organisation ou projet>

Ce fichier relie le socle d'agents à une installation précise. Il vit chez
l'utilisateur du socle (dépôt d'organisation, documentation commune, ou section
« Profil » d'un `AGENTS.md`), jamais dans le socle lui-même. Il **cite** les
sources d'autorité de l'organisation ; il ne les recopie pas.

## Sources d'autorité

| Question | Source |
|---|---|
| Quels produits existent, leurs identifiants et URL | <registre, fichier, page> |
| Où chaque produit doit tourner | <topologie, inventaire> |
| Quelle version est réellement servie | <endpoint de version, outil> |
| Interface et doctrine UX | <design system : dépôt, version, documents> |
| Priorités et décisions en cours | <baseline, roadmap> |
| Règles communes de l'organisation | <document, et comment le lire hors de son dépôt> |

## Environnements

| Nom canonique | Machine / hébergement | Domaines | Remarques |
|---|---|---|---|
| local | <poste> | — | <ce qui y est interdit> |
| test | <machine de test> | <domaines> | <accès, verrou> |
| production | <hébergeur> | <domaines> | <voie unique de déploiement> |

Alias tolérés pour l'existant, jamais pour du neuf : <liste>.

## Tests et gates

- Machine d'exécution : <poste | machine distante>.
- Commande générique : `<commande de gate> <projet> --ref=<commit poussé>`.
- Garde-fou du poste : <oui / non, code de sortie>.
- Verrou ou file : <chemin, règle>.

## Production

- Qui déclenche : <rôle humain>.
- Par quel outil : <console, pipeline>.
- Ce qu'un agent peut préparer : <dry-run, préflight…>.
- Écarts décidés : <produit — raison — condition de retrait>.

## Git

- Hébergement et nom des remotes : <…>.
- Branche publiée : <main>. Format des tags : <vX.Y.Z>.
- Langue des commits : <langue>.

## Services transverses

- Identité et droits : <service>.
- Ordonnancement des tâches : <service>.
- Assistance et signalement : <service>.
- Mesure d'audience, statut, versions : <services>.

## Mémoire et roadmap

- Emplacement : <chemin ou dépôt>.
- Procédure de clôture : <document>.
- Verrou d'écriture, manifeste d'empreintes : <oui / non, chemins>.

## Sécurité

- Audit de sécurité en cours : <emplacement>.
- Référence de sauvegarde : <hébergeur, procédure>.

## Hors périmètre

- <dépôts ou sites auxquels ces règles ne s'appliquent pas, ou partiellement>.
