# Lab 30 - PROJET FINAL : Boulangerie Dupont

**Partie :** 6 - Pro (capstone final) · **Modules associés :** TOUS (0 à 23)
**Notions testées :** intégralité du cours
**Durée estimée :** 2 à 3 heures
**Correction :** [`../corrections/Lab-30-projet-final-boulangerie-correction.md`](../corrections/Lab-30-projet-final-boulangerie-correction.md)

## Contexte
Ce projet de synthèse simule la vie complète d'un site vitrine pour une boulangerie, de sa création jusqu'à une version taguée en production, en mobilisant l'intégralité des notions du cours. Ne l'abordez qu'après avoir terminé les 29 labs précédents.

## Consignes

### Phase 1 - Initialisation professionnelle (Modules 0, 1, 2, 13)
1. Configurez votre identité si nécessaire, créez `~/git-formation/boulangerie-finale`, avec un `.gitignore` complet dès le premier commit (dépendances, secrets, logs, fichiers système).
2. Rédigez un `README.md` et un premier commit `chore:`.

### Phase 2 - Développement en branches (Modules 4, 6, 9)
3. Développez au moins 3 fonctionnalités sur des branches courtes séparées (page produits, page horaires, page contact), en respectant un GitHub Flow, avec au moins une fusion en fast-forward et une en merge commit naturel.
4. Rebasez au moins une branche de fonctionnalité locale sur `main` avant de la fusionner.

### Phase 3 - Conflit et collaboration (Modules 5, 7, 8)
5. Simulez un second contributeur (second clone d'un dépôt bare local, ou compte GitHub) et provoquez un conflit réel entre les deux contributeurs sur un même fichier, à résoudre proprement.
6. Ouvrez et fusionnez au moins une Pull Request (réelle sur GitHub, ou simulée via un second clone).

### Phase 4 - Incident de sécurité et nettoyage (Modules 10, 13, 14, 20)
7. Committez par erreur un fichier `config.env` contenant un faux secret. Appliquez d'abord la correction simple, constatez son insuffisance, puis effacez complètement le secret de l'historique avec `git filter-repo`.
8. Nettoyez un historique volontairement désordonné avec un rebase interactif avant de le considérer comme prêt à être partagé.

### Phase 5 - Gestion avancée (Modules 11, 12, 15, 16)
9. Utilisez un stash pour gérer une interruption de travail par une urgence.
10. Isolez un correctif de sécurité critique sur une branche `dev` et appliquez-le sur `main` par cherry-pick.
11. Introduisez un bug traçable dans un historique d'au moins 10 commits, puis retrouvez-le avec `git bisect run`.
12. Versionnez le projet avec au moins 3 tags annotés respectant SemVer (`v1.0.0`, un correctif `v1.0.1`, une nouvelle fonctionnalité `v1.1.0`).

### Phase 6 - Récupération et gouvernance (Modules 18, 21, 22, 23)
13. Mettez en place un hook `pre-commit` empêchant tout secret évident d'être committé (motif `API_KEY=`, `PASSWORD=`, etc.).
14. Simulez un `reset --hard` accidentel sur un commit important, puis récupérez-le intégralement via `git reflog`.
15. Rédigez `CONTRIBUTING.md` et `.github/CODEOWNERS` complets et cohérents avec tout le travail réalisé.
16. *(Si compte GitHub disponible)* Configurez une règle de protection de branche sur `main`.

### Phase 7 - Bilan
17. Produisez un graphe final complet (`git log --oneline --graph --all --decorate`) et soyez capable de raconter l'intégralité de l'histoire du projet en le lisant, sans aucune note.
18. Rédigez un rapport de fin de projet (une demi-page) résumant chaque incident rencontré, chaque technique utilisée pour le résoudre, et la leçon professionnelle associée.

## Critères de réussite finale
- [ ] Toutes les phases ont été réalisées dans l'ordre, sans sauter d'étape
- [ ] Le dépôt final est propre, documenté, versionné, et sécurisé (aucun secret dans l'historique final)
- [ ] Vous pouvez présenter ce projet et son historique à un tiers technique sans préparation supplémentaire
- [ ] Le rapport de fin de projet démontre une compréhension claire du **pourquoi** de chaque technique utilisée, pas seulement du **comment**
