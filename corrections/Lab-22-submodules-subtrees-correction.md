# Correction - Lab 22 : Submodules et Subtrees

### Étapes 1-3
```bash
mkdir -p ~/git-formation/lib-partagee && cd ~/git-formation/lib-partagee
git init
echo "function util(){ return 1; }" > utils.js
git add . && git commit -m "Initial commit"

cd ~/git-formation
mkdir projet-alpha && cd projet-alpha
git init
echo "# Projet Alpha" > README.md
git add . && git commit -m "Initial commit"
git submodule add ~/git-formation/lib-partagee libs/partagee
git add . && git commit -m "feat: ajoute lib-partagee en submodule"

cd ~/git-formation
mkdir projet-beta && cd projet-beta
git init
echo "# Projet Beta" > README.md
git add . && git commit -m "Initial commit"
git submodule add ~/git-formation/lib-partagee libs/partagee
git add . && git commit -m "feat: ajoute lib-partagee en submodule"
```

### Étapes 4-5
```bash
cd ~/git-formation/lib-partagee
echo "function util(){ return 2; }" > utils.js
git add . && git commit -m "feat: améliore la fonction utilitaire"

cd ~/git-formation/projet-alpha
git submodule update --remote
git add libs/partagee
git commit -m "chore: met à jour lib-partagee vers la dernière version"
```
`projet-beta` reste volontairement sur l'ancien commit du submodule, sans aucune action de sa part.

### Étapes 6-8
```bash
cd ~/git-formation
git clone projet-alpha projet-alpha-clone
cd projet-alpha-clone
ls libs/partagee    # vide

git submodule update --init --recursive
ls libs/partagee     # contenu présent

cd ~/git-formation
git clone --recurse-submodules projet-beta projet-beta-clone
ls projet-beta-clone/libs/partagee    # contenu présent directement, sans étape supplémentaire
```

## Réponses aux questions théoriques

1. Un submodule référence un **commit précis**, pas une branche : chaque projet parent choisit librement quand et vers quel commit de `lib-partagee` il souhaite pointer, exactement comme deux applications peuvent dépendre de deux versions différentes de la même librairie externe via un gestionnaire de paquets classique.

2. Un subtree serait préférable si l'on souhaite que **tout nouveau contributeur** clone le projet en une seule commande sans jamais avoir à se soucier d'une étape d'initialisation supplémentaire (`submodule update --init`), au prix d'un historique parent plus volumineux et d'une mise à jour de la bibliothèque un peu plus complexe en ligne de commande.
