# Lab 08 - Rebase

**Partie :** 2 - Branches · **Module associé :** 6
**Notions testées :** rebase simple, résolution de conflit pendant un rebase, comparaison avec merge
**Durée estimée :** 35 min
**Correction :** [`../corrections/Lab-08-rebase-correction.md`](../corrections/Lab-08-rebase-correction.md)

## Contexte
Vous comparez concrètement `merge` et `rebase` sur un scénario identique, dans deux copies du même dépôt.

## Consignes
1. Créez `~/git-formation/lab-rebase-compare`, avec un commit initial sur `config.txt`.
2. Créez une branche `feature-y`, modifiez `config.txt`, committez.
3. Sur `main`, modifiez **la même zone** de `config.txt` différemment, committez (créant une divergence).
4. Dupliquez tout le dossier du dépôt (`cp -r`) dans `lab-rebase-compare-copie`, pour comparer les deux approches sur un scénario identique.
5. Dans le dossier original : fusionnez `feature-y` dans `main` avec un `merge` classique. Observez le graphe.
6. Dans la copie : rebasez `feature-y` sur `main` (résolvez le conflit probable), puis fusionnez (qui devrait désormais être un fast-forward). Observez le graphe.
7. Comparez visuellement les deux graphes obtenus (`git log --oneline --graph --all` dans chaque dossier) : notez au moins deux différences.
8. Dans la copie (rebase), ajoutez un nouveau commit sur `feature-y` **après** le premier rebase, puis refaites un `git rebase main` : combien de commits sont rejoués cette seconde fois ?

## Questions théoriques
1. Pourquoi le second rebase de l'étape 8 ne rejoue-t-il pas tous les commits de `feature-y`, mais seulement les nouveaux ?
2. Dans quelle des deux versions du dépôt (merge ou rebase) est-il possible de savoir, rien qu'en lisant le graphe, à quel moment exact `feature-y` a été intégrée à `main` ?

## Critères de réussite
- [ ] Les deux approches (merge et rebase) ont été réalisées sur un scénario identique et comparées
- [ ] Un conflit pendant un rebase a été résolu avec `git rebase --continue`
- [ ] Vous pouvez expliquer sans notes pourquoi les hash changent après un rebase
