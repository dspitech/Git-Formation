# Lab 27 — CODEOWNERS et protection de branche

**Partie :** 6 — Pro · **Module associé :** 21
**Notions testées :** CODEOWNERS, règles de protection de branche, signature de commit
**Durée estimée :** 30 min (nécessite un compte GitHub pour la partie protection de branche)
**Correction :** [`../corrections/Lab-27-codeowners-branch-protection-correction.md`](../corrections/Lab-27-codeowners-branch-protection-correction.md)

## Contexte
Vous mettez en place la gouvernance de `formation-git-gouvernance`, un dépôt avec plusieurs zones de responsabilité distinctes.

## Consignes
1. Créez le dépôt (local ou GitHub), avec une structure `backend/`, `frontend/`, `infra/`.
2. Rédigez un fichier `.github/CODEOWNERS` assignant un relecteur par défaut pour tout le dépôt, et des relecteurs spécifiques différents pour chacun des trois dossiers.
3. *(Si compte GitHub disponible)* Configurez une règle de protection sur `main` : Pull Request obligatoire, au moins 1 approbation requise, et review des Code Owners obligatoire.
4. *(Si compte GitHub disponible)* Ouvrez une PR modifiant un fichier de `infra/` et vérifiez que le bon relecteur est automatiquement assigné.
5. *(Si compte GitHub disponible)* Tentez un push direct sur `main` : vérifiez qu'il est refusé par la règle de protection.
6. Configurez, en local, une signature de commit GPG si vous disposez d'une clé (sinon, documentez par écrit les commandes que vous utiliseriez).
7. Créez un commit signé et vérifiez sa signature avec `git log --show-signature -1`.
8. Rédigez une checklist de gouvernance minimale (3 à 5 points) que vous recommanderiez à toute nouvelle équipe démarrant un projet Git professionnel.

## Questions théoriques
1. Pourquoi CODEOWNERS seul, sans activer « Require review from Code Owners » dans les règles de branche, n'a-t-il aucun effet contraignant ?
2. Un commit signé garantit-il que son contenu est exempt de bugs ou de failles de sécurité ? Justifiez.

## Critères de réussite
- [ ] Un fichier CODEOWNERS cohérent avec au moins 3 zones de responsabilité a été créé
- [ ] Une checklist de gouvernance a été rédigée et justifiée
