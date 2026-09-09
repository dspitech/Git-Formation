# Correction - Lab 05 : Capstone Partie 1 - Journal de bord

### Étapes 1-2
```bash
git config --global alias.lg "log --oneline --graph --all"
mkdir -p ~/git-formation/journal-pro && cd ~/git-formation/journal-pro
git init

printf "Réunion d'équipe le matin\nAvancement sur le projet X\n" > lundi.md
git add . && git commit -m "feat: ajoute le journal du lundi"

printf "Suite du projet X\nPoint client\n" > mardi.md
git add . && git commit -m "feat: ajoute le journal du mardi"

printf "Bilan mi-semaine\nCorrections diverses\n" > mercredi.md
git add . && git commit -m "feat: ajoute le journal du mercredi"

printf "Préparation démo\nTests\n" > jeudi.md
git add . && git commit -m "feat: ajoute le journal du jeudi"

printf "Bilan de semaine\nPlanification suivante\n" > vendredi.md
git add . && git commit -m "feat: ajoute le journal du vendredi"
```

### Étape 3
```bash
sed -i 's/le matin/le matin (9h)/' lundi.md
git add . && git commit -m "fix: précise l'heure de la réunion du lundi"
```

### Étape 4
```bash
echo "Note additionnelle A" >> jeudi.md
echo "Note additionnelle B" >> jeudi.md
git add -p jeudi.md
git commit -m "docs: ajoute la note A du jeudi"
git add jeudi.md
git commit -m "docs: ajoute la note B du jeudi"
```

### Étape 5
```bash
git mv lundi.md jour-01-lundi.md
git mv mardi.md jour-02-mardi.md
git mv mercredi.md jour-03-mercredi.md
git mv jeudi.md jour-04-jeudi.md
git mv vendredi.md jour-05-vendredi.md
git commit -m "chore: renomme les fichiers du journal avec un préfixe numéroté"
```

### Étapes 6-7
```bash
git log --oneline | wc -l
git log --oneline --grep="feat" | wc -l
git log --follow --oneline -- jour-04-jeudi.md

FIRST=$(git log --oneline | tail -1 | cut -d' ' -f1)
git diff $FIRST HEAD
```

### Étape 8
```bash
git tag v1-semaine-1
git tag
```

## Réponses aux questions théoriques

1. Des commits séparés par jour permettent de **revenir précisément** à l'état du projet à n'importe quel moment de la semaine, de comprendre l'évolution jour après jour, et de faciliter un éventuel `revert` ciblé sur un seul jour sans affecter les autres - un unique gros commit "toute la semaine" aurait fait perdre toute cette granularité et cette traçabilité.

2. Un historique avec des messages clairs, au format Conventional Commits, des renommages proprement effectués via `git mv` (préservant l'historique du fichier malgré le changement de nom), et une utilisation pertinente de `git add -p` pour isoler des changements distincts, démontre une **rigueur professionnelle** immédiatement reconnaissable par un recruteur technique - bien plus qu'un historique de gros commits vagues type "update" ou "wip".
