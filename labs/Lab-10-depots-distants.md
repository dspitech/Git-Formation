# Lab 10 - Dépôts distants (clone, push, pull, fetch)

**Partie :** 3 - Collaboratif · **Module associé :** 7
**Notions testées :** bare repository, clone, push -u, fetch vs pull, push refusé
**Durée estimée :** 35 min
**Correction :** [`../corrections/Lab-10-depots-distants-correction.md`](../corrections/Lab-10-depots-distants-correction.md)

## Contexte
Vous simulez un serveur distant en local pour pratiquer les commandes de synchronisation sans dépendre d'un compte GitHub.

## Consignes
1. Créez un dépôt bare `~/git-formation/serveur/atelier.git`.
2. Clonez-le deux fois : `~/git-formation/dev-a` et `~/git-formation/dev-b`.
3. Depuis `dev-a`, créez un fichier `README.md`, commit, push en liant la branche.
4. Depuis `dev-b`, récupérez ce commit avec `git pull`.
5. Depuis `dev-b`, faites un changement et poussez-le. Depuis `dev-a`, faites un `git fetch` seul : vérifiez avec `git log --all --graph` que `origin/main` est en avance sans que votre `main` local ait bougé, et que le fichier sur le disque n'a pas changé.
6. Terminez la synchronisation avec un `git pull` dans `dev-a`.
7. Provoquez volontairement un push refusé : modifiez le même fichier sans synchroniser dans `dev-a` et `dev-b`, poussez d'abord depuis `dev-b` (succès), puis tentez de pousser depuis `dev-a` (échec attendu). Résolvez proprement.
8. Utilisez `git ls-remote origin` depuis l'un des deux clones pour lister les références présentes sur le serveur sans rien télécharger.

## Questions théoriques
1. Pourquoi Git refuse-t-il le second push de l'étape 7, précisément ?
2. En quoi `git fetch` est-il une opération strictement plus sûre que `git pull` ?

## Critères de réussite
- [ ] Un push a été refusé puis résolu sans utiliser `--force`
- [ ] La différence entre `fetch` et `pull` a été observée concrètement (fichier inchangé après fetch)
