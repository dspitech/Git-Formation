# Lab 16 - Tags et versions

**Partie :** 4 - Intermédiaire · **Module associé :** 12
**Notions testées :** tags légers/annotés, SemVer, navigation entre versions
**Durée estimée :** 25 min
**Correction :** [`../corrections/Lab-16-tags-versions-correction.md`](../corrections/Lab-16-tags-versions-correction.md)

## Contexte
Vous versionnez `~/git-formation/lab-versioning`, une petite bibliothèque logicielle fictive, en respectant strictement le Semantic Versioning.

## Consignes
1. Créez le dépôt, un commit initial, taguez-le `v1.0.0` (annoté) avec un message décrivant la version.
2. Ajoutez une fonctionnalité rétrocompatible, committez, taguez `v1.1.0`.
3. Corrigez un bug, committez, taguez `v1.1.1`.
4. Faites un changement **non rétrocompatible** (cassant), committez, taguez `v2.0.0`.
5. Comparez `git show` sur un tag léger que vous créez maintenant (`v2.0.1-test`, sans `-a`) et sur `v1.0.0` (annoté) : identifiez précisément la différence d'affichage.
6. Naviguez sur `v1.1.0` (detached HEAD), vérifiez le contenu du projet à cette version précise, puis revenez sur `main` sans rien casser.
7. Listez uniquement les tags correspondant au motif `v1.*`.
8. Supprimez le tag de test `v2.0.1-test` (localement).

## Questions théoriques
1. Pourquoi un changement cassant doit-il obligatoirement incrémenter le chiffre `MAJOR` selon SemVer ?
2. Que risqueriez-vous si vous faisiez un commit directement pendant que vous êtes en detached HEAD sur `v1.1.0`, sans créer de branche ?

## Critères de réussite
- [ ] Au moins 4 tags annotés créés, respectant strictement l'incrémentation SemVer selon la nature de chaque changement
- [ ] La différence entre tag léger et tag annoté a été observée concrètement via `git show`
