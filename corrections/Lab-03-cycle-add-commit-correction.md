# Correction - Lab 03 : Cycle add/commit, add -p, amend

### Étape 1
```bash
mkdir -p ~/git-formation/lab-todolist && cd ~/git-formation/lab-todolist
git init
printf "Acheter du pain\nAppeler le client\nFinir le rapport\n" > taches.txt
git add . && git commit -m "feat: ajoute la liste de tâches initiale"
```

### Étape 2
```bash
echo "Répondre aux emails" >> taches.txt
echo "Préparer la réunion" >> taches.txt
sed -i 's/Acheter du pain/Acheter du pain complet/' taches.txt   # (sous macOS : sed -i '' ...)

git add -p taches.txt
# Répondre "y" au hunk correspondant à la modification "pain complet"
git commit -m "fix: précise le type de pain à acheter"

git add taches.txt
git commit -m "feat: ajoute deux nouvelles tâches"
```

### Étape 3
```bash
git mv taches.txt todo.txt
git commit -m "chore: renomme taches.txt en todo.txt"
```

### Étape 4
```bash
echo "brouillon inutile" > brouillon.txt
git add . && git commit -m "wip"
git rm brouillon.txt
git commit -m "chore: supprime le fichier de brouillon inutile"
```

### Étape 5
```bash
git commit --amend -m "chore: supprime le fichier de brouillon superflu"
```

### Étape 6
```bash
git commit --allow-empty -m "chore: jalon - liste de tâches de base terminée"
```

### Étape 7
```bash
git log --oneline
```

## Réponses aux questions théoriques

1. `git add -p` permet de **découper** un fichier en portions logiques (hunks) et de choisir précisément lesquelles entrent dans le commit courant. Sans cela, `git add fichier.txt` embarque **toutes** les modifications du fichier dans un seul commit, même si elles concernent des sujets totalement différents - ce qui nuit à la lisibilité et à la possibilité de revert ciblé plus tard.

2. Un commit vide sert de **marqueur** dans l'historique : jalon de sprint, déclenchement volontaire d'un pipeline CI/CD (certains pipelines se déclenchent sur tout nouveau commit, même sans changement de fichier), ou point de repère pour une future recherche `git bisect`.
