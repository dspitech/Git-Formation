# Correction - Lab 30 : PROJET FINAL - Boulangerie Dupont

> Ce corrigé donne la trame complète de commandes. Adaptez les noms de fichiers/contenus à votre propre créativité - l'important est la **séquence des techniques mobilisées**.

## Phase 1 - Initialisation
```bash
mkdir -p ~/git-formation/boulangerie-finale && cd ~/git-formation/boulangerie-finale
git init
cat > .gitignore << 'EOF2'
node_modules/
*.env
*.log
.DS_Store
EOF2
echo "# Boulangerie Dupont" > README.md
git add . && git commit -m "chore: initialise le projet avec .gitignore"
```

## Phase 2 - Branches
```bash
git checkout -b feature/page-produits
echo "<h1>Nos Pains</h1>" > produits.html
git add . && git commit -m "feat: ajoute la page produits"
git checkout main
git merge feature/page-produits          # fast-forward
git branch -d feature/page-produits

echo "<!-- meta -->" >> README.md
git add . && git commit -m "chore: ajoute des métadonnées"

git checkout -b feature/horaires
echo "Lundi-Samedi 7h-19h" > horaires.txt
git add . && git commit -m "feat: ajoute les horaires"
git checkout main
git merge --no-ff feature/horaires -m "merge: intègre les horaires"   # merge commit naturel

git checkout -b feature/contact
echo "<h1>Contact</h1>" > contact.html
git add . && git commit -m "feat: ajoute la page contact"
git rebase main            # rebase local avant fusion
git checkout main
git merge feature/contact   # fast-forward
git branch -d feature/contact
```

## Phase 3 - Conflit et collaboration
```bash
mkdir -p ~/git-formation/serveur-boulangerie && cd ~/git-formation/serveur-boulangerie
git init --bare boulangerie.git
cd ~/git-formation
git clone serveur-boulangerie/boulangerie.git dev-collegue
cd boulangerie-finale
git remote add origin ~/git-formation/serveur-boulangerie/boulangerie.git
git push -u origin main --tags 2>/dev/null || git push -u origin main

cd ../dev-collegue
git pull
echo "Ligne du collègue" >> README.md
git add . && git commit -m "docs: ajoute une ligne (collègue)"
git push

cd ../boulangerie-finale
echo "Ligne de vous" >> README.md
git add . && git commit -m "docs: ajoute une ligne (vous)"
git push    # rejeté
git pull
# résolution du conflit sur README.md
git add README.md && git commit
git push
```

## Phase 4 - Incident de sécurité et nettoyage
```bash
echo "API_KEY=secret-boulangerie-123" > config.env
git add . && git commit -m "oops: ajoute config.env par erreur"
echo "config.env" >> .gitignore
git rm --cached config.env
git add .gitignore
git commit -m "fix: retire config.env du suivi"
git log -p -- config.env    # toujours visible

pip install git-filter-repo --break-system-packages
git filter-repo --path config.env --invert-paths --force
git remote add origin ~/git-formation/serveur-boulangerie/boulangerie.git

echo "brouillon" > brouillon.txt
git add . && git commit -m "oops: brouillon"
echo "brouillon corrigé" > brouillon.txt
git add . && git commit -m "fix du brouillon"
git rebase -i HEAD~2    # fixup pour un historique propre
```

## Phase 5 - Gestion avancée
```bash
echo "newsletter en cours..." > newsletter.html
git stash save "WIP: newsletter"
echo "fix: logo corrigé" > logo-fix.txt
git add . && git commit -m "fix: corrige le logo en urgence"
git stash pop

git checkout -b dev
echo "fix: faille XSS corrigée" > securite.txt
git add . && git commit -m "fix: corrige une faille de sécurité critique"
echo "feature inachevée" > en-cours.txt
git add . && git commit -m "feat: fonctionnalité non terminée"
git checkout main
git cherry-pick $(git log dev --oneline --grep="sécurité" --format=%H)

for i in $(seq 1 10); do
  echo "etat $i" > moteur-site.txt
  if [ "$i" -eq 6 ]; then echo "BUG=true" >> moteur-site.txt; fi
  git add . && git commit -m "commit technique $i"
done
cat > test-bug.sh << 'SCRIPT'
#!/bin/bash
grep -q "BUG=true" moteur-site.txt && exit 1 || exit 0
SCRIPT
chmod +x test-bug.sh
git bisect start HEAD $(git log --oneline | tail -1 | cut -d' ' -f1)
git bisect run ./test-bug.sh
git bisect reset

git tag -a v1.0.0 -m "Première version stable du site"
git tag -a v1.0.1 -m "Correctif de sécurité critique"
git tag -a v1.1.0 -m "Nouvelle fonctionnalité newsletter"
```

## Phase 6 - Récupération et gouvernance
```bash
cat > .git/hooks/pre-commit << 'HOOK'
#!/bin/bash
git diff --cached | grep -iE "^\+.*(API_KEY|PASSWORD)\s*=" > /dev/null && { echo "Commit bloqué : secret potentiel détecté."; exit 1; }
exit 0
HOOK
chmod +x .git/hooks/pre-commit

echo "important" > jalon.txt
git add . && git commit -m "feat: jalon important du projet"
git reset --hard HEAD~1        # incident simulé
git reflog
git reset --hard HEAD@{1}       # récupération complète

cat > CONTRIBUTING.md << 'EOF2'
# Guide de contribution - Boulangerie Dupont
Workflow : GitHub Flow. Commits : Conventional Commits. Aucun secret en dur.
EOF2
mkdir -p .github
cat > .github/CODEOWNERS << 'EOF2'
*    @votre-nom-github
EOF2
git add . && git commit -m "docs: ajoute CONTRIBUTING.md et CODEOWNERS"
git push --force --all 2>/dev/null || git push --all
```

## Phase 7 - Bilan
```bash
git log --oneline --graph --all --decorate
```

### Exemple de rapport de fin de projet
*"Le projet Boulangerie Dupont a traversé un cycle de développement complet : trois fonctionnalités développées en branches (fast-forward, merge naturel, rebase), une collaboration à deux avec résolution de conflit réel, un incident de sécurité (secret committé) entièrement corrigé par réécriture d'historique avec filter-repo, une gestion d'urgence via stash et cherry-pick, un bug détecté automatiquement par bisect, un incident de perte de commit résolu via reflog, et une gouvernance documentée (CONTRIBUTING, CODEOWNERS, hook préventif). Chaque incident a renforcé une pratique professionnelle durable plutôt que d'être simplement corrigé ponctuellement."*

## Bilan pédagogique

Ce projet mobilise, dans l'ordre : Modules 0-2-13 (init), 4-6-9 (branches/workflow), 5-7-8 (conflit/collaboration), 10-13-14-20 (incident/nettoyage), 11-12-15-16 (gestion avancée), 18-21-22-23 (gouvernance/récupération) - soit l'intégralité des 23 modules et des 6 parties du cours, appliqués à un seul scénario cohérent de bout en bout.
