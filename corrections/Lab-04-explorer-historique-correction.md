# Correction - Lab 04 : Explorer l'historique

### Étapes 1-3
```bash
cd ~/git-formation/lab-todolist
git log --oneline
git log --oneline --graph --all
git log -3
git log --grep="feat"
```

### Étapes 4-5
```bash
echo "Nouvelle tâche urgente" >> todo.txt
git diff                 # montre la ligne ajoutée : NON stagée
git diff --staged        # vide

git add todo.txt
git diff                 # vide désormais
git diff --staged        # montre la ligne ajoutée : STAGÉE

git commit -m "feat: ajoute une tâche urgente"
git show HEAD             # référence relative, pas de hash nécessaire
```

### Étape 6
```bash
FIRST=$(git log --oneline | tail -1 | cut -d' ' -f1)
git diff $FIRST HEAD -- todo.txt
```

### Étape 7
```bash
git blame todo.txt
```
Chaque ligne du fichier est préfixée par le hash court du commit qui l'a introduite, l'auteur et la date - vous identifiez immédiatement l'origine de chaque tâche.

### Étape 8
```bash
git shortlog -sn
```

## Réponses aux questions théoriques

1. `git blame` est le premier réflexe face à une ligne de code (ou de configuration) suspecte en production : elle permet de remonter immédiatement au commit - et donc potentiellement au ticket, à la PR, à l'auteur - qui a introduit cette ligne, pour comprendre le contexte avant de la modifier ou de la corriger.

2. `git diff` (sans option) ne compare que le **Working Directory** à la **Staging Area**. Si toutes les modifications ont déjà été stagées (`git add`), il n'y a plus aucune différence entre ces deux zones précises, et `git diff` affiche donc un résultat vide - la modification existe bien, mais il faut regarder `git diff --staged` pour la voir, car elle compare la Staging Area au dernier commit.
