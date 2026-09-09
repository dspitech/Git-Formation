# Correction - Lab 18 : Capstone Partie 4 - Nettoyage et versioning

### Étape 1
```bash
mkdir -p ~/git-formation/lib-versionnee && cd ~/git-formation/lib-versionnee
git init
cat > .gitignore << 'EOF2'
node_modules/
*.env
*.log
EOF2
git add . && git commit -m "chore: initialise le projet avec .gitignore"
```

### Étape 2
```bash
echo "feat1" > lib.txt
git add . && git commit -m "feat: première fonctionnalité"
git tag -a v1.0.0 -m "Première version stable"
```

### Étape 3 (simulation d'un commit déjà partagé cassé)
```bash
mkdir -p ~/git-formation/serveur-lib && cd ~/git-formation/serveur-lib
git init --bare lib.git
cd ~/git-formation/lib-versionnee
git remote add origin ~/git-formation/serveur-lib/lib.git
git push -u origin main --tags

echo "CASSE" > lib.txt
git add . && git commit -m "feat: change lib.txt (casse tout par erreur)"
git push

git revert HEAD
git push
```

### Étape 4
```bash
echo "nouvelle fonctionnalité en cours" >> lib.txt
git stash save "WIP: nouvelle fonctionnalité"

echo "correctif urgence" >> lib.txt
git add . && git commit -m "fix: correctif urgent en production"
git tag -a v1.0.1 -m "Correctif d'urgence"
git push --follow-tags

git stash pop
```

### Étape 5
```bash
echo "API_KEY=oups" > secrets.env
git add . && git commit -m "oups: ajoute un fichier de secrets par erreur"
# 3 commits plus tard dans cette session (simulé directement ici) :
echo "secrets.env" >> .gitignore
git rm --cached secrets.env
git add .gitignore
git commit -m "fix: retire secrets.env du suivi"
```

### Étape 6
```bash
echo "fonctionnalité terminée" >> lib.txt
git add . && git commit -m "feat: termine la nouvelle fonctionnalité"
git tag -a v1.1.0 -m "Nouvelle fonctionnalité complète"
git push --follow-tags
```

### Étape 7 (erreur volontaire, non corrigée ici)
```bash
git reset --hard HEAD~1
# Ce commit important semble perdu : sera récupéré au Lab 25 (Partie 5) via reflog
```

### Étape 8
```bash
git tag
git show v1.0.0
git show v1.0.1
```

## Réponses aux questions théoriques

1. Le commit cassé avait déjà été **poussé** vers le dépôt distant (simulant qu'il était potentiellement récupéré par d'autres). `reset` aurait réécrit l'historique local d'une façon incompatible avec ce qui existe sur le distant, obligeant à un `push --force` risqué. `revert` ajoute au contraire un nouveau commit d'annulation, sans jamais toucher à l'historique déjà partagé - la seule option réellement sûre dans ce contexte.

2. La correction de l'étape 5 (`.gitignore` + `rm --cached`) empêche uniquement le **suivi futur** du fichier : le contenu de `secrets.env` reste parfaitement visible dans le commit "oups" resté dans l'historique. Seul le **Module 20** (`git filter-repo`) permet de faire disparaître complètement ce contenu de tout l'historique, y compris des commits passés déjà créés.
