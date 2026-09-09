# Lab 15 - Stash et travail temporaire

**Partie :** 4 - Intermédiaire · **Module associé :** 11
**Notions testées :** stash, stash -u, gestion de plusieurs stash, stash branch
**Durée estimée :** 25 min
**Correction :** [`../corrections/Lab-15-stash-correction.md`](../corrections/Lab-15-stash-correction.md)

## Contexte
Vous gérez `~/git-formation/lab-stash-pro`, où plusieurs interruptions vont survenir pendant votre travail.

## Consignes
1. Créez le dépôt avec un commit initial sur `app.txt`.
2. Commencez une modification dans `app.txt` sans la committer, mettez-la de côté avec un message descriptif.
3. Créez un nouveau fichier `nouveau.txt` (untracked) en plus d'une modification de `app.txt`, puis mettez les deux de côté en une seule fois grâce à l'option qui inclut les untracked.
4. Simulez une urgence : committez un correctif rapide.
5. Récupérez le tout dernier stash et vérifiez que le fichier untracked est bien revenu.
6. Créez 3 stash successifs sur des modifications différentes de `app.txt`, listez-les, affichez le contenu du stash du milieu sans l'appliquer, puis appliquez-le sans le retirer de la pile.
7. Provoquez un conflit lors d'un `git stash pop` (modifiez la même ligne sur la branche courante après avoir stashé), résolvez-le comme un conflit classique.
8. Nettoyez tous les stash restants.

## Questions théoriques
1. Pourquoi le stash n'inclut-il pas les fichiers untracked par défaut ?
2. Que se passe-t-il si un `git stash pop` génère un conflit : le stash est-il automatiquement retiré de la pile ?

## Critères de réussite
- [ ] Au moins 3 stash ont coexisté dans la pile à un moment donné
- [ ] Un stash incluant un fichier untracked a été créé et restauré avec succès
- [ ] Un conflit lors d'un `stash pop` a été rencontré et résolu
