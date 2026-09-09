# Correction - Lab 28 : Reflog et récupération d'urgence

### Étapes 1-4
```bash
cd ~/git-formation/lib-versionnee 2>/dev/null || (mkdir -p ~/git-formation/lib-versionnee && cd ~/git-formation/lib-versionnee && git init)
echo "v1" > lib.txt && git add . && git commit -m "commit 1"
echo "v2 - fonctionnalité critique" > lib.txt && git add . && git commit -m "feat: fonctionnalité critique pour le client"

git reset --hard HEAD~1
git log --oneline    # le commit critique semble avoir disparu

git reflog
# repérer : xxxxx HEAD@{1}: commit: feat: fonctionnalité critique pour le client

git reset --hard HEAD@{1}
git log --oneline    # de retour
cat lib.txt            # contenu identique à l'original
```

### Étape 5
```bash
git checkout -b branche-cruciale
echo "travail crucial" > crucial.txt
git add . && git commit -m "feat: travail crucial sur cette branche"
git checkout main
git branch -D branche-cruciale
git branch    # n'apparaît plus

git reflog | grep "travail crucial"
git branch branche-recuperee <hash-trouvé>
git checkout branche-recuperee
cat crucial.txt    # le fichier est de retour
```

### Étapes 6-7
```bash
git fsck --full --unreachable
```
Les objets listés correspondent typiquement aux commits et blobs créés sur `branche-cruciale` avant sa suppression forcée (`-D`), ainsi qu'au commit "annulé" par le premier `reset --hard` avant sa récupération - tous restent physiquement présents dans `.git/objects` tant qu'aucun garbage collection n'a eu lieu, même s'ils ne sont plus référencés par aucune branche/tag active.

### Étape 8
*"En cas de panique après une manipulation destructrice : ne rien faire de plus immédiatement, lancer `git reflog`, identifier la dernière entrée pertinente avant l'incident, puis restaurer avec `git reset --hard HEAD@{n}` ou recréer une branche à partir du hash trouvé."*

## Réponses aux questions théoriques

1. Par défaut, les entrées du reflog concernant des commits encore atteignables sont conservées environ **90 jours**, et celles concernant des commits devenus inatteignables (comme après un `reset --hard`) environ **30 jours**, avant d'être potentiellement nettoyées par le garbage collector (`git gc`). Ce n'est donc pas un filet de sécurité permanent, mais une fenêtre de récupération large et généralement suffisante en pratique.

2. Le reflog est un journal **strictement local**, stocké dans `.git/logs/` sur la machine où l'action a eu lieu - il n'est **jamais** inclus dans un `push`, un `pull`, ou un `clone`. Si un collègue efface accidentellement du travail sur sa propre machine, seul **son propre** reflog local peut potentiellement l'aider ; le vôtre, sur une autre machine, ne contient aucune trace de ses actions à lui.
