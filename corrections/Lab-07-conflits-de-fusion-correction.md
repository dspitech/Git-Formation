# Correction - Lab 07 : Résolution de conflits de fusion

### Étapes 1-4
```bash
cd ~/git-formation/lab-portfolio
git checkout -b titre-v2
sed -i 's/Mon Portfolio/Mon Portfolio Créatif/' index.html
git add . && git commit -m "feat: titre plus évocateur"

git checkout main
sed -i 's/Mon Portfolio/Portfolio Professionnel/' index.html
git add . && git commit -m "feat: titre plus formel"

git merge titre-v2
cat index.html
# résolution combinée :
sed -i '1s/.*/<h1>Portfolio Professionnel et Créatif<\/h1>/' index.html
git add index.html
git commit
```

### Étape 5
```bash
git checkout -b couleurs-v2
echo "body { color: blue; }" > style.css
git add . && git commit -m "feat: couleur bleue"
git checkout main
echo "body { color: green; }" > style.css
git add . && git commit -m "feat: couleur verte"
git merge couleurs-v2
git checkout --ours style.css
git add style.css
git commit
cat style.css        # "green" conservée : version de main (courante)
```

### Étapes 6-7
```bash
git checkout -b conflit-abort-test
echo "Version A" > contact.html
git add . && git commit -m "test: version A"
git checkout main
echo "Version B" > contact.html
git add . && git commit -m "test: version B"
git merge conflit-abort-test
git status                # conflit détecté
git merge --abort
git status                # propre
cat contact.html           # revenu exactement à "Version B"
```

## Réponses aux questions théoriques

1. Git n'a **aucune connaissance métier** du contenu qu'il manipule : il ne sait pas si "Portfolio Professionnel" est préférable à "Mon Portfolio Créatif" pour un humain. Il détecte uniquement que deux versions incompatibles existent pour les mêmes lignes, et laisse la décision - qui requiert un jugement humain - à la personne qui résout le conflit.

2. `--ours`/`--theirs` est légitime quand on sait avec certitude qu'**une des deux versions doit intégralement l'emporter**, sans combinaison possible ou souhaitée (ex. un fichier de configuration généré automatiquement, où la version la plus récente doit toujours primer). Dès qu'une combinaison des deux contenus a du sens (ce qui est le cas le plus fréquent), la résolution manuelle ligne par ligne reste préférable.
