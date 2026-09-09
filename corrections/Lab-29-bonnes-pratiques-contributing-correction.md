# Correction - Lab 29 : Bonnes pratiques et CONTRIBUTING.md

### Étape 1
```bash
mkdir -p ~/git-formation/formation-git-standards && cd ~/git-formation/formation-git-standards
git init
echo "v1" > app.txt && git add . && git commit -m "feat: version initiale"
echo "v2" > app.txt && git add . && git commit -m "wip"
echo "v3" > app.txt && git add . && git commit -m "fix"
echo "v4" > app.txt && git add . && git commit -m "feat: ajoute la fonctionnalité de recherche"
echo "v5" > app.txt && git add . && git commit -m "asdasd"
echo "v6" > app.txt && git add . && git commit -m "docs: met à jour la documentation"
```

### Étape 2
```bash
cat > CONTRIBUTING.md << 'EOF2'
# Guide de contribution

## Workflow
GitHub Flow : une branche `main` toujours déployable, des branches courtes `feature/*` ou `fix/*`
fusionnées via Pull Request avec au moins une review avant fusion.

## Convention de commits (Conventional Commits)
- feat: nouvelle fonctionnalité (ex. "feat: ajoute la fonctionnalité de recherche")
- fix: correction de bug
- docs: documentation uniquement (ex. "docs: met à jour la documentation")
- chore: tâches diverses

## Nommage des branches
feature/nom-court, fix/nom-du-bug, hotfix/urgence, release/x.y.z

## Avant d'ouvrir une PR
- [ ] Historique nettoyé (pas de "wip", "fix", messages vagues)
- [ ] Messages conformes à Conventional Commits
- [ ] Aucun secret dans le diff
EOF2
git add . && git commit -m "docs: ajoute le guide de contribution"
```

### Étape 3
```bash
cat > SECURITY.md << 'EOF2'
# Politique de sécurité

En cas de secret committé par erreur :
1. Révoquer/régénérer immédiatement le secret concerné.
2. Retirer le fichier du suivi futur (.gitignore + git rm --cached) - voir Module 13.
3. Réécrire l'historique complet avec git filter-repo pour effacer toute trace passée - voir Module 20.
4. Coordonner un push --force avec toute l'équipe et demander un re-clone.
EOF2
git add . && git commit -m "docs: ajoute la politique de sécurité"
```

### Étapes 4-5
Commits non conformes identifiés : `"wip"` (commit 2), `"fix"` (commit 3), `"asdasd"` (commit 5).
```bash
git rebase -i HEAD~6
```
Plan : fusionner (`fixup`) le commit "wip" et "fix" dans le commit "feat: version initiale" avec `reword` pour un message final clair ; `reword` "asdasd" en quelque chose comme `refactor: ajuste la structure de app.txt`.

### Étapes 6-7
```bash
cat > .git/hooks/commit-msg << 'HOOK'
#!/bin/bash
MESSAGE=$(cat "$1")
PATTERN="^(feat|fix|docs|style|refactor|test|chore)(\(.+\))?: .+"
[[ "$MESSAGE" =~ $PATTERN ]] || { echo "Format invalide. Voir CONTRIBUTING.md"; exit 1; }
exit 0
HOOK
chmod +x .git/hooks/commit-msg
echo "test" >> app.txt && git add . && git commit -m "wip"    # refusé, cohérent avec CONTRIBUTING.md
```

## Réponses aux questions théoriques

1. Une documentation qui n'est pas techniquement vérifiée devient rapidement obsolète ou ignorée : les développeurs suivent ce qui est **réellement imposé**, pas nécessairement ce qui est simplement écrit. Synchroniser hooks et documentation garantit que la règle affichée est la règle **effectivement appliquée**, évitant toute confusion ou frustration ("le CONTRIBUTING dit X mais rien ne m'empêche de faire Y").

2. Une documentation jamais vérifiée techniquement finit par être **silencieusement contournée** au fil du temps, sans que personne ne s'en rende compte immédiatement - chaque petite entorse individuelle semblant sans conséquence, jusqu'à ce que l'historique global devienne aussi désordonné que si aucune règle n'avait jamais existé.
