# Correction - Lab 24 : Internals et plumbing

### Étapes 1-4
```bash
mkdir -p ~/git-formation/lab-plumbing-pro && cd ~/git-formation/lab-plumbing-pro
git init

echo "Contenu du fichier A" > a.txt
HASH_A=$(git hash-object -w a.txt)
git cat-file -t $HASH_A    # blob
git cat-file -p $HASH_A    # "Contenu du fichier A"

echo "Contenu du fichier B" > b.txt
HASH_B=$(git hash-object -w b.txt)
```

### Étapes 5-6
```bash
git update-index --add --cacheinfo 100644 $HASH_A a.txt
git update-index --add --cacheinfo 100644 $HASH_B b.txt
HASH_TREE1=$(git write-tree)
git cat-file -p $HASH_TREE1
# → liste a.txt et b.txt, chacun avec son hash blob respectif
```

### Étape 7
```bash
HASH_COMMIT1=$(echo "Premier commit créé manuellement" | git commit-tree $HASH_TREE1)
git update-ref refs/heads/main $HASH_COMMIT1
```

### Étape 8
```bash
git log --oneline
git status                # rien à committer, propre
git ls-tree HEAD           # a.txt et b.txt listés
```

### Étape 9 - second commit avec parent
```bash
echo "Contenu modifié du fichier A" > a.txt
HASH_A2=$(git hash-object -w a.txt)
git update-index --add --cacheinfo 100644 $HASH_A2 a.txt
HASH_TREE2=$(git write-tree)
HASH_COMMIT2=$(echo "Second commit créé manuellement" | git commit-tree $HASH_TREE2 -p $HASH_COMMIT1)
git update-ref refs/heads/main $HASH_COMMIT2
git log --oneline
cat a.txt
```

## Réponses aux questions théoriques

1. Le premier commit d'un dépôt n'a, par définition, **aucun parent** - c'est la racine de l'historique. Tout commit suivant doit explicitement déclarer son (ou ses) parent(s) via `-p` pour que Git puisse construire la chaîne d'ancêtres qui constitue l'historique ; omettre `-p` créerait un second commit **racine**, totalement déconnecté du premier.

2. Oui, vous obtiendrez rigoureusement le **même hash de blob** dans les deux dépôts, car Git calcule ce hash uniquement à partir du **contenu binaire exact** du fichier (avec un en-tête de type et de taille), indépendamment de son nom, de son emplacement, ou du dépôt dans lequel il se trouve. C'est le principe même du stockage adressé par contenu : un contenu identique produit toujours un hash identique, partout.
