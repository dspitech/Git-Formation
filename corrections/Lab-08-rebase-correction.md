# Correction - Lab 08 : Rebase

### Étapes 1-4
```bash
mkdir -p ~/git-formation/lab-rebase-compare && cd ~/git-formation/lab-rebase-compare
git init
echo "base" > config.txt
git add . && git commit -m "Initial commit"

git checkout -b feature-y
echo "feature-y" >> config.txt
git add . && git commit -m "feat: config pour feature Y"

git checkout main
echo "main-update" >> config.txt
git add . && git commit -m "fix: mise à jour urgente sur main"

cd ..
cp -r lab-rebase-compare lab-rebase-compare-copie
```

### Étape 5 (dossier original - merge)
```bash
cd lab-rebase-compare
git checkout main
git merge feature-y
# résoudre le conflit si besoin
git log --oneline --graph --all
```

### Étape 6 (copie - rebase)
```bash
cd ../lab-rebase-compare-copie
git checkout feature-y
git rebase main
# en cas de conflit :
cat config.txt
echo "base
main-update
feature-y" > config.txt
git add config.txt
git rebase --continue
git checkout main
git merge feature-y      # fast-forward désormais
git log --oneline --graph --all
```

### Étape 7
**Différences observées :**
- Le dépôt **merge** montre un commit à deux parents, avec une bifurcation clairement visible dans le graphe.
- Le dépôt **rebase** montre un historique **parfaitement linéaire**, sans aucune trace visuelle de la divergence d'origine - bien que le contenu final soit identique.

### Étape 8
```bash
cd ../lab-rebase-compare-copie
git checkout feature-y
echo "encore feature-y" >> config.txt
git add . && git commit -m "feat: complète feature Y"
git rebase main
```
Seul le **nouveau** commit ("feat: complète feature Y") est rejoué : celui déjà rebasé précédemment reste inchangé, car il fait déjà partie de l'historique de `main` depuis le premier rebase.

## Réponses aux questions théoriques

1. Git ne rejoue que les commits présents sur `feature-y` mais **absents** de `main` : après le premier rebase et la fusion fast-forward, les anciens commits de `feature-y` font désormais partie intégrante de `main`. Seul le commit ajouté après coup est encore "en trop" par rapport à `main`, donc seul celui-ci est rejoué au second rebase.

2. C'est dans la version **merge** qu'on peut identifier précisément, en lisant le graphe, le commit de fusion exact et donc le moment où `feature-y` a rejoint `main`. Dans la version rebasée, cette information de "moment d'intégration" est perdue visuellement : l'historique paraît comme si tout avait été développé séquentiellement sur une seule ligne.
