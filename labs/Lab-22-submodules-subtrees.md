# Lab 22 - Submodules et Subtrees

**Partie :** 5 - Avancé · **Module associé :** 17
**Notions testées :** submodule add/update, clone avec submodules, notion de subtree
**Durée estimée :** 30 min
**Correction :** [`../corrections/Lab-22-submodules-subtrees-correction.md`](../corrections/Lab-22-submodules-subtrees-correction.md)

## Contexte
Vous partagez une bibliothèque commune (`~/git-formation/lib-partagee`) entre deux projets indépendants, via submodule.

## Consignes
1. Créez le dépôt `lib-partagee` avec une fonction utilitaire, un commit.
2. Créez `projet-alpha`, ajoutez `lib-partagee` comme submodule dans `libs/partagee`, committez.
3. Créez `projet-beta`, ajoutez la même bibliothèque en submodule, committez.
4. Faites évoluer `lib-partagee` (nouveau commit), et mettez à jour **uniquement** `projet-alpha` vers cette nouvelle version avec `git submodule update --remote`, en laissant `projet-beta` sur l'ancienne version.
5. Committez cette mise à jour de submodule dans `projet-alpha`.
6. Clonez `projet-alpha` dans un nouveau dossier **sans** l'option `--recurse-submodules` : observez que le dossier du submodule est vide.
7. Corrigez avec `git submodule update --init --recursive` et vérifiez que le contenu apparaît.
8. Clonez `projet-beta` cette fois **avec** `--recurse-submodules` directement, en une seule commande.

## Questions théoriques
1. Pourquoi `projet-alpha` et `projet-beta` peuvent-ils légitimement pointer vers deux commits différents de la même bibliothèque `lib-partagee` ?
2. Dans quel cas choisiriez-vous un subtree plutôt qu'un submodule pour ce même scénario de bibliothèque partagée ?

## Critères de réussite
- [ ] Un submodule a été ajouté et mis à jour indépendamment dans deux projets différents
- [ ] Vous avez observé concrètement le dossier vide après un clone sans `--recurse-submodules`, puis sa correction
