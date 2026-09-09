# Lab 19 - Rebase interactif

**Partie :** 5 - Avancé · **Module associé :** 14
**Notions testées :** rebase -i, pick/reword/squash/fixup/drop
**Durée estimée :** 35 min
**Correction :** [`../corrections/Lab-19-rebase-interactif-correction.md`](../corrections/Lab-19-rebase-interactif-correction.md)

## Contexte
Vous nettoyez l'historique de `~/git-formation/lab-rebase-i-pro` avant de le partager, comme un développeur professionnel le ferait avant d'ouvrir une PR.

## Consignes
1. Créez un historique volontairement désordonné de 6 commits sur `feature.txt` : `"ajoute la fonction principale"`, `"fix typo"`, `"WIP tests"`, `"fix des tests"`, `"oops fichier debug"`, `"termine les tests"`.
2. Lancez un rebase interactif sur ces 6 commits.
3. Fusionnez (`fixup`) le commit "fix typo" dans le premier commit.
4. Fusionnez (`fixup`) "fix des tests" dans "WIP tests", et renommez (`reword`) le résultat en un message clair `feat: ajoute les tests unitaires`.
5. Supprimez (`drop`) complètement le commit "oops fichier debug" et vérifiez que le fichier associé disparaît bien du projet.
6. Laissez "termine les tests" en `pick`, mais améliorez son message via `reword`.
7. Vérifiez le résultat final : vous devez obtenir 3 commits propres et bien nommés au lieu de 6.
8. Provoquez volontairement un rebase interactif qui échoue à mi-parcours (par exemple en introduisant un conflit avec un `edit`), puis annulez tout avec `--abort` et vérifiez que l'état initial est parfaitement restauré.

## Questions théoriques
1. Pourquoi choisir `fixup` plutôt que `reword` suivi d'une suppression manuelle du message ?
2. Que se serait-il passé si vous aviez tenté ce rebase sur une branche déjà poussée et récupérée par un collègue ?

## Critères de réussite
- [ ] L'historique de 6 commits a été réduit à 3 commits propres via une combinaison de `fixup`, `reword` et `drop`
- [ ] Un rebase interactif a été annulé avec succès via `--abort` après une tentative volontairement compliquée
