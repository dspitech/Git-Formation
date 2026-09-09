# Correction - Lab 16 : Tags et versions

### Étapes 1-4
```bash
mkdir -p ~/git-formation/lab-versioning && cd ~/git-formation/lab-versioning
git init
echo "v1.0" > lib.txt && git add . && git commit -m "feat: version initiale de la bibliothèque"
git tag -a v1.0.0 -m "Première version stable, API publique initiale"

echo "ajout fonction utilitaire" >> lib.txt
git add . && git commit -m "feat: ajoute une fonction utilitaire (rétrocompatible)"
git tag -a v1.1.0 -m "Ajoute une fonction utilitaire"

echo "correction bug mineur" >> lib.txt
git add . && git commit -m "fix: corrige un bug mineur de calcul"
git tag -a v1.1.1 -m "Correctif de bug mineur"

echo "changement signature fonction principale" > lib.txt
git add . && git commit -m "feat!: change la signature de la fonction principale (breaking)"
git tag -a v2.0.0 -m "Version majeure : changement incompatible de l'API"
```

### Étape 5
```bash
git tag v2.0.1-test
git show v1.0.0
# → affiche : tagger, date, message annoté, PUIS les infos du commit
git show v2.0.1-test
# → affiche DIRECTEMENT les infos du commit : aucune métadonnée de tag propre
```

### Étape 6
```bash
git checkout v1.1.0
cat lib.txt
git status    # "HEAD detached at v1.1.0"
git checkout main
```

### Étapes 7-8
```bash
git tag -l "v1.*"
git tag -d v2.0.1-test
```

## Réponses aux questions théoriques

1. Le Semantic Versioning encode un **contrat de compatibilité** : un utilisateur de la bibliothèque doit pouvoir se fier au numéro de version pour savoir si une mise à jour risque de casser son code. Incrémenter `MAJOR` est le signal explicite et non ambigu qu'une rupture de compatibilité a eu lieu, permettant aux utilisateurs de la bibliothèque de tester avant de migrer plutôt que de subir une casse silencieuse.

2. Tout commit fait en *detached HEAD* n'est rattaché à **aucune branche**. Si vous quittez cet état (par un `checkout` vers une branche) sans avoir créé de branche pour le conserver, ce commit devient orphelin : il reste techniquement récupérable via le reflog (Module 22) pendant un temps limité, mais risque d'être définitivement perdu après un nettoyage automatique (garbage collection) si personne n'y fait référence entre-temps.
