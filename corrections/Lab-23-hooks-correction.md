# Correction - Lab 23 : Hooks Git

### Étapes 1-3
```bash
mkdir -p ~/git-formation/lab-hooks-pro && cd ~/git-formation/lab-hooks-pro
git init

cat > .git/hooks/pre-commit << 'HOOK'
#!/bin/bash
if git diff --cached | grep -E "^\+.*(TODO|FIXME)" > /dev/null; then
  echo "Commit bloqué : TODO ou FIXME détecté dans les lignes ajoutées."
  exit 1
fi
exit 0
HOOK
chmod +x .git/hooks/pre-commit

echo "// FIXME: à corriger" > app.js
git add . && git commit -m "ajoute app.js"    # refusé

echo "// code propre" > app.js
git add . && git commit -m "feat: ajoute app.js"    # accepté
```

### Étapes 4-5
```bash
cat > .git/hooks/commit-msg << 'HOOK'
#!/bin/bash
MESSAGE=$(cat "$1")
PATTERN="^(feat|fix|docs|style|refactor|test|chore)(\(.+\))?: .+"
[[ "$MESSAGE" =~ $PATTERN ]] || { echo "Format invalide."; exit 1; }
exit 0
HOOK
chmod +x .git/hooks/commit-msg

echo "test" >> app.js && git add . && git commit -m "ajout test"          # refusé
git commit -m "test: ajoute une ligne de test"                              # accepté
```

### Étapes 6-7
```bash
cat > .git/hooks/pre-push << 'HOOK'
#!/bin/bash
if [ -f "WIP.txt" ]; then
  echo "Push bloqué : un fichier WIP.txt existe encore à la racine."
  exit 1
fi
exit 0
HOOK
chmod +x .git/hooks/pre-push

echo "travail en cours" > WIP.txt
git add . && git commit -m "chore: ajoute un fichier WIP temporaire"
# tentative de push (sur un remote configuré) → refusée
# contournement documenté :
git push --no-verify   # justifié ici uniquement car il s'agit d'un test pédagogique, jamais en situation réelle sans revue
```

### Étape 8
**Stratégie de partage :** stocker les scripts dans un dossier versionné du dépôt, par exemple `scripts/git-hooks/`, accompagné d'un script d'installation (`install-hooks.sh`) qui les copie ou les symlink vers `.git/hooks/` après un `git clone`. Pour les projets Node.js, l'outil **Husky** automatise entièrement cette installation dès le premier `npm install`.

## Réponses aux questions théoriques

1. `pre-commit` s'exécute à **chaque** commit, potentiellement plusieurs dizaines de fois par jour et par développeur : une vérification lente (suite de tests complète, build) y ralentirait considérablement le flux de travail quotidien. `pre-push` s'exécute beaucoup moins fréquemment (une fois par envoi vers le distant), ce qui en fait le moment approprié pour des vérifications plus coûteuses.

2. Si `--no-verify` devient un réflexe trop facile ou trop fréquent dans une équipe, les hooks perdent totalement leur utilité : ils ne font plus respecter aucune règle réelle, puisque chacun peut les contourner sans justification ni trace. La discipline d'équipe doit accompagner l'outil technique - un `--no-verify` devrait rester rare et systématiquement justifié, idéalement documenté dans le message de commit lui-même.
