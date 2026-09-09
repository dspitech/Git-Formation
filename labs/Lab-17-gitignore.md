# Lab 17 - .gitignore et gestion des fichiers

**Partie :** 4 - Intermédiaire · **Module associé :** 13
**Notions testées :** syntaxe .gitignore, check-ignore, rm --cached, correction d'un secret déjà suivi
**Durée estimée :** 30 min
**Correction :** [`../corrections/Lab-17-gitignore-correction.md`](../corrections/Lab-17-gitignore-correction.md)

## Contexte
Vous mettez en place la gestion des fichiers de `~/git-formation/lab-gitignore-pro`, un projet simulant une vraie structure d'application web.

## Consignes
1. Créez le dépôt, puis simulez une structure réaliste : un dossier `node_modules/` avec un fichier fictif, un fichier `.env` avec un faux secret, un fichier `debug.log`, un fichier `.DS_Store`, et un fichier de code légitime `app.js`.
2. Observez le problème avec `git status` avant tout `.gitignore`.
3. Créez un `.gitignore` couvrant chacun de ces cas, avec une règle par catégorie (dépendances, secrets, logs, fichiers système).
4. Vérifiez avec `git check-ignore -v` que chaque fichier sensible est bien couvert par une règle précise, et identifiez quelle ligne du `.gitignore` est responsable pour chacun.
5. Ajoutez une exception : un fichier `important.log` ne doit **pas** être ignoré malgré la règle générale sur `*.log`.
6. Committez proprement (uniquement `.gitignore` et `app.js`).
7. Simulez l'erreur inverse dans un second dépôt : committez un `.env` réel par erreur **avant** de créer le `.gitignore`, puis corrigez avec `git rm --cached`, et constatez avec `git log -p` que le secret reste visible dans l'historique passé.
8. Utilisez `git ls-files` pour confirmer que `.env` n'apparaît plus dans les fichiers actuellement suivis, malgré sa présence dans l'historique.

## Questions théoriques
1. Pourquoi une règle `*.log` combinée à une exception `!important.log` fonctionne-t-elle, et dans quel ordre Git évalue-t-il ces règles ?
2. Que feriez-vous, dans l'ordre exact des priorités, si vous découvriez qu'une vraie clé API de production a été committée il y a 3 mois ?

## Critères de réussite
- [ ] Un `.gitignore` complet avec au moins une exception (`!`) a été mis en place et vérifié avec `check-ignore`
- [ ] Un fichier déjà suivi a été correctement retiré du suivi futur avec `git rm --cached`, et vous savez expliquer pourquoi il reste visible dans l'historique passé
