# orrection - Lab 02 : Les trois zones et la structure interne de Git

### Étapes 1-2
```bash
mkdir -p ~/git-formation/lab-structure && cd ~/git-formation/lab-structure
git init
cat .git/HEAD          # ref: refs/heads/main (la branche n'existe pas encore concrètement)
ls .git/refs/heads      # dossier vide : aucun commit, donc aucune branche réelle
ls .git/objects         # vide : aucun objet stocké
```

### Étapes 3-4
```bash
echo "première note" > notes.txt
git status               # untracked

git add notes.txt
find .git/objects -type f
# → un nouveau fichier objet apparaît (le blob du contenu de notes.txt)
git cat-file -t <hash-trouvé-sans-le-slash>
# → blob
```
**Explication :** dès `git add`, Git calcule le hash du contenu et le stocke comme objet `blob` - **avant même** tout commit. La Staging Area référence cet objet, mais aucun commit ni aucune branche n'y fait encore référence de façon "officielle".

### Étape 5
```bash
git commit -m "feat: ajoute la première note"
cat .git/refs/heads/main
# → affiche le hash complet du commit qui vient d'être créé
```

### Étapes 6-8
```bash
echo "note complétée" >> notes.txt
# → modification dans le WORKING DIRECTORY (modified, non stagé)

git add notes.txt
# → modification désormais dans la STAGING AREA (staged)

git commit -m "docs: complète la première note"
# → modification désormais dans le REPOSITORY (committed)

find .git/objects -type f | while read f; do
  hash=$(echo $f | sed 's#\.git/objects/##; s#/##')
  echo "$hash : $(git cat-file -t $hash)"
done
```
Vous devez compter **2 objets de type `commit`** (un par `git commit` effectué).

## Réponses aux questions théoriques

1. Git est un système de **stockage adressé par contenu** : chaque `git add` calcule immédiatement le hash du contenu du fichier et le range dans `.git/objects/` sous forme de blob, indépendamment de tout commit futur. Cela permet à Git de détecter instantanément si un contenu identique existe déjà (déduplication), et prépare l'objet qui sera référencé par le tree du prochain commit.

2. `.git/refs/heads/main` contient uniquement le **hash SHA du commit** actuellement pointé par la branche `main` - un simple fichier texte de 40 (ou 64) caractères. C'est cette simplicité qui rend les branches Git si légères et rapides à créer/déplacer.
