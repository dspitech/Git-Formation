# Lab 18 - Capstone Partie 4 : Nettoyage et versioning

**Partie :** 4 - Intermédiaire (synthèse) · **Modules associés :** 10 à 13
**Notions testées :** reset/revert, stash, tags, .gitignore combinés
**Durée estimée :** 45 min
**Correction :** [`../corrections/Lab-18-capstone-nettoyage-versioning-correction.md`](../corrections/Lab-18-capstone-nettoyage-versioning-correction.md)

## Contexte
Vous gérez `~/git-formation/lib-versionnee`, une petite bibliothèque, à travers un cycle de vie complet incluant plusieurs incidents à corriger.

## Consignes
1. Initialisez le dépôt avec un `.gitignore` adapté dès le premier commit (dépendances, secrets, logs).
2. Développez une première fonctionnalité, committez, taguez `v1.0.0` (annoté).
3. Un commit ultérieur casse une fonctionnalité critique et a déjà été poussé (simulez avec un second dépôt bare) : annulez-le avec `revert`, pas `reset`.
4. Alors que vous travaillez sur une nouvelle fonctionnalité, une urgence survient : mettez votre travail en stash, traitez l'urgence (commit + tag `v1.0.1`), puis récupérez votre travail en stash.
5. Vous réalisez qu'un fichier `secrets.env` a été committé par erreur trois commits plus tôt (dans cette session de travail) : corrigez le suivi futur avec `.gitignore` + `rm --cached` (la réécriture complète de l'historique sera vue en Partie 6).
6. Terminez la fonctionnalité, committez, taguez `v1.1.0`.
7. Faites un `reset --hard` accidentel qui efface ce dernier commit important par erreur - ne le corrigez pas encore, ce sera l'objet du Lab 25 (Partie 5).
8. Listez tous les tags créés et vérifiez, avec `git show`, que chacun est bien annoté avec un message pertinent.

## Questions théoriques
1. Pourquoi avoir choisi `revert` plutôt que `reset` à l'étape 3, alors que dans un dépôt purement local vous auriez pu utiliser les deux ?
2. Quelle est la limite de la correction apportée à l'étape 5, et quel module du cours permettra de la dépasser complètement ?

## Critères de réussite
- [ ] Au moins 3 tags annotés cohérents avec SemVer ont été créés au fil du scénario
- [ ] Un stash a permis de gérer une interruption sans perte de travail
- [ ] Un `revert` a été utilisé correctement sur un commit déjà partagé
