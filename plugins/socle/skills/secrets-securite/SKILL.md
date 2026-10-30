---
name: secrets-securite
description: Secrets et sécurité au quotidien — ce qui ne sort jamais, portes d'entrée et leurs gardes, SSRF, interfaces locales, journaux caviardés, vie privée (mobile comprise), dépendances, configuration servie, assouplissement d'un contrôle, audits, sauvegardes. À charger avant d'écrire un rapport, un commit ou un journal qui pourrait contenir un secret ou une donnée personnelle, avant de toucher à l'authentification, aux droits, aux requêtes sortantes, à la collecte de données ou aux dépendances, et pour un audit de sécurité.
---

# Secrets et sécurité

## Ce qui ne sort jamais

Aucun secret, jeton complet, cookie, session ni donnée personnelle dans :
un dépôt, une URL, un journal, un rapport, une sortie, un message de commit.

- On **compte**, on **masque**, on **hache** au lieu de citer.
- `.env.example` (ou équivalent) garde ses secrets vides.
- Les tests négatifs utilisent des valeurs artificielles.
- Aucune copie de données de production sur un poste de développement.

## Surfaces

- Inventorier les surfaces d'API critiques ; authentifier et autoriser ce qui
  doit l'être ; restreindre par réseau ou IP quand c'est pertinent.
- Préserver les flux machine à machine légitimes avec une identité ou un jeton
  dédiés.
- Un endpoint public n'est pas une vulnérabilité parce qu'il est public.
- Les invariants de sécurité ne deviennent pas librement modifiables par une
  interface d'administration.

## Portes d'entrée

Chaque type d'entrée a **sa** garde, et un test structurel vérifie que chaque
route en porte une :

| Entrée | Garde |
|---|---|
| page HTML | session |
| JSON en lecture | session, réponse JSON (pas de redirection) |
| JSON en écriture | session + protection CSRF |
| tâche planifiée | jeton de service ou secret, **en en-tête**, jamais dans l'URL |
| ligne de commande | refus hors CLI |

- Les gestes d'écriture d'une console d'administration exigent une session à
  second facteur ; la lecture et les chemins machine n'en dépendent pas.
- Accès décidé à deux niveaux quand le produit le prévoit : droit délivré par
  le service d'identité **et** autorisation locale.
- Un client public (application installée, intégration tierce) n'a pas de
  secret : un `client_secret` dans son dépôt est un défaut bloquant.
- Une redirection OAuth est exacte et déclarée par environnement ; jamais une
  adresse de test déclarée en production.
- Un service ne lit pas les tables d'un autre : il passe par son contrat
  (OIDC, API, événements).

## Requêtes sortantes et interfaces locales

- Politique SSRF : toute URL fournie par un appelant est refusée vers les
  plages privées et locales ; ne pas l'affaiblir. Jamais d'hôte, de commande
  ni d'URL venus d'un appelant : seulement un chemin sous une cible déclarée.
- Une interface locale (agent, outil de poste) écoute sur `127.0.0.1`, jamais
  `0.0.0.0`, et vérifie `Host`, `Origin`, `Sec-Fetch-Site` et `Content-Type`
  avant tout aiguillage, sans CORS.
- Un client n'exécute jamais ce que le serveur lui renvoie.
- Un agent automatisé ne contourne ni 2FA, ni CAPTCHA, ni contrôle de
  sécurité : il rend la main à l'humain.
- Pièces jointes et téléversements : hors de la racine web, types et tailles
  bornés. La racine web est strictement le dossier public.

## Journaux et stockage

- Le journal passe par un caviardage : ni cookie, ni jeton, ni mot de passe,
  ni HTML brut, ni identifiant personnel. Une commande écrite au journal ne
  porte jamais de secret.
- Les jetons vérifiés côté serveur sont stockés **hachés** ; un secret de
  poste vit dans le trousseau du système, pas dans un fichier.
- Un secret par produit et par environnement ; rotation avec secret
  précédent accepté pendant la transition.
- Journaux privés (droits restreints) et tournés.

## Vie privée

- Collecter le minimum ; aucune donnée identifiante ne survit à l'agrégation
  quand elle n'est pas nécessaire.
- Mobile : aucun identifiant d'appareil ou d'abonné (IMEI, IMSI, numéro,
  identifiant publicitaire…) lu ou envoyé ; permissions demandées au moment
  de l'usage, jamais en bloc ; refuser ne casse rien ; pas de collecte en
  arrière-plan sans session explicite ; zones privées appliquées avant
  l'écriture sur disque.
- Exports de diagnostic et journaux de terrain : jamais dans le dépôt ni dans
  un ticket sans relecture.
- Une build de développement qui parle à la production le dit et ne
  téléverse rien de test par accident.

## Dépendances

- Toute dépendance est déclarée avec un fichier de verrouillage versionné ;
  l'installation de la gate et du déploiement part de ce verrou.
- Une dépendance ajoutée se justifie : besoin réel, projet maintenu, licence
  compatible, source officielle. Ce que quelques lignes font ne justifie pas
  une dépendance.
- Vulnérabilités connues : l'outil d'audit du gestionnaire de paquets, ou
  celui que le profil désigne, sur le verrou. Une vulnérabilité ignorée l'est
  par une exception datée, motivée et révisée, jamais par un seuil relevé.
- Une copie vendorisée garde sa version et sa source ; elle se met à jour
  comme une dépendance.

## Configuration servie

Ce que le serveur renvoie fait partie de la sécurité, et se mesure :

- HTTPS seul, redirection depuis HTTP, `Strict-Transport-Security` ;
- en-têtes : `Content-Security-Policy` stricte, `X-Content-Type-Options:
  nosniff`, protection contre l'encadrement (`frame-ancestors`),
  `Referrer-Policy` ;
- cookies de session `Secure`, `HttpOnly`, `SameSite` ;
- pages d'erreur sans trace, version de framework, chemin ni requête ;
- rien de servi hors du dossier public : fichiers d'environnement, dépôt
  Git, sauvegardes, outils de débogage ou d'administration de base ;
- seuls les ports nécessaires exposés.

On mesure par des requêtes en lecture (`GET`, `HEAD`), sur l'environnement de
test. La production se mesure de la même façon seulement si le propriétaire
le demande, sous `production-gardee`. Jamais de sondage actif (balayage,
fuzzing, force brute, charge) : il dégrade un environnement partagé et ne
relève pas d'un agent.

## Assouplir un contrôle

Tout assouplissement d'un contrôle de sécurité est une **régression** : il
demande une épreuve qui le justifie et une entrée de l'historique des
versions. Un changement de comportement d'une bibliothèque de sécurité se
signale à chaque produit qui l'a reprise.

## Audits

Les constats en cours vivent dans l'audit de sécurité que le profil désigne,
chacun avec un identifiant stable, une sévérité et un critère de fermeture.
Un chantier qui n'est pas celui de la sécurité ne relance pas d'audit : il
relaie ce qu'il voit.

Un audit complet part d'un **modèle de menace** court — actifs à protéger,
qui pourrait les vouloir, par où on entre, ce qui protège chaque entrée — et
se refait avant une première mise en production, après un changement
d'architecture ou d'exposition, et à la fréquence que fixe le profil.

## Sauvegardes

La référence est la sauvegarde de l'hébergeur pour ce qu'il héberge. Ne pas
affirmer qu'une base est couverte sans l'avoir mesuré. Un code HTTP 200 n'est
pas la preuve qu'une sauvegarde a réussi.
