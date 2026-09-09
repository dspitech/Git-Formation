# Correction - Lab 06 : Branches, fast-forward vs merge commit

### Étapes 1-2
```bash
mkdir -p ~/git-formation/lab-portfolio && cd ~/git-formation/lab-portfolio
git init
echo "<h1>Mon Portfolio</h1>" > index.html
git add . && git commit -m "feat: page d'accueil initiale"

git checkout -b section-projets
echo "<h2>Mes projets</h2>" > projets.html
git add . && git commit -m "feat: ajoute la section projets"
git checkout main
git merge section-projets
git log --oneline --graph      # aucun commit de merge : fast-forward
```

### Étapes 3-4
```bash
git checkout -b section-contact
git checkout main
echo "<!-- meta -->" >> index.html
git add . && git commit -m "feat: ajoute une meta description"

git checkout section-contact
echo "<h2>Contact</h2>" > contact.html
git add . && git commit -m "feat: ajoute la section contact"
git checkout main
git merge --no-ff section-contact -m "merge: intègre la section contact"
```

### Étape 5
```bash
git checkout -b section-experience
echo "<h2>Expérience</h2>" > experience.html
git add . && git commit -m "feat: ajoute la section expérience"
git checkout main
git merge --no-ff section-experience -m "merge: intègre la section expérience (forcé)"
```

### Étapes 6-8
```bash
git log --oneline --graph --all
git branch -d section-projets section-contact section-experience
git log --merges --oneline
```
**Observation attendue :** la fusion de `section-projets` (étape 2) ne laisse **aucune trace de jonction** dans le graphe (fast-forward pur). Celle de `section-contact` (étape 4) montre une jonction car `main` avait divergé (meta description ajoutée entre-temps) : merge commit **naturel**. Celle de `section-experience` (étape 5) montre aussi une jonction, mais uniquement parce que `--no-ff` l'a **forcée** - un fast-forward aurait été possible sans cette option.

## Réponses aux questions théoriques

1. Parce qu'à l'étape 3, `main` a reçu un nouveau commit (la meta description) **pendant** que `section-contact` était développée. Les deux branches ont donc réellement divergé : il n'existe plus de chemin linéaire unique entre elles, ce qui oblige Git à créer un commit à deux parents pour représenter la réunion des deux historiques - indépendamment de toute option choisie.

2. Forcer `--no-ff` garde une **trace visuelle explicite** de chaque fonctionnalité intégrée dans l'historique, même quand elle aurait pu être absorbée silencieusement par un fast-forward. C'est utile pour les équipes qui veulent pouvoir identifier, rétrospectivement, à quel moment précis et par quel ensemble de commits chaque fonctionnalité a été livrée.
