# Correction - Lab 09 : Capstone Partie 2 - Site vitrine multi-branches

### Étapes 1-3
```bash
mkdir -p ~/git-formation/site-vitrine-final && cd ~/git-formation/site-vitrine-final
git init
echo "<h1>Association ABC</h1>" > index.html
git add . && git commit -m "feat: page d'accueil initiale"

git checkout -b page-evenements
echo "<h2>Événements</h2>" > evenements.html
git add . && git commit -m "feat: ajoute la page événements"

git checkout -b page-benevoles main
echo "<h2>Bénévoles</h2>" > benevoles.html
git add . && git commit -m "feat: ajoute la page bénévoles"

git checkout -b page-dons main
echo "<h2>Dons</h2>" > dons.html
git add . && git commit -m "feat: ajoute la page dons"

git checkout main
git merge page-evenements    # fast-forward
```

### Étape 4
```bash
echo '<a href="evenements.html">Événements</a>' >> index.html
git add . && git commit -m "feat: ajoute un lien de navigation"
git merge page-benevoles      # merge commit naturel (main a divergé)
```

### Étape 5
```bash
git checkout page-dons
git rebase main
# résoudre un éventuel conflit puis :
git checkout main
git merge page-dons            # fast-forward
```

### Étape 6
```bash
git checkout -b refonte-titre
sed -i 's/Association ABC/Association ABC - Ensemble pour tous/' index.html
git add . && git commit -m "feat: refonte du titre (créatif)"

git checkout main
sed -i 's/Association ABC/Association ABC - Officielle/' index.html
git add . && git commit -m "feat: refonte du titre (officiel)"

git merge refonte-titre
sed -i '1s/.*/<h1>Association ABC - Officielle, Ensemble pour tous<\/h1>/' index.html
git add index.html
git commit
```

### Étapes 7-8
```bash
git branch -d page-evenements page-benevoles page-dons refonte-titre
git log --oneline --graph --all
```

## Réponses aux questions théoriques

1. Des branches plus courtes et une synchronisation régulière avec `main` (comme le prescrit GitHub Flow) auraient réduit la fenêtre de divergence entre chaque branche et `main`, diminuant mécaniquement le risque et la taille des conflits rencontrés - notamment le conflit sur le titre, qui aurait pu être détecté et réglé bien plus tôt si les deux branches concernées avaient communiqué plus fréquemment avec `main`.

2. Le rebase de `page-dons` était acceptable car cette branche était **strictement locale et personnelle** : elle n'avait jamais été poussée ni récupérée par qui que ce soit d'autre. La règle d'or interdit de rebaser des commits **déjà partagés avec d'autres personnes**, pas le rebase en général - une branche de travail purement locale peut toujours être rebasée sans risque.
