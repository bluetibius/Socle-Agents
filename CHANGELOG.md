# Historique

## 0.8.1 — 16/11/2026

Aucun nom de skill ni d'agent existant ne change.

### Changements

- `git-travail-parallele` (« Un chantier, un worktree ») : l'emplacement d'un
  worktree est celui que désigne le profil ; `../<depot>-<sujet>` reste le
  défaut. Un worktree placé ailleurs doit encore résoudre les dépôts voisins
  que ses chemins relatifs supposent. Un worktree existant ne se déplace
  qu'avec `git worktree move`, par son chantier.

Rang correctif : le comportement par défaut ne change pas ; le profil peut
désigner un autre emplacement.

## 0.8.0 — 08/11/2026

Développée sous 0.8.0-dev.20261108120410. Aucun nom de skill ni d'agent existant ne change.

### Nouveautés

- `git-travail-parallele` : section « Fraîcheur du checkout ». Avant tout
  travail, y compris un audit, une revue ou un diagnostic qui cite du code :
  `git fetch --tags`, mesure du retard et de l'avance sur la branche suivie et
  la branche publiée, fast-forward seulement d'une copie principale propre,
  worktree depuis la branche publiée à jour pour une copie sale ou d'un autre
  chantier, commit ou tag lu nommé dans tout rapport (« fraîcheur non vérifiée »
  sans accès distant), constat tiré d'une copie non mesurée « non revérifié ».

### Changements

- `principes-de-travail` (« Mesurer avant d'écrire ») et `mission-multi-agents`
  (lanes) renvoient à cette section ; les agents `auditeur-securite`,
  `revue-securite`, `reviewer-refutation` et `diagnostic-incident` la chargent
  et nomment le commit lu.

Rang mineur : une règle de comportement s'ajoute, sans rien retirer ni renommer.

## 0.7.0 — 30/10/2026

Développée sous 0.7.0-dev.20261029182619. Aucun nom de skill ni d'agent existant ne change.

### Nouveautés

- Agent `auditeur-securite` : audit de sécurité complet d'un produit, en
  lecture seule — modèle de menace, points de contrôle de `revue-securite`
  sur tout le code, dépendances et vulnérabilités connues, configuration servie
  mesurée en test par des requêtes `GET` et `HEAD`, exploitation (rotation,
  journaux, sauvegardes). Constats à identifiant stable, sévérité et critère de
  fermeture. Jamais de sondage actif ; la production seulement à la demande du
  propriétaire, sous `production-gardee`.
- `secrets-securite` : sections « Dépendances » (verrou, justification,
  audit des vulnérabilités, exceptions datées) et « Configuration servie »
  (HTTPS, en-têtes, cookies, pages d'erreur, fichiers exposés, ports, mesure en
  lecture seule) ; « Audits » ajoute le modèle de menace et quand refaire un
  audit complet.
- `aiguillage` : signal « première mise en production, changement
  d'architecture ou d'exposition, échéance d'audit du profil » →
  `auditeur-securite`.

### Changements

- `revue-securite` : onzième point, dépendance ajoutée ou montée de version
  dans le diff. Son périmètre est le changement ; un produit entier relève de
  `auditeur-securite`.

## 0.6.0 — 25/10/2026

Développée sous 0.6.0-dev.20261024191937. Aucun nom de skill ni d'agent existant ne change.

### Nouveautés

- Agent `inspecteur-finitions` : regarde une interface comme la personne qui
  la reçoit et relève ce qui fait négligé — information dite deux fois, langues
  mêlées, typographie, séries de logos ou d'images hétérogènes, alignements,
  textes coupés ou masqués, contenu brut ou factice, thème oublié — avec une
  gravité (bloquant, visible, finition) et un correctif proposé. Lecture
  seule ; complète `conformite-design-system` (les règles) et `revue-epure`
  (l'utile).
- `doctrine-ux` : une seule langue à l'écran, celle de l'interface, y compris
  pour les noms propres qui ont une forme dans cette langue ; un logo qui porte
  déjà le nom ne se double pas du nom en texte ; une série de logos partage
  hauteur, marge et fond, lisible dans chaque thème.
- `aiguillage` : signal « travail visible prêt à être déclaré terminé, écran
  qui fait négligé » → `inspecteur-finitions`.

## 0.5.0 — 24/10/2026

Développée sous 0.5.0-dev.20261024111150. Aucun nom de skill ni d'agent existant ne change.

### Nouveautés

- Agent `revue-epure` : énonce le but d'un écran en une phrase, passe chaque
  élément visible au crible de ce but et rend ce qu'on peut retirer,
  simplifier, replier, déplacer ou fusionner sans perdre de capacité, avec une
  mesure avant / après. Lecture seule ; complète `conformite-design-system`
  (qui vérifie les règles) en questionnant même ce qui est conforme.
- `aiguillage` : signal « écran chargé, ou allègement demandé » → `revue-epure`.

## 0.4.0 — 22/10/2026

Développée sous 0.4.0-dev.20261022130747.

Règles tirées du retour d'une release menée par deux outils d'agents sur le
même produit. Aucun nom de skill ni d'agent ne change.

### Nouveautés

- `git-travail-parallele` : section « Plusieurs agents sur un même produit » —
  réserver un numéro de version avant le premier commit qui le porte, intégrer
  par fusion et jamais en réappliquant le travail d'un autre, déployer un
  environnement partagé depuis une seule branche d'intégration après avoir
  mesuré ce qui est servi (le commit déployé contient le commit servi).
- `verification-et-terminaison`, « Interface » : qualifier d'abord sans
  navigateur (requêtes HTTP, outil versionné du dépôt limité au test) ;
  navigateur piloté seulement s'il tient dans la session ; contrôles visuels
  demandés à l'humain et nommés dans le rapport.
- `exploitation-sure` : mesurer le servi avant un déploiement partagé ; un délai
  sur toute commande qui attend le réseau, avec l'outil de la machine.
- Modèle de profil : délais par machine, outil de qualification, réservation
  des numéros, branche d'intégration du test, ce qu'un agent publie seul.

### Changements

- Le nombre de tests ne s'écrit plus dans les instructions (`AGENTS.md`,
  profil, modèle) : il se lit dans le journal de la gate. `gate-runner` rend
  VERTE sur un code 0 et une suite complète, et signale une baisse nette.
- `release` et `testeur` mesurent ce qui est servi avant de déployer et
  qualifient d'abord par requêtes HTTP.

## 0.3.3 — 22/10/2026

Développée sous 0.3.3-dev.20261022104048.

Correctif sans changement du plugin : numéro aligné sur Socle Agents EN 0.3.3,
dont le contrôle d'alignement avec ce dépôt devient un contrôle de mainteneur
(message neutre en son absence, section à part dans son README).

- `AGENTS.md` : la règle « traduction alignée » précise qu'un changement du
  seul outillage de la traduction prend aussi un numéro des deux côtés.

## 0.3.2 — 22/10/2026

Développée sous 0.3.2-dev.20261022101128. Correctif : aucun nom de skill ni
d'agent ne change. Traduction anglaise publiée sous le même numéro dans le
dépôt Socle Agents EN.

Ouverte comme 0.4.0 pour une traduction anglaise intégrée ; la traduction est
partie dans son propre dépôt, Socle Agents EN, aux versions alignées : le rang
redescend à correctif.

### Corrections

- Auteur déclaré (source : `plugins/socle/.claude-plugin/plugin.json`, adresse
  `noreply` de la forge), dans le `plugin.json`, le propriétaire de la
  marketplace, `LICENSE` et le README. Le vérificateur contrôle que l'auteur est
  le même partout et ne tolère son nom et son adresse que dans ces fichiers.
- Contrôle « domaine réel » : ses exceptions s'appliquaient à la ligne entière,
  chemin compris ; toute ligne d'un `SKILL.md` ou d'un `AGENTS.md` y échappait
  depuis la 0.1.0. Elles ne portent plus que sur le contenu.
- Agents français de lecture : ligne vide rétablie après la règle « Shell en
  lecture seule ».

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
