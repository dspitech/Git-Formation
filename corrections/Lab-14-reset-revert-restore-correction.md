# Correction - Lab 14 : reset, revert, restore

### Étapes 1-4
```bash
mkdir -p ~/git-formation/lab-annulation && cd ~/git-formation/lab-annulation
git init
for v in v1 v2 v3 v4; do echo "$v" > data.txt && git add . && git commit -m "commit $v"; done

git reset --soft HEAD~1
git status                # "v4" repassé en staged
git commit -m "commit v4 (recréé)"

git reset HEAD~1
git status                # "v4" modifié, NON stagé
git add . && git commit -m "commit v4 (recréé à nouveau)"

git reset --hard HEAD~1
cat data.txt               # revenu à "v3" : contenu perdu
```

### Étape 5
```bash
echo "essai non voulu" >> data.txt
git restore data.txt
git status                 # propre

echo "autre essai" >> data.txt
git add data.txt
git restore --staged data.txt
cat data.txt                # contenu toujours présent
git restore data.txt
git status                  # propre, tout annulé
```

### Étape 6
```bash
echo "config stable" > config.txt
git add . && git commit -m "config initiale"
echo "config CASSEE" > config.txt
git add . && git commit -m "feat: config cassée par erreur"
git revert HEAD
cat config.txt
```

### Étape 7
```bash
git checkout -b branche-cassee
echo "cassure" >> data.txt
git add . && git commit -m "feat: change data.txt (cassera main)"
git checkout main
git merge branche-cassee -m "merge: intègre branche-cassee"
git revert -m 1 HEAD
cat data.txt
```

### Étape 8
```bash
git log --oneline
```

## Réponses aux questions théoriques

1. `reset --soft` est préférable quand vous souhaitez **reconstruire immédiatement** un commit différent à partir du même contenu déjà stagé - par exemple pour fusionner plusieurs petits commits consécutifs en un seul, sans avoir à re-sélectionner manuellement les fichiers avec `git add`.

2. Un commit de merge possède **deux parents** (l'un sur chaque branche fusionnée). `git revert` doit savoir par rapport à **lequel des deux** il doit calculer l'annulation (généralement le premier parent, `-m 1`, qui correspond à la branche sur laquelle on se trouvait avant la fusion) - un commit simple n'ayant qu'un seul parent, cette ambiguïté n'existe pas et `-m` n'est jamais nécessaire.
