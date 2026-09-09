# Lab 09 - Capstone Partie 2 : Site vitrine multi-branches

**Partie :** 2 - Branches (synthèse) · **Modules associés :** 4 à 6
**Notions testées :** branches, fusions variées, conflits, rebase
**Durée estimée :** 45 min
**Correction :** [`../corrections/Lab-09-capstone-site-vitrine-branches-correction.md`](../corrections/Lab-09-capstone-site-vitrine-branches-correction.md)

## Contexte
Vous développez `~/git-formation/site-vitrine-final`, un site vitrine pour une association, avec plusieurs contributeurs simulés travaillant en parallèle sur des branches.

## Consignes
1. Initialisez le dépôt, `index.html` avec un titre, premier commit sur `main`.
2. Développez 3 branches en parallèle depuis `main` : `page-evenements`, `page-benevoles`, `page-dons`, chacune ajoutant un fichier HTML dédié avec un commit.
3. Fusionnez `page-evenements` dans `main` (devrait être un fast-forward).
4. Avant de fusionner `page-benevoles`, modifiez `index.html` sur `main` (ajout d'un lien de navigation), committez. Fusionnez ensuite `page-benevoles` : un merge commit doit apparaître.
5. Rebasez `page-dons` sur le `main` actuel (désormais en avance), résolvez tout conflit éventuel, puis fusionnez (fast-forward attendu).
6. Créez volontairement un conflit : sur `main`, modifiez la ligne du titre principal dans `index.html` ; sur une nouvelle branche `refonte-titre`, modifiez la même ligne différemment. Fusionnez et résolvez le conflit en combinant intelligemment les deux propositions.
7. Nettoyez toutes les branches fusionnées.
8. Produisez un graphe final (`git log --oneline --graph --all`) et identifiez, sans notes, quel commit correspond à quel type de fusion (fast-forward, merge naturel, rebase, résolution de conflit).

## Questions théoriques
1. Si vous deviez recommencer ce scénario en équipe réelle (pas simulée), quelles pratiques du Module 9 (workflows) auraient réduit le nombre de conflits rencontrés ?
2. Pourquoi le rebase de `page-dons` à l'étape 5 était-il acceptable ici, alors que la règle d'or interdit de rebaser des branches partagées ?

## Critères de réussite
- [ ] Les 4 types d'intégration (fast-forward, merge naturel, rebase, résolution de conflit) ont chacun été réalisés au moins une fois
- [ ] Le graphe final est propre et compréhensible
- [ ] Vous pouvez raconter l'histoire complète du dépôt en lisant uniquement le graphe, sans notes
