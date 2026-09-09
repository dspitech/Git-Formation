# Lab 12 - Workflows d'équipe

**Partie :** 3 - Collaboratif · **Module associé :** 9
**Notions testées :** GitHub Flow, Git Flow simplifié, choix de workflow selon contexte
**Durée estimée :** 35 min
**Correction :** [`../corrections/Lab-12-workflows-equipe-correction.md`](../corrections/Lab-12-workflows-equipe-correction.md)

## Contexte
Vous allez implémenter, dans deux dépôts séparés, un cycle GitHub Flow puis un cycle Git Flow simplifié, pour ressentir concrètement leurs différences.

## Consignes - Partie A : GitHub Flow
1. Créez `~/git-formation/atelier-githubflow`, un commit initial sur `main`.
2. Développez 2 fonctionnalités indépendantes, chacune sur une branche courte, fusionnée dans `main` dès qu'elle est terminée (via merge ou PR simulée).
3. Vérifiez que `main` reste "toujours déployable" : à aucun moment le dépôt ne devrait contenir de code non fonctionnel sur cette branche.

## Consignes - Partie B : Git Flow simplifié
4. Créez `~/git-formation/atelier-gitflow`, avec une branche `develop` créée depuis `main`.
5. Développez 2 fonctionnalités sur des branches `feature/*` créées depuis `develop`, fusionnées dans `develop`.
6. Créez une branche `release/1.0` depuis `develop`, corrigez-y un petit détail (ex. numéro de version dans un fichier), puis fusionnez `release/1.0` à la fois dans `main` (avec un tag `v1.0.0`) et dans `develop`.

## Questions théoriques
1. Dans le scénario Git Flow, pourquoi faut-il fusionner `release/1.0` **à la fois** dans `main` et dans `develop` ?
2. Pour un produit SaaS déployé plusieurs fois par jour, laquelle des deux structures de dépôt créée dans ce lab reproduit le workflow le plus adapté ? Pourquoi ?

## Critères de réussite
- [ ] Les deux structures (GitHub Flow et Git Flow) ont été implémentées avec succès
- [ ] Le tag `v1.0.0` a bien été créé sur `main` dans le scénario Git Flow
- [ ] Vous pouvez expliquer sans notes pourquoi `develop` existe dans un Git Flow mais pas dans un GitHub Flow
