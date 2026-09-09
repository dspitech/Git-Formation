# Correction - Lab 21 : Git Bisect

### Étapes 1-4 (mode manuel)
```bash
mkdir -p ~/git-formation/lab-bisect-pro && cd ~/git-formation/lab-bisect-pro
git init
for i in $(seq 1 20); do
  echo "version $i" > calcul.txt
  if [ "$i" -eq 13 ]; then echo "BUG=true" >> calcul.txt; fi
  git add . && git commit -m "commit $i"
done

git bisect start
git bisect bad HEAD
git bisect good $(git log --oneline | tail -1 | cut -d' ' -f1)
# à chaque étape :
cat calcul.txt
# BUG=true présent → git bisect bad
# absent → git bisect good
# répéter jusqu'à l'annonce du commit fautif
git bisect reset
```

### Étapes 5-7 (mode automatisé)
```bash
cd ~/git-formation
mkdir lab-bisect-pro-2 && cd lab-bisect-pro-2
git init
for i in $(seq 1 20); do
  echo "version $i" > calcul.txt
  if [ "$i" -eq 7 ]; then echo "BUG=true" >> calcul.txt; fi
  git add . && git commit -m "commit $i"
done

cat > test-bug.sh << 'SCRIPT'
#!/bin/bash
grep -q "BUG=true" calcul.txt && exit 1 || exit 0
SCRIPT
chmod +x test-bug.sh

git bisect start HEAD $(git log --oneline | tail -1 | cut -d' ' -f1)
git bisect run ./test-bug.sh
git bisect log
git bisect reset
```
**Comparaison :** avec 20 commits, le mode manuel nécessite environ log₂(20) ≈ 5 décisions saisies à la main. Le mode automatisé effectue exactement le même nombre d'itérations, mais sans aucune intervention humaine entre chaque étape - un gain de temps net dès que le nombre de commits augmente ou que le test est répétitif.

## Réponses aux questions théoriques

1. `git bisect` suppose implicitement que le bug est **monotone** : une fois introduit, il reste présent dans tous les commits suivants. Si le bug apparaît puis disparaît de façon non linéaire (par exemple réintroduit par erreur puis re-corrigé), la recherche dichotomique produira des résultats **incohérents ou incorrects**, car l'hypothèse de base de l'algorithme (une frontière nette entre "good" et "bad") n'est plus respectée.

2. `bisect run` ne nécessite aucune intervention humaine pendant l'exécution : un pipeline CI/CD peut détecter automatiquement qu'un test de non-régression échoue, puis lancer `git bisect run` avec ce même test comme script de validation, identifiant le commit fautif **avant même** qu'un développeur ne commence à investiguer manuellement.
