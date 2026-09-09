# Correction - Lab 19 : Rebase interactif

### Étape 1
```bash
mkdir -p ~/git-formation/lab-rebase-i-pro && cd ~/git-formation/lab-rebase-i-pro
git init
echo "fonction principale" > feature.txt && git add . && git commit -m "ajoute la fonction principale"
echo "fonction principale corrigee" > feature.txt && git add . && git commit -m "fix typo"
echo "tests" >> feature.txt && git add . && git commit -m "WIP tests"
echo "tests corriges" >> feature.txt && git add . && git commit -m "fix des tests"
echo "debug" > debug.txt && git add . && git commit -m "oops fichier debug"
echo "tests finalises" >> feature.txt && git add . && git commit -m "termine les tests"
```

### Étapes 2-6
```bash
git rebase -i HEAD~6
```
Plan modifié :
```
pick a1 ajoute la fonction principale
fixup a2 fix typo
pick a3 WIP tests
fixup a4 fix des tests
drop a5 oops fichier debug
pick a6 termine les tests
```
Lors du `reword` sur "WIP tests" (devenu le résultat du fixup) : `feat: ajoute les tests unitaires`.
Lors du `reword` sur "termine les tests" : `test: finalise la suite de tests`.

### Étape 7
```bash
git log --oneline
ls    # debug.txt n'existe plus
```
Résultat : 3 commits propres (`feat: ajoute la fonction principale`, `feat: ajoute les tests unitaires`, `test: finalise la suite de tests`).

### Étape 8
```bash
git rebase -i HEAD~2
# marquer un commit "edit", puis modifier volontairement le fichier de façon à créer un conflit lors du "continue" avec un cherry-pick concurrent -- ou simplement simuler l'abandon :
git rebase --abort
git log --oneline    # état initial parfaitement restauré
```

## Réponses aux questions théoriques

1. `fixup` fait exactement ce qu'un `reword` suivi d'une suppression manuelle ferait, mais en une seule action native : Git combine le contenu du commit avec le précédent et **jette automatiquement** son message, sans étape supplémentaire ni risque d'erreur de manipulation.

2. Ce rebase aurait réécrit les hash de tous les commits concernés. Le collègue ayant déjà récupéré l'ancienne version de ces commits se serait retrouvé avec un historique **divergent et incompatible** : son prochain `pull` aurait généré des conflits massifs et artificiels, ou pire, une duplication complète des commits si un merge était tenté sans précaution.
