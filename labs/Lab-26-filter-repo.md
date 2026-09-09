# Lab 26 - filter-repo : réécrire l'historique

**Partie :** 6 - Pro · **Module associé :** 20
**Notions testées :** filter-repo --path --invert-paths, --replace-text
**Durée estimée :** 30 min
**Correction :** [`../corrections/Lab-26-filter-repo-correction.md`](../corrections/Lab-26-filter-repo-correction.md)

## Contexte
Une fuite de secret a eu lieu dans `~/git-formation/lab-filter-repo-pro` il y a plusieurs commits : il faut nettoyer intégralement l'historique.

## Consignes
1. Créez le dépôt avec 5 commits successifs, dont l'un (le 2e) ajoute un fichier `credentials.json` contenant un faux secret, et un autre (le 4e) ajoute une clé API en dur directement dans un fichier de code `config.py`.
2. Confirmez avec `git log -p -- credentials.json` que le secret est bien visible.
3. Appliquez la correction « simple » (`.gitignore` + `rm --cached`) sur `credentials.json` et constatez qu'elle ne suffit pas en consultant à nouveau l'historique.
4. Installez `git-filter-repo`, puis effacez complètement `credentials.json` de tout l'historique.
5. Vérifiez qu'aucune trace de ce fichier ne subsiste, y compris dans les anciens commits.
6. Utilisez `--replace-text` pour remplacer la clé API en dur dans `config.py` par la chaîne `CLE_SUPPRIMEE`, partout dans l'historique où elle apparaît.
7. Vérifiez qu'aucune occurrence de l'ancienne clé ne subsiste dans l'historique réécrit.
8. Rédigez, en commentaire dans un fichier `INCIDENT.md`, la procédure complète que vous suivriez dans un vrai contexte d'équipe pour publier cette réécriture sans casser le travail des collaborateurs.

## Questions théoriques
1. Pourquoi les hash de **tous** les commits postérieurs au commit fautif changent-ils après un `filter-repo`, même ceux qui n'ont jamais touché le fichier concerné ?
2. Quelle est la toute première action à effectuer, avant même de lancer `filter-repo`, en cas de fuite d'un vrai secret de production ?

## Critères de réussite
- [ ] Un fichier a été complètement effacé de tout l'historique, avec vérification
- [ ] Un remplacement de texte sensible a été appliqué avec succès sur l'ensemble de l'historique
- [ ] Une procédure de communication d'équipe a été rédigée
