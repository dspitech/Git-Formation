# Correction - Lab 26 : filter-repo

### Étapes 1-2
```bash
mkdir -p ~/git-formation/lab-filter-repo-pro && cd ~/git-formation/lab-filter-repo-pro
git init
echo "# App" > README.md && git add . && git commit -m "Initial commit"
echo '{"user":"admin","pass":"secret123"}' > credentials.json
git add . && git commit -m "ajoute la config de credentials"
echo "feat 1" > f1.txt && git add . && git commit -m "feat: fonctionnalité 1"
echo "cle_api = 'sk-vraie-cle-de-prod-98765'" > config.py
git add . && git commit -m "ajoute la clé API en dur"
echo "feat 2" > f2.txt && git add . && git commit -m "feat: fonctionnalité 2"

git log -p -- credentials.json    # secret visible
```

### Étape 3
```bash
echo "credentials.json" > .gitignore
git rm --cached credentials.json
git add .gitignore
git commit -m "fix: retire credentials.json du suivi"
git log -p -- credentials.json    # toujours visible dans l'ancien commit !
```

### Étapes 4-5
```bash
pip install git-filter-repo --break-system-packages
git filter-repo --path credentials.json --invert-paths --force
git log --oneline
git log -p -- credentials.json    # aucun résultat
```

### Étapes 6-7
```bash
echo "sk-vraie-cle-de-prod-98765==>CLE_SUPPRIMEE" > remplacements.txt
git filter-repo --replace-text remplacements.txt --force
grep -r "sk-vraie-cle-de-prod" .git 2>/dev/null || echo "Clé absente de l'historique réécrit"
git log -p -- config.py | grep "CLE_SUPPRIMEE"
```

### Étape 8
```bash
cat > INCIDENT.md << 'EOF2'
# Procédure de réécriture d'historique après fuite de secret

1. Révoquer/régénérer immédiatement le secret concerné auprès du service émetteur.
2. Annoncer à toute l'équipe le jour et l'heure prévus de la réécriture.
3. Exécuter git filter-repo en local, vérifier l'absence totale du secret.
4. Pousser avec git push --force --all (et --tags si nécessaire).
5. Demander à chaque collaborateur de re-cloner le dépôt plutôt que de tenter une synchronisation manuelle.
EOF2
git add . && git commit -m "docs: documente la procédure de réécriture d'historique"
```

## Réponses aux questions théoriques

1. Le hash d'un commit dépend non seulement de son propre contenu, mais aussi du hash de son **commit parent**. Dès qu'un commit intermédiaire est modifié ou supprimé (comme lors d'un filter-repo), tous les commits qui le suivent voient leur "chaîne de parenté" changer, ce qui recalcule mécaniquement **tous** leurs hash, même s'ils n'ont individuellement rien à voir avec le fichier ou le texte concerné par la réécriture.

2. La toute première action, avant même de songer à `filter-repo`, est de **révoquer ou régénérer immédiatement le secret compromis** auprès du service concerné (fournisseur d'API, base de données, etc.). Tant que cette étape n'est pas faite, la réécriture d'historique ne protège en rien contre une éventuelle copie déjà réalisée par un tiers avant la correction.
