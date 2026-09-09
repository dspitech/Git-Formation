# Correction - Lab 15 : Stash et travail temporaire

### Étapes 1-2
```bash
mkdir -p ~/git-formation/lab-stash-pro && cd ~/git-formation/lab-stash-pro
git init
echo "version stable" > app.txt
git add . && git commit -m "Initial commit"

echo "travail en cours" >> app.txt
git stash save "WIP: travail en cours sur app.txt"
```

### Étapes 3-5
```bash
echo "encore du travail" >> app.txt
echo "fichier temporaire" > nouveau.txt
git stash save -u "WIP: app.txt + nouveau fichier"

echo "correction urgente" >> app.txt
git add . && git commit -m "fix: correction urgente"

git stash pop
ls    # nouveau.txt est de retour
```

### Étape 6
```bash
echo "modif 1" >> app.txt
git stash save "Modification 1"
echo "modif 2" >> app.txt
git stash save "Modification 2"
echo "modif 3" >> app.txt
git stash save "Modification 3"

git stash list
git stash show stash@{1}
git stash apply stash@{1}
```

### Étape 7
```bash
git stash list
echo "changement conflictuel" >> app.txt
git add . && git commit -m "feat: changement sur app.txt"
git stash pop stash@{0}
# → conflit probable
cat app.txt
# résolution manuelle
git add app.txt
git status    # le stash reste dans la pile car pop a échoué à se retirer automatiquement
```

### Étape 8
```bash
git stash list
git stash clear
```

## Réponses aux questions théoriques

1. Les fichiers untracked sont, par définition, **inconnus de Git** : les inclure systématiquement dans chaque stash risquerait de mélanger des fichiers totalement indépendants du travail en cours (fichiers temporaires de l'éditeur, artefacts de build...). Git préfère laisser ce choix explicite via `-u`, pour éviter des stash "fourre-tout" indésirables par défaut.

2. Non : si `git stash pop` rencontre un conflit, Git **ne retire pas** automatiquement le stash de la pile, précisément pour ne pas perdre le contenu en cas d'échec de fusion. Il faut résoudre le conflit manuellement, puis supprimer explicitement le stash avec `git stash drop` une fois certain que tout le contenu a bien été récupéré.
