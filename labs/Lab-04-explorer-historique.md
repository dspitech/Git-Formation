#  Lab 04 - Explorer l'historique (log, diff, show, blame)

**Partie :** 1 - Fondations · **Module associé :** 3
**Notions testées :** log, diff, diff --staged, show, blame, références relatives
**Durée estimée :** 25 min
**Correction :** [`../corrections/Lab-04-explorer-historique-correction.md`](../corrections/Lab-04-explorer-historique-correction.md)

## Contexte
Vous reprenez `~/git-formation/lab-todolist` du Lab 03 (ou recréez-en un similaire avec au moins 6 commits) pour pratiquer l'investigation d'historique.

## Consignes
1. Affichez l'historique complet en une ligne, puis sous forme de graphe.
2. Affichez uniquement les 3 derniers commits.
3. Recherchez tous les commits dont le message contient `feat`.
4. Modifiez `todo.txt` (ajoutez une ligne) sans committer : comparez la sortie de `git diff` et `git diff --staged` avant puis après un `git add`.
5. Committez cette modification, puis affichez le détail complet de ce commit avec `git show`, sans utiliser son hash (uniquement une référence relative).
6. Comparez le contenu de `todo.txt` entre le tout premier commit du dépôt et `HEAD`.
7. Utilisez `git blame todo.txt` : identifiez quel commit a introduit chaque ligne actuelle du fichier.
8. Affichez un résumé du nombre de commits par auteur avec `git shortlog -sn`.

## Questions théoriques
1. Dans quel scénario concret `git blame` est-il votre premier réflexe ?
2. Pourquoi `git diff` seul ne montre parfois **rien**, alors que le fichier a bien été modifié ?

## Critères de réussite
- [ ] Vous savez naviguer entre `HEAD`, `HEAD~1`, `HEAD~2` sans hésiter
- [ ] Vous avez utilisé `git blame` pour retracer l'origine d'au moins une ligne précise
- [ ] Vous pouvez expliquer, sans notes, la différence exacte entre `git diff` et `git diff --staged`
