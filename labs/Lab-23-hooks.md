# Lab 23 - Hooks Git

**Partie :** 5 - Avancé · **Module associé :** 18
**Notions testées :** pre-commit, commit-msg, pre-push, --no-verify
**Durée estimée :** 30 min
**Correction :** [`../corrections/Lab-23-hooks-correction.md`](../corrections/Lab-23-hooks-correction.md)

## Contexte
Vous équipez `~/git-formation/lab-hooks-pro` de trois hooks pour automatiser des vérifications de qualité, comme le ferait une équipe professionnelle.

## Consignes
1. Créez le dépôt.
2. Écrivez un hook `pre-commit` qui refuse tout commit dont le diff stagé contient les chaînes `TODO` ou `FIXME` dans les lignes ajoutées.
3. Testez qu'un commit contenant `FIXME` est bien refusé, corrigez et committez avec succès.
4. Écrivez un hook `commit-msg` qui impose le format Conventional Commits (`type: description`, types autorisés : feat/fix/docs/style/refactor/test/chore).
5. Testez avec un message non conforme (refusé), puis avec un message conforme (accepté).
6. Écrivez un hook `pre-push` qui refuse tout push si un fichier nommé `WIP.txt` existe encore à la racine du projet.
7. Testez ce hook, puis contournez-le volontairement avec `--no-verify` en connaissance de cause, en documentant par un commentaire pourquoi ce contournement était justifié dans ce cas précis.
8. Expliquez par écrit comment vous partageriez ces trois hooks avec une équipe, sachant qu'ils ne sont pas versionnés par défaut.

## Questions théoriques
1. Pourquoi est-il préférable de réserver les vérifications lentes (suite de tests complète) au hook `pre-push` plutôt qu'à `pre-commit` ?
2. Quel risque y a-t-il à rendre `--no-verify` trop facile d'accès dans une équipe ?

## Critères de réussite
- [ ] Les trois hooks (`pre-commit`, `commit-msg`, `pre-push`) ont été créés, testés en situation d'échec et de succès
- [ ] Une stratégie de partage de hooks en équipe a été proposée par écrit
