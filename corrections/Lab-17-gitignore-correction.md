# Correction - Lab 17 : .gitignore et gestion des fichiers

### Étapes 1-2
```bash
mkdir -p ~/git-formation/lab-gitignore-pro && cd ~/git-formation/lab-gitignore-pro
git init
mkdir node_modules && echo "lib" > node_modules/lib.js
echo "SECRET_KEY=abc123" > .env
echo "erreur du jour" > debug.log
touch .DS_Store
echo "console.log('app')" > app.js
git status    # tout apparaît en untracked, y compris les fichiers sensibles
```

### Étapes 3-5
```bash
cat > .gitignore << 'EOF2'
# Dépendances
node_modules/

# Secrets
.env

# Logs
*.log
!important.log

# Fichiers système
.DS_Store
EOF2

git status
git check-ignore -v .env
git check-ignore -v node_modules/lib.js
git check-ignore -v debug.log

echo "log important à garder" > important.log
git status    # important.log apparaît malgré la règle "*.log", grâce à l'exception "!"
```

### Étape 6
```bash
git add .gitignore app.js important.log
git status    # vérification finale avant commit : aucun secret listé
git commit -m "chore: initialise le projet avec .gitignore complet"
```

### Étapes 7-8
```bash
cd ~/git-formation
mkdir lab-gitignore-fix2 && cd lab-gitignore-fix2
git init
echo "API_KEY=vrai-secret-de-prod" > .env
git add . && git commit -m "Initial commit (erreur : .env inclus)"

echo ".env" > .gitignore
git rm --cached .env
git add .gitignore
git commit -m "fix: retire .env du suivi futur"

git log -p -- .env    # le secret est toujours visible dans le commit précédent
git ls-files           # .env n'apparaît plus dans les fichiers actuellement suivis
```

## Réponses aux questions théoriques

1. Git évalue les règles d'un `.gitignore` **dans l'ordre où elles apparaissent** : une règle plus spécifique placée **après** une règle plus générale peut créer une exception à celle-ci grâce au préfixe `!`. Ainsi `*.log` ignore tous les fichiers `.log`, mais la ligne suivante `!important.log` réintroduit explicitement ce fichier précis dans le suivi.

2. Dans l'ordre strict des priorités : **(1)** révoquer/régénérer immédiatement la clé API compromise auprès du fournisseur concerné - c'est la seule action qui neutralise réellement le risque, quelle que soit la suite ; **(2)** retirer le fichier du suivi futur (`git rm --cached` + `.gitignore`) ; **(3)** envisager, si nécessaire et en coordination avec l'équipe, une réécriture complète de l'historique avec `git filter-repo` (Module 20) pour faire disparaître toute trace du secret dans les commits passés.
