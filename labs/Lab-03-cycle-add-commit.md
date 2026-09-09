# Lab 03 - Cycle add/commit, add -p, amend

**Partie :** 1 - Fondations · **Module associé :** 2
**Notions testées :** add, commit, add -p, amend, rm, mv, Conventional Commits
**Durée estimée :** 30 min
**Correction :** [`../corrections/Lab-03-cycle-add-commit-correction.md`](../corrections/Lab-03-cycle-add-commit-correction.md)

## Contexte
Vous gérez `~/git-formation/lab-todolist`, une petite application de liste de tâches en fichiers texte.

## Consignes
1. Initialisez le dépôt, créez `taches.txt` avec 3 tâches (une par ligne), commit avec un message `feat:`.
2. Ajoutez 2 nouvelles tâches ET modifiez une tâche existante en une seule salve d'édition, mais committez-les **séparément** grâce à `git add -p` (une des deux modifications dans un commit `feat:`, l'autre dans un commit `fix:` ou `docs:` selon le cas).
3. Renommez `taches.txt` en `todo.txt` avec `git mv`, commit.
4. Créez un fichier `brouillon.txt` inutile, committez-le par erreur avec un message vide de sens (`"wip"`), puis supprimez-le avec `git rm` et committez la suppression.
5. Reprenez le tout dernier commit (celui de suppression) et améliorez son message avec `--amend` pour qu'il respecte Conventional Commits.
6. Créez un commit vide (`--allow-empty`) marquant un jalon `chore: jalon - liste de tâches de base terminée`.
7. Affichez `git log --oneline` final et vérifiez que chaque message est clair et conforme.

## Questions théoriques
1. Pourquoi `git add -p` est-il préférable à `git add .` quand plusieurs changements sans rapport sont présents dans un même fichier ?
2. Dans quel cas un commit vide (`--allow-empty`) a-t-il un intérêt réel ?

## Critères de réussite
- [ ] Au moins un commit a été créé via `git add -p` en isolant une portion précise d'un fichier
- [ ] Un `git mv` et un `git rm` ont chacun été utilisés et committés
- [ ] Tous les messages de commit finaux respectent Conventional Commits
