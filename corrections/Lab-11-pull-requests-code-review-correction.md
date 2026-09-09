# Correction - Lab 11 : Pull Requests et code review

> Cette correction propose la variante **GitHub réel**. Pour une variante 100% locale, remplacez chaque « ouvrir une PR sur GitHub » par : pousser la branche vers un second clone jouant le rôle de "reviewer", qui fusionne lui-même après inspection (comme au Lab 10).

### Étapes 1-2
```bash
cd ~/git-formation
mkdir formation-git-atelier && cd formation-git-atelier
git init
echo "# Formation Git Atelier" > README.md
git add . && git commit -m "chore: initialise le projet"
git remote add origin https://github.com/votre-nom/formation-git-atelier.git
git branch -M main
git push -u origin main

git checkout -b feature/page-equipe
echo "<h1>Notre équipe</h1>" > equipe.html
git add . && git commit -m "feat: ajoute la page équipe"
git push -u origin feature/page-equipe
```
Sur GitHub : ouvrez une PR `feature/page-equipe` → `main`.

### Étapes 3-4
Ajoutez un commentaire sur la PR : *"Merci d'ajouter un h1 clair en haut de la page."* Puis :
```bash
echo "<h1>Notre équipe</h1>" | cat - equipe.html > temp && mv temp equipe.html
git add . && git commit -m "fix: ajoute un titre h1 clair"
git push
```
La PR se met à jour automatiquement avec ce nouveau commit, sans rien recréer.

### Étape 5
Sur GitHub : **Merge pull request → Squash and merge**. Résultat : la branche `feature/page-equipe` conservait 2 commits distincts, mais `main` ne reçoit qu'**un seul** nouveau commit combinant les deux.

### Étape 6
```bash
git checkout main && git pull
git checkout -b feature/page-services
echo "<h1>Nos services</h1>" > services.html
git add . && git commit -m "feat: ajoute la page services"
git push -u origin feature/page-services
```
Sur GitHub : **Merge pull request → Rebase and merge**. Résultat : chaque commit de la branche est rejoué **individuellement** sur `main`, sans commit de fusion supplémentaire - contrairement au Squash qui n'en crée qu'un seul combiné.

### Étape 7
```bash
git checkout main && git pull
git branch -d feature/page-equipe feature/page-services
git push origin --delete feature/page-equipe feature/page-services
```

## Réponses aux questions théoriques

1. Après un Squash and merge, la branche de fonctionnalité d'origine (si elle existe encore avant suppression) conserve bien ses commits individuels intacts. Sur `main`, en revanche, un **seul** nouveau commit apparaît, combinant l'intégralité des changements - l'historique détaillé de la branche n'est donc visible que tant que la branche elle-même n'a pas été supprimée.

2. Rebase and merge est préférable quand l'équipe valorise un historique `main` **linéaire et détaillé**, avec chaque commit individuel de la fonctionnalité restant visible et atomique - typiquement pour des équipes disciplinées sur la qualité de leurs commits individuels, qui n'ont pas besoin du "nettoyage" qu'apporte le Squash.
