#!/bin/sh
# Contrôle statique du socle : structure des skills et agents, cohérence des
# numéros de version, et aucune référence à une installation particulière.
# Inspection de fichiers seulement : aucun test exécuté, aucun réseau.
set -u
cd "$(dirname "$0")/.." || exit 2
echecs=0
ko() { echo "KO   $1"; echecs=$((echecs + 1)); }
ok() { echo "ok   $1"; }

champ() { # champ <fichier> <nom> : valeur d'un champ du frontmatter
  awk -v k="$2" 'NR==1 && $0!="---"{exit} NR>1 && $0=="---"{exit} NR>1 && index($0,k": ")==1{sub(k": ",""); print; exit}' "$1"
}

# 1. Skills : frontmatter avec name == dossier, et une description.
for f in plugins/*/skills/*/SKILL.md; do
  d=$(basename "$(dirname "$f")")
  [ "$(champ "$f" name)" = "$d" ] || ko "$f : name différent du dossier ($d)"
  [ -n "$(champ "$f" description)" ] || ko "$f : description absente"
done
ok "skills : $(ls plugins/*/skills/*/SKILL.md | wc -l | tr -d ' ') contrôlées"

# 2. Agents : name == nom du fichier, description, et skills citées existantes.
for f in plugins/*/agents/*.md; do
  n=$(basename "$f" .md)
  [ "$(champ "$f" name)" = "$n" ] || ko "$f : name différent du fichier"
  [ -n "$(champ "$f" description)" ] || ko "$f : description absente"
  plugin=$(echo "$f" | cut -d/ -f2)
  for s in $(champ "$f" skills | tr ',' ' '); do
    [ -f "plugins/$plugin/skills/$s/SKILL.md" ] || ko "$f : skill inconnue « $s »"
  done
done
ok "agents : $(ls plugins/*/agents/*.md | wc -l | tr -d ' ') contrôlés"

# 3. Liens relatifs des fichiers Markdown du socle.
for f in $(find plugins -name '*.md'); do
  for cible in $(grep -oE '\]\([^)#:]+\)' "$f" | sed 's/^](//; s/)$//'); do
    [ -e "$(dirname "$f")/$cible" ] || ko "$f : lien cassé vers $cible"
  done
done
ok "liens relatifs"

# 4. JSON valides et versions égales à VERSION (source unique).
version=$(cat VERSION)
for j in .claude-plugin/marketplace.json plugins/*/.claude-plugin/plugin.json; do
  python3 -I -c 'import json,sys; json.load(open(sys.argv[1]))' "$j" 2>/dev/null || { ko "$j : JSON invalide"; continue; }
  for v in $(grep -oE '"version": *"[^"]+"' "$j" | sed 's/.*"\([^"]*\)"$/\1/'); do
    [ "$v" = "$version" ] || ko "$j : version $v ≠ VERSION $version"
  done
done
ok "manifestes et version $version"

# 5. Instructions : CLAUDE.md n'est que l'import de AGENTS.md.
[ "$(tr -d '[:space:]' < CLAUDE.md)" = "@AGENTS.md" ] || ko "CLAUDE.md n'est pas le seul import @AGENTS.md"

# 6. Généricité. Le socle ne nomme aucune installation : ni chemin personnel,
#    ni adresse IP privée, ni domaine réel. Les termes propres à une
#    installation donnée se listent HORS du dépôt (sinon la liste les
#    publierait) : $SOCLE_TERMES_INTERDITS, ou
#    ~/.config/socle-agents/termes-interdits.txt (un motif par ligne).
cherche() { grep -rnIE "$1" --exclude-dir=.git --exclude=.git . || true; }
signale() { if [ -n "$2" ]; then ko "$1 :"; echo "$2" | sed 's/^/       /'; else ok "aucun(e) $1"; fi; }
signale "chemin personnel" "$(cherche '(/Users/|/home/)[A-Za-z0-9._-]+')"
signale "adresse IP privée" "$(cherche '\b(10\.[0-9]+|192\.168|172\.(1[6-9]|2[0-9]|3[01]))\.[0-9]+\.[0-9]+\b')"
signale "domaine réel" "$(cherche '\b[a-z0-9-]+\.(be|fr|com|net|org|io|dev|test|local)\b' | grep -vE '(example\.(com|org|net)|\b(AGENTS|CLAUDE|GEMINI|SKILL)\.md|json\.load)' || true)"
termes=${SOCLE_TERMES_INTERDITS:-$HOME/.config/socle-agents/termes-interdits.txt}
if [ -f "$termes" ]; then
  motif=$(grep -vE '^(#|$)' "$termes" | paste -sd'|' -)
  [ -n "$motif" ] && signale "terme propre à une installation" "$(grep -rniIE "$motif" --exclude-dir=.git --exclude=.git . || true)"
else
  echo "--   liste locale de termes interdits absente ($termes) : contrôle partiel"
fi

[ "$echecs" -eq 0 ] && echo "VERT" || { echo "ROUGE ($echecs)"; exit 1; }
