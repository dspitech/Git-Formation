# Correction - Lab 25 : Capstone Partie 5 - Débogage et historique avancé

### Étape 1
```bash
mkdir -p ~/git-formation/projet-en-crise && cd ~/git-formation/projet-en-crise
git init
messages=("feat: init moteur" "wip" "feat: ajoute calcul A" "fix" "oops" "feat: ajoute calcul B" "wip encore" "fix bug mineur" "feat: calcul C" "wip final" "fix final" "feat: stabilise le moteur")
for i in "${!messages[@]}"; do
  n=$((i+1))
  echo "etat $n" > moteur.txt
  if [ "$n" -eq 7 ]; then echo "ERREUR=true" >> moteur.txt; fi
  git add . && git commit -m "${messages[$i]}"
done
```

### Étape 2
```bash
cat > test-erreur.sh << 'SCRIPT'
#!/bin/bash
grep -q "ERREUR=true" moteur.txt && exit 1 || exit 0
SCRIPT
chmod +x test-erreur.sh
git bisect start HEAD $(git log --oneline | tail -1 | cut -d' ' -f1)
git bisect run ./test-erreur.sh
COMMIT_FAUTIF=$(git bisect view --format=%H 2>/dev/null || git rev-parse HEAD)
git bisect reset
```

### Étapes 3-4
```bash
git checkout -b fix-urgence main
sed -i '/ERREUR=true/d' moteur.txt 2>/dev/null || true
echo "correction du moteur" >> moteur.txt
git add . && git commit -m "fix: retire l'erreur critique du moteur"

git checkout main
git cherry-pick $(git log fix-urgence --oneline -1 --format=%H)
```

### Étape 5
```bash
git checkout fix-urgence
git rebase -i HEAD~1    # déjà un seul commit ici ; sur un scénario réel avec plusieurs commits, fixup/squash comme au Lab 19
```

### Étapes 6-7
```bash
cat > .git/hooks/pre-commit << 'HOOK'
#!/bin/bash
git diff --cached | grep -E "^\+.*ERREUR=true" > /dev/null && { echo "Commit bloqué : réintroduction de ERREUR=true détectée."; exit 1; }
exit 0
HOOK
chmod +x .git/hooks/pre-commit

echo "ERREUR=true" >> moteur.txt
git add . && git commit -m "test: tentative de réintroduction"    # bloqué avec succès
git restore --staged moteur.txt && git restore moteur.txt
```

### Étape 8 (exemple de rapport)
*"Incident : une erreur critique a été introduite au commit #7 sur 12, détectée par bisect automatisé en moins d'une minute. Correctif appliqué en urgence sur main via cherry-pick depuis une branche dédiée, sans attendre la fusion complète de fix-urgence. Un hook pre-commit a été ajouté pour empêcher toute réintroduction future du même motif d'erreur."*

## Réponses aux questions théoriques

1. Ce scénario illustre un cycle de réponse à incident complet et réaliste : **bisect** fournit le diagnostic précis (quel commit, sans recherche manuelle fastidieuse), **cherry-pick** permet une **correction chirurgicale** immédiate sans devoir attendre la finalisation d'un travail plus large, et le **hook** ajoute une couche de **prévention** pour qu'un incident similaire soit bloqué automatiquement à l'avenir plutôt que de compter uniquement sur la vigilance humaine.

2. Si le bug avait déjà été fusionné dans `main` et poussé en production depuis plusieurs jours (donc potentiellement récupéré par d'autres), la réponse appropriée du Module 10 aurait été `git revert` sur le commit fautif, plutôt qu'un correctif direct qui laisserait le commit défectueux "actif" dans l'historique sans marquer clairement son annulation - `revert` documente explicitement l'incident et sa résolution dans l'historique partagé.
