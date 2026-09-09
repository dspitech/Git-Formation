# Lab 05 - Capstone Partie 1 : Journal de bord

**Partie :** 1 - Fondations (synthèse) · **Modules associés :** 0 à 3
**Notions testées :** configuration, cycle complet add/commit, exploration d'historique
**Durée estimée :** 40 min
**Correction :** [`../corrections/Lab-05-capstone-journal-de-bord-correction.md`](../corrections/Lab-05-capstone-journal-de-bord-correction.md)

## Contexte
Vous créez `~/git-formation/journal-pro`, un journal de bord professionnel documentant une semaine de travail fictive, en mobilisant tout ce qui a été vu dans la Partie 1.

## Consignes
1. Configurez (ou vérifiez) votre identité Git, avec un alias `git lg` pour visualiser le graphe.
2. Initialisez le dépôt et créez 5 fichiers `lundi.md` à `vendredi.md`, chacun avec au moins 2 lignes de contenu, chacun dans un commit séparé au format Conventional Commits.
3. Le mercredi, vous vous rendez compte d'une erreur dans `lundi.md` : corrigez-la dans un nouveau commit `fix:`.
4. Le jeudi, utilisez `git add -p` pour committer séparément deux ajouts différents faits en une seule salve d'édition dans `jeudi.md`.
5. Renommez tous les fichiers en `jour-01-lundi.md`, `jour-02-mardi.md`, etc. avec `git mv`, en un ou plusieurs commits `chore:`.
6. Une fois la semaine terminée, explorez : combien de commits au total ? Combien contiennent `feat` dans leur message ? Quel fichier a été modifié le plus grand nombre de fois (`git log --follow` peut aider sur un fichier renommé) ?
7. Comparez le tout premier et le tout dernier commit du dépôt avec `git diff`.
8. Créez un tag léger `v1-semaine-1` sur le dernier commit (les tags annotés seront vus en Partie 4).

## Questions théoriques
1. Pourquoi est-il préférable d'avoir committé chaque jour séparément plutôt qu'un seul gros commit final "ajoute toute la semaine" ?
2. Si vous deviez présenter ce dépôt à un recruteur technique, quels éléments de l'historique mettraient en valeur votre rigueur ?

## Critères de réussite
- [ ] Au moins 8 commits distincts, tous avec des messages Conventional Commits clairs
- [ ] `git add -p` a été utilisé avec succès
- [ ] `git mv` a été utilisé pour renommer les fichiers sans casser l'historique
- [ ] Vous savez expliquer chaque ligne de `git log --oneline --graph` sans hésitation
