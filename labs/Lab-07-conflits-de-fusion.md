# Lab 07 - Résolution de conflits de fusion

**Partie :** 2 - Branches · **Module associé :** 5
**Notions testées :** conflit de fusion, marqueurs, résolution manuelle, --ours/--theirs, merge --abort
**Durée estimée :** 35 min
**Correction :** [`../corrections/Lab-07-conflits-de-fusion-correction.md`](../corrections/Lab-07-conflits-de-fusion-correction.md)

## Contexte
Vous continuez `~/git-formation/lab-portfolio`. Une modification du titre de la page va être faite en parallèle sur deux branches.

## Consignes
1. Depuis `main`, créez une branche `titre-v2`, modifiez la ligne du titre dans `index.html`, committez.
2. Sur `main`, modifiez **la même ligne** différemment, committez.
3. Fusionnez `titre-v2` dans `main` : un conflit doit apparaître. Observez précisément les marqueurs dans `index.html`.
4. Résolvez le conflit en **combinant intelligemment** les deux versions (pas en choisissant arbitrairement l'une ou l'autre), finalisez le commit de résolution.
5. Créez une deuxième situation de conflit sur un fichier `style.css` entre `main` et une nouvelle branche `couleurs-v2`, mais cette fois résolvez-le en gardant **uniquement** la version de `main` grâce à `git checkout --ours`.
6. Créez une troisième situation de conflit sur `contact.html`, mais cette fois, après avoir constaté le conflit, **annulez complètement** la tentative de fusion sans rien résoudre.
7. Vérifiez que l'état du dépôt après l'annulation est identique à l'état juste avant la tentative de fusion.

## Questions théoriques
1. Pourquoi Git ne tente-t-il jamais de deviner automatiquement laquelle des deux versions en conflit est la "bonne" ?
2. Dans quel cas est-il légitime d'utiliser `--ours`/`--theirs` plutôt qu'une résolution manuelle ligne par ligne ?

## Critères de réussite
- [ ] Un conflit a été résolu manuellement en combinant les deux versions
- [ ] Un conflit a été résolu avec `--ours`
- [ ] Un `merge --abort` a été utilisé avec succès, avec vérification de l'état restauré
