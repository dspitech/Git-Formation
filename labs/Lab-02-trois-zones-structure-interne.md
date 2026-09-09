#  Lab 02 - Les trois zones et la structure interne de Git

**Partie :** 1 - Fondations · **Module associé :** 1
**Notions testées :** Working Directory / Staging / Repository, structure de `.git/`
**Durée estimée :** 20 min
**Correction :** [`../corrections/Lab-02-trois-zones-structure-interne-correction.md`](../corrections/Lab-02-trois-zones-structure-interne-correction.md)

## Contexte
Avant de manipuler Git en profondeur, vous allez observer concrètement ce qu'il se passe dans `.git/` à chaque étape clé.

## Consignes
1. Créez un dépôt `~/git-formation/lab-structure`.
2. Avant tout commit, observez `.git/HEAD`, `.git/refs` et `.git/objects` : que contiennent-ils ?
3. Créez un fichier `notes.txt`, observez son état avec `git status`.
4. Stagez-le, ré-observez `.git/objects` : un nouvel objet est-il apparu ? Utilisez `git cat-file -t` sur le hash trouvé le plus récent dans `.git/objects` (indice : `find .git/objects -type f`).
5. Committez, puis ré-observez `.git/refs/heads/main` : que contient ce fichier désormais ?
6. Modifiez `notes.txt` sans committer. Répondez par écrit : dans quelle « zone » se trouve actuellement cette modification ?
7. Stagez la modification. Répondez : dans quelle zone se trouve-t-elle maintenant ?
8. Committez. Combien d'objets `commit` existent désormais dans `.git/objects` ? (indice : `git cat-file -t` sur chaque hash trouvé)

## Questions théoriques
1. Pourquoi un objet blob apparaît-il dans `.git/objects` **avant même** le commit, dès le `git add` ?
2. Que contient exactement le fichier `.git/refs/heads/main` ?

## Critères de réussite
- [ ] Vous avez observé l'apparition d'objets dans `.git/objects` à chaque étape (add, commit)
- [ ] Vous pouvez expliquer sans notes à quelle zone correspond chaque état (untracked/modified/staged/committed)
