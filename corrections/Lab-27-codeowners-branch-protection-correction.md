# Correction - Lab 27 : CODEOWNERS et protection de branche

### Étapes 1-2
```bash
mkdir -p ~/git-formation/formation-git-gouvernance && cd ~/git-formation/formation-git-gouvernance
git init
mkdir -p backend frontend infra .github
echo "code backend" > backend/app.py
echo "code frontend" > frontend/app.js
echo "config infra" > infra/deploy.yml
git add . && git commit -m "chore: structure initiale du projet"

cat > .github/CODEOWNERS << 'EOF2'
*               @lead-dev
/backend/       @equipe-backend
/frontend/      @equipe-frontend
/infra/         @equipe-devops @lead-dev
EOF2
git add . && git commit -m "chore: ajoute CODEOWNERS"
```

### Étapes 3-5 (sur GitHub, si compte disponible)
1. **Settings → Branches → Add branch protection rule** sur `main`.
2. Cocher *Require a pull request before merging*, *Require approvals* (1 minimum), *Require review from Code Owners*.
3. Ouvrir une PR modifiant `infra/deploy.yml` : GitHub assigne automatiquement `@equipe-devops` et `@lead-dev` comme reviewers requis.
4. Tenter `git push` directement sur `main` : rejeté par la règle de protection avec un message explicite.

### Étapes 6-7
```bash
# Si une clé GPG est disponible :
git config --global user.signingkey <ID-de-votre-clé>
git config --global commit.gpgsign true
echo "contenu signé" > signe.txt
git add . && git commit -S -m "feat: commit signé de démonstration"
git log --show-signature -1
```

### Étape 8 - checklist de gouvernance minimale
```
1. Protection de la branche main : PR obligatoire, aucun push direct autorisé.
2. Au moins une approbation humaine requise avant toute fusion.
3. CODEOWNERS assignant clairement un relecteur par zone fonctionnelle.
4. CI/CD exécutant automatiquement les tests avant que la fusion ne soit possible.
5. CONTRIBUTING.md documentant le workflow et la convention de commits choisis.
```

## Réponses aux questions théoriques

1. CODEOWNERS n'est, en soi, qu'un fichier de **métadonnées** indiquant qui *devrait* être consulté pour telle ou telle zone du dépôt - GitHub l'utilise pour suggérer/assigner automatiquement des reviewers, mais rien n'empêche techniquement une PR d'être fusionnée sans leur approbation tant que l'option *"Require review from Code Owners"* n'est pas explicitement activée dans les règles de protection de branche.

2. Non. Une signature de commit prouve uniquement l'**authenticité de l'auteur déclaré** et l'**intégrité du contenu** (absence d'altération après signature) - elle ne dit absolument rien sur la qualité, la sécurité ou l'absence de bugs du code qu'elle signe. Un développeur légitime peut parfaitement signer un commit contenant une faille de sécurité ou une erreur ; seule une revue de code humaine (ou des tests automatisés) peut évaluer la qualité du contenu.
