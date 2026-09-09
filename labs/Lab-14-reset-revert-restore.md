# Lab 14 - reset, revert, restore

**Partie :** 4 - Intermédiaire · **Module associé :** 10
**Notions testées :** reset --soft/--mixed/--hard, revert, restore, restore --staged
**Durée estimée :** 30 min
**Correction :** [`../corrections/Lab-14-reset-revert-restore-correction.md`](../corrections/Lab-14-reset-revert-restore-correction.md)

## Contexte
Vous gérez `~/git-formation/lab-annulation`, un projet où vous allez volontairement provoquer et corriger plusieurs erreurs classiques.

## Consignes
1. Créez le dépôt, faites 4 commits successifs modifiant à chaque fois `data.txt` (v1 à v4).
2. Testez `git reset --soft HEAD~1` : observez où se trouve le contenu du commit annulé, recommittez.
3. Testez `git reset HEAD~1` (mixed) : observez la différence avec `--soft`, recommittez.
4. Testez `git reset --hard HEAD~1` : observez la perte de contenu sur le disque.
5. Modifiez `data.txt` sans committer, annulez avec `git restore`. Modifiez à nouveau, stagez, désindexez avec `git restore --staged` en gardant le contenu, puis annulez complètement.
6. Créez un commit qui casse volontairement un fichier `config.txt`. Annulez-le avec `git revert` (pas `reset`), en conservant la trace dans l'historique.
7. Créez un commit de merge défaillant (fusionnez une branche qui casse quelque chose), puis annulez spécifiquement ce merge avec `git revert -m 1`.
8. Terminez par un `git log --oneline` complet et identifiez, pour chaque commit, s'il s'agit d'un ajout, d'une correction ou d'une annulation.

## Questions théoriques
1. Dans quel cas précis choisiriez-vous `reset --soft` plutôt que `reset --mixed` ?
2. Pourquoi `git revert -m 1` nécessite-t-il de préciser un numéro de parent, contrairement à un revert sur un commit simple ?

## Critères de réussite
- [ ] Les 3 modes de reset ont été testés et leurs différences clairement observées
- [ ] Un revert simple et un revert de merge (`-m 1`) ont chacun été réalisés avec succès
