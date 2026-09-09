# Lab 24 - Internals et plumbing

**Partie :** 5 - Avancé · **Module associé :** 19
**Notions testées :** hash-object, cat-file, write-tree, commit-tree, update-ref
**Durée estimée :** 35 min
**Correction :** [`../corrections/Lab-24-internals-plumbing-correction.md`](../corrections/Lab-24-internals-plumbing-correction.md)

## Contexte
Vous recréez, entièrement à la main avec les commandes plumbing, ce que `git add` + `git commit` font automatiquement, pour démystifier complètement le fonctionnement interne de Git.

## Consignes
1. Créez un dépôt vide `~/git-formation/lab-plumbing-pro`.
2. Créez un fichier `a.txt` et calculez son hash blob avec `git hash-object -w`, sans passer par `git add`.
3. Vérifiez le type et le contenu de cet objet avec `git cat-file`.
4. Créez un second fichier `b.txt`, répétez l'opération pour obtenir un second hash blob.
5. Utilisez `git update-index` pour ajouter les deux blobs à l'index sous les noms `a.txt` et `b.txt`, puis construisez un tree avec `git write-tree`.
6. Inspectez ce tree avec `git cat-file -p` : vérifiez qu'il référence bien vos deux fichiers.
7. Créez un commit pointant vers ce tree avec `git commit-tree`, puis faites pointer `refs/heads/main` vers ce commit avec `git update-ref`.
8. Vérifiez avec `git log`, `git status` et `git ls-tree HEAD` que tout est cohérent, exactement comme si vous aviez utilisé `git add .` et `git commit` normalement.
9. Ajoutez un second commit de la même façon (à la main), en faisant pointer son parent vers le premier commit créé manuellement (indice : `git commit-tree <tree> -p <hash-du-premier-commit>`).

## Questions théoriques
1. Pourquoi est-il nécessaire d'utiliser `-p <hash>` avec `git commit-tree` pour le second commit mais pas pour le premier ?
2. Si vous recréez exactement le même contenu de fichier avec `git hash-object` dans deux dépôts différents, obtiendrez-vous le même hash de blob ? Pourquoi ?

## Critères de réussite
- [ ] Deux commits ont été créés entièrement à la main via les commandes plumbing, avec une relation parent-enfant correcte
- [ ] Le résultat final est indiscernable, du point de vue de `git log`, d'un historique créé normalement avec `git add`/`git commit`
