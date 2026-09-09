# Lab 11 - Pull Requests et code review

**Partie :** 3 - Collaboratif · **Module associé :** 8
**Notions testées :** cycle de PR, stratégies de fusion, review simulée
**Durée estimée :** 30 min (nécessite un compte GitHub, ou variante locale fournie en correction)
**Correction :** [`../corrections/Lab-11-pull-requests-code-review-correction.md`](../corrections/Lab-11-pull-requests-code-review-correction.md)

## Contexte
Vous pratiquez un cycle complet de Pull Request sur un dépôt `formation-git-atelier` (sur GitHub si vous avez un compte, sinon via la variante en dépôt bare local proposée en correction).

## Consignes
1. Créez le dépôt et poussez un premier commit sur `main`.
2. Créez une branche `feature/page-equipe`, ajoutez un fichier `equipe.html`, poussez-la, ouvrez une Pull Request vers `main`.
3. Simulez une review : ajoutez un commentaire (ou une note écrite) demandant une amélioration précise (ex. « ajouter un titre h1 »).
4. Corrigez sur la même branche, poussez un nouveau commit, et vérifiez que la PR se met à jour automatiquement.
5. Fusionnez la PR en mode **Squash and merge**. Comparez le nombre de commits sur la branche avant fusion et le nombre de commits ajoutés à `main` après fusion.
6. Répétez les étapes 2 à 4 avec une nouvelle branche `feature/page-services`, mais fusionnez cette fois en mode **Rebase and merge** (ou en ligne de commande avec `git rebase` + fast-forward si vous êtes en local). Comparez le résultat sur `main` avec celui obtenu à l'étape 5.
7. Nettoyez les branches fusionnées, localement et à distance.

## Questions théoriques
1. Après un Squash and merge, la branche de fonctionnalité d'origine contient-elle toujours ses commits individuels ? Et sur `main` ?
2. Dans quel contexte d'équipe choisiriez-vous Rebase and merge plutôt que Squash and merge ?

## Critères de réussite
- [ ] Un cycle complet de PR (branche → push → PR → review → correction → fusion) a été réalisé au moins deux fois avec deux stratégies de fusion différentes
- [ ] Vous pouvez expliquer la différence exacte, sur `main`, entre les deux stratégies utilisées
