# Correction - Lab 13 : Capstone Partie 3 - Collaboration simulée à deux

### Étapes 1-2
```bash
mkdir -p ~/git-formation/serveur-asso && cd ~/git-formation/serveur-asso
git init --bare association-collaborative.git
cd ~/git-formation
git clone serveur-asso/association-collaborative.git dev-vous
git clone serveur-asso/association-collaborative.git dev-collegue

cd dev-vous
echo "# Association Collaborative" > README.md
git add . && git commit -m "chore: initialise le projet"
git push -u origin main
```

### Étapes 3-5
```bash
cd ~/git-formation/dev-vous
git checkout -b feature/actualites
echo "<h1>Actualités</h1>" > actualites.html
git add . && git commit -m "feat: ajoute la page actualités"
git push -u origin feature/actualites

cd ~/git-formation/dev-collegue
git pull
git checkout -b feature/galerie
echo "<h1>Galerie photo</h1>" > galerie.html
git add . && git commit -m "feat: ajoute la page galerie"
git push -u origin feature/galerie

# Le collègue "reviewe" et fusionne votre branche :
git fetch origin
git checkout feature/actualites
cat actualites.html            # inspection
git checkout main
git merge feature/actualites
git push

# Vous synchronisez et intégrez la branche du collègue à votre tour :
cd ~/git-formation/dev-vous
git fetch origin
git checkout main
git pull
git checkout feature/galerie
cat galerie.html
git checkout main
git merge feature/galerie
git push
```

### Étape 6
```bash
cd ~/git-formation/dev-collegue
git pull
echo "Ligne du collègue" >> README.md
git add . && git commit -m "docs: ajoute une ligne (collègue)"
git push

cd ~/git-formation/dev-vous
echo "Ligne de vous" >> README.md
git add . && git commit -m "docs: ajoute une ligne (vous)"
git push
# → rejeté

git pull
# résolution du conflit sur README.md
cat README.md
echo "Ligne de vous et du collègue combinées" >> README.md
git add README.md
git commit
git push
```

### Étape 7
```bash
git checkout main && git pull
git tag -a v1.0.0 -m "Première version collaborative stable"
git push origin --tags
git branch -d feature/actualites feature/galerie
git push origin --delete feature/actualites feature/galerie
```

### Étape 8 (exemple de résumé)
*"Sprint terminé : deux fonctionnalités (actualités, galerie) développées en parallèle par deux contributeurs, revues mutuellement avant fusion, un conflit sur le README résolu proprement en concertation, version 1.0.0 taguée et publiée."*

## Réponses aux questions théoriques

1. Une règle de protection de branche interdisant le push direct sur `main` aurait empêché le collègue de fusionner directement `feature/actualites` sans passer par une vraie Pull Request formelle avec approbation enregistrée - rendant la trace de review beaucoup plus rigoureuse et auditable qu'une simple inspection informelle.

2. Avec 8 développeurs, un **GitHub Flow strict avec Pull Requests obligatoires et CODEOWNERS** (Modules 8 et 21) deviendrait indispensable : la coordination informelle "à la voix" utilisée ici pour 2 personnes ne passe pas à l'échelle, et le risque de conflits simultanés sur les mêmes fichiers augmente fortement sans processus formalisé.
