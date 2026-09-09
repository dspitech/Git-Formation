# Lab 20 - Cherry-pick

**Partie :** 5 - Avancé · **Module associé :** 15
**Notions testées :** cherry-pick simple, plage de commits, conflit, traçabilité (-x)
**Durée estimée :** 30 min
**Correction :** [`../corrections/Lab-20-cherry-pick-correction.md`](../corrections/Lab-20-cherry-pick-correction.md)

## Contexte
Vous gérez `~/git-formation/lab-cherry-pro`, où une branche `dev` contient un mélange de fonctionnalités inachevées et de correctifs urgents à isoler.

## Consignes
1. Créez le dépôt, un commit initial sur `main`, puis une branche `dev` avec 5 commits : 2 fonctionnalités inachevées, 2 correctifs de sécurité, 1 autre fonctionnalité inachevée (dans un ordre mélangé).
2. Identifiez précisément les hash des deux commits de correctifs de sécurité.
3. Depuis `main`, appliquez le **premier** correctif via cherry-pick, avec l'option qui trace l'origine du commit (`-x`).
4. Appliquez le **second** correctif via cherry-pick en utilisant une plage (`..`) si les deux commits de sécurité sont consécutifs sur `dev`, sinon appliquez-le individuellement.
5. Vérifiez que `main` contient uniquement les deux correctifs, aucune des fonctionnalités inachevées.
6. Provoquez un conflit lors d'un cherry-pick : modifiez la même ligne d'un fichier sur `main` et sur un commit de `dev`, puis cherry-pickez ce commit et résolvez le conflit.
7. Taguez `main` en `v1.0.1` après l'intégration des deux correctifs.
8. Vérifiez avec `git log -1` que le message du commit cherry-pické avec `-x` mentionne bien sa provenance.

## Questions théoriques
1. Pourquoi est-il important, dans un contexte professionnel de backport, d'utiliser systématiquement `-x` ?
2. Si vous deviez finalement fusionner toute la branche `dev` dans `main` plus tard, que se passerait-il avec les commits déjà cherry-pickés (dupliqués) ?

## Critères de réussite
- [ ] Deux correctifs isolés ont été appliqués sur `main` par cherry-pick sans les fonctionnalités inachevées
- [ ] Un conflit de cherry-pick a été rencontré et résolu
- [ ] Vous savez expliquer pourquoi le hash du commit cherry-pické diffère de l'original
