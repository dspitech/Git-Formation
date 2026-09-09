# Correction - Lab 01 : Installation et configuration de Git

### Étapes 1-4
```bash
git --version
git config --global user.name "Alex Dupont"
git config --global user.email "alex.dupont@exemple.com"
git config --global color.ui auto
git config --global init.defaultBranch main
git config --global alias.st status
git config --global alias.lg "log --oneline --graph --all"
```

### Étape 5
```bash
mkdir -p ~/git-formation/verif-config && cd ~/git-formation/verif-config
git init
echo "test" > fichier.txt
git add . && git commit -m "chore: premier commit de test"
git lg
```
**Explication :** `git lg` déclenche exactement `git log --oneline --graph --all` grâce à l'alias configuré en `--global` : il fonctionne donc dans **tous** vos dépôts, y compris ce nouveau dépôt de test.

### Étape 6
```bash
git config --show-origin user.name
git config --show-origin alias.st
```
Les deux pointent vers `~/.gitconfig` (fichier global).

### Étape 7
```bash
git config --local user.email "alex.dupont@client-x.com"
git config --show-origin user.email
# → pointe désormais vers .git/config (local), et non plus ~/.gitconfig
git config user.email
# → affiche "alex.dupont@client-x.com" : le local l'emporte sur le global
```
**Explication :** la Staging Area de configuration suit exactement la même hiérarchie que celle des fichiers : `--local` est le niveau le plus spécifique et l'emporte toujours sur `--global` en cas de conflit de valeur pour la même clé.

## Réponses aux questions théoriques

1. Le `user.name` (qui change rarement) est un bon candidat pour `--global`. Le `user.email`, lui, doit être défini en `--local` dans **chaque** dépôt client, pour que chaque projet committe avec l'adresse professionnelle correspondante, sans jamais mélanger les identités entre clients.

2. Selon la version de Git, soit le commit est refusé avec une erreur explicite, soit il est accepté mais associé à une identité générique/incohérente (dépendant de l'OS et de la configuration système) - dans les deux cas, cela pollue l'historique et complique l'attribution des changements, un problème d'autant plus grave que l'historique est difficile à corriger a posteriori une fois partagé.
