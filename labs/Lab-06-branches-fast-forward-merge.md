# Lab 06 - Branches, fast-forward vs merge commit

**Partie :** 2 - Branches · **Module associé :** 4
**Notions testées :** création/navigation de branches, fast-forward, merge commit, --no-ff
**Durée estimée :** 30 min
**Correction :** [`../corrections/Lab-06-branches-fast-forward-merge-correction.md`](../corrections/Lab-06-branches-fast-forward-merge-correction.md)

## Contexte
Vous développez `~/git-formation/lab-portfolio`, un site portfolio personnel avec plusieurs sections ajoutées via des branches.

## Consignes
1. Initialisez le dépôt avec un fichier `index.html` contenant un titre, premier commit.
2. Créez une branche `section-projets`, ajoutez `projets.html`, committez, fusionnez dans `main` : vérifiez dans le log qu'il s'agit bien d'un fast-forward.
3. Créez une branche `section-contact`. Avant de la fusionner, retournez sur `main` et modifiez `index.html` (ajoutez une balise meta), committez directement sur `main`.
4. Terminez le travail sur `section-contact` (ajoutez `contact.html`, commit), puis fusionnez-la dans `main` avec l'option qui force explicitement un commit de fusion, même si ce n'était pas strictement nécessaire.
5. Créez une branche `section-experience`, ajoutez `experience.html`. Fusionnez-la dans `main` en forçant un merge commit avec `--no-ff`, même si un fast-forward aurait été possible.
6. Comparez, dans `git log --oneline --graph --all`, l'apparence des trois fusions réalisées : laquelle est un simple pointeur avancé, lesquelles créent un nœud de fusion visible ?
7. Supprimez toutes les branches déjà fusionnées.
8. Utilisez `git log --merges` pour lister uniquement les commits de fusion créés.

## Questions théoriques
1. Pourquoi la fusion de l'étape 4 a-t-elle nécessairement créé un merge commit, indépendamment de toute option `--no-ff` ?
2. Quel est l'intérêt de forcer `--no-ff` à l'étape 5, alors qu'un fast-forward aurait suffi techniquement ?

## Critères de réussite
- [ ] Un fast-forward, un merge commit "naturel" (divergence réelle) et un merge commit "forcé" (`--no-ff`) ont chacun été observés et distingués
- [ ] `git log --merges` retourne le bon nombre de commits de fusion
