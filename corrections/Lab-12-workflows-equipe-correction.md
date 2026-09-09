# Correction - Lab 12 : Workflows d'équipe

### Partie A - GitHub Flow
```bash
mkdir -p ~/git-formation/atelier-githubflow && cd ~/git-formation/atelier-githubflow
git init
echo "# Atelier GitHub Flow" > README.md
git add . && git commit -m "chore: initialise le projet"

git checkout -b feature/authentification
echo "module auth" > auth.txt
git add . && git commit -m "feat: ajoute le module d'authentification"
git checkout main
git merge feature/authentification
git branch -d feature/authentification

git checkout -b feature/notifications
echo "module notifications" > notifications.txt
git add . && git commit -m "feat: ajoute le module de notifications"
git checkout main
git merge feature/notifications
git branch -d feature/notifications
```
**Vérification :** à chaque étape, `main` contient uniquement du code terminé et fonctionnel - jamais de fonctionnalité à moitié développée, conformément au principe central de GitHub Flow.

### Partie B - Git Flow simplifié
```bash
mkdir -p ~/git-formation/atelier-gitflow && cd ~/git-formation/atelier-gitflow
git init
echo "# Atelier Git Flow" > README.md
git add . && git commit -m "chore: initialise le projet"
git checkout -b develop

git checkout -b feature/paiement develop
echo "module paiement" > paiement.txt
git add . && git commit -m "feat: ajoute le module de paiement"
git checkout develop
git merge --no-ff feature/paiement -m "merge: intègre le paiement dans develop"

git checkout -b feature/panier develop
echo "module panier" > panier.txt
git add . && git commit -m "feat: ajoute le module panier"
git checkout develop
git merge --no-ff feature/panier -m "merge: intègre le panier dans develop"

git checkout -b release/1.0 develop
echo "1.0.0" > VERSION
git add . && git commit -m "chore: fixe la version 1.0.0"

git checkout main
git merge --no-ff release/1.0 -m "merge: release 1.0 en production"
git tag -a v1.0.0 -m "Première version stable"

git checkout develop
git merge --no-ff release/1.0 -m "merge: réintègre release/1.0 dans develop"
```

## Réponses aux questions théoriques

1. Fusionner dans `main` permet de mettre la version en production. Fusionner **également** dans `develop` garantit que le petit correctif fait sur la branche `release/1.0` (ici, le fichier `VERSION`) ne soit pas perdu pour les développements futurs : sans cette double fusion, `develop` ignorerait ce changement et pourrait le réintroduire en conflit plus tard.

2. Le scénario **GitHub Flow** (Partie A) est nettement plus adapté à un SaaS déployé plusieurs fois par jour : une seule branche longue toujours déployable, des branches courtes fusionnées dès qu'elles sont prêtes, sans la lourdeur des branches `develop`/`release` qui n'apportent de valeur que pour des cycles de release distincts et espacés.
