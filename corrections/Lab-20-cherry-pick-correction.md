# Correction - Lab 20 : Cherry-pick

### Étapes 1-2
```bash
mkdir -p ~/git-formation/lab-cherry-pro && cd ~/git-formation/lab-cherry-pro
git init
echo "v1" > app.txt && git add . && git commit -m "feat: version initiale"
git checkout -b dev
echo "feature A" >> app.txt && git add . && git commit -m "feat: fonctionnalité A (inachevée)"
echo "fix1" >> app.txt && git add . && git commit -m "fix: correctif de sécurité 1"
echo "fix2" >> app.txt && git add . && git commit -m "fix: correctif de sécurité 2"
echo "feature B" >> app.txt && git add . && git commit -m "feat: fonctionnalité B (inachevée)"
git log --oneline
```

### Étapes 3-5
```bash
FIX1=$(git log --oneline --grep="correctif de sécurité 1" --format=%H)
FIX2=$(git log --oneline --grep="correctif de sécurité 2" --format=%H)

git checkout main
git cherry-pick -x $FIX1
git cherry-pick $FIX1..$FIX2    # applique tout ce qui suit FIX1 jusqu'à FIX2 inclus (ici juste FIX2)
cat app.txt    # uniquement les deux correctifs
```

### Étape 6
```bash
echo "ligne partagee - version main" > partage.txt
git add . && git commit -m "feat: version main de partage.txt"
git checkout dev
echo "ligne partagee - version dev" > partage.txt
git add . && git commit -m "feat: version dev de partage.txt"
git checkout main
git cherry-pick $(git log dev --oneline -1 --format=%H)
# conflit :
echo "ligne partagee - fusionnee" > partage.txt
git add partage.txt
git cherry-pick --continue
```

### Étapes 7-8
```bash
git tag -a v1.0.1 -m "Correctifs de sécurité intégrés"
git log -1
# → le message du commit FIX1 contient "(cherry picked from commit <hash>)"
```

## Réponses aux questions théoriques

1. `-x` laisse une **trace explicite et auditable** de la provenance du commit dans son propre message. En cas de backport vers plusieurs branches de version (LTS, release/2.x, release/3.x), cette traçabilité permet de savoir immédiatement, des mois plus tard, quel commit d'origine chaque backport reproduit - essentiel pour un audit de sécurité ou une revue de conformité.

2. Si `dev` est fusionnée plus tard dans `main` avec un `merge` classique, Git tentera de réintégrer les commits de correctifs déjà cherry-pickés. Comme leur **contenu** est strictement identique à ce qui existe déjà sur `main` (même si le hash diffère), Git détecte généralement qu'il n'y a plus de changement réel à appliquer pour ces commits précis et ne crée pas de conflit ni de duplication visible dans le contenu final - mais l'historique affichera tout de même les deux commits (celui cherry-pické et l'original) comme des entrées distinctes.
