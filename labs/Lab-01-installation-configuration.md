#  Lab 01 - Installation et configuration de Git

**Partie :** 1 - Fondations · **Module associé :** 0
**Notions testées :** installation, configuration multi-niveaux, alias
**Durée estimée :** 20 min
**Correction :** [`../corrections/Lab-01-installation-configuration-correction.md`](../corrections/Lab-01-installation-configuration-correction.md)

## Contexte
Vous préparez votre poste de travail pour toute la formation, comme le ferait un développeur à son arrivée dans une nouvelle entreprise.

## Consignes
1. Vérifiez que Git est installé et notez sa version.
2. Configurez votre identité globale (nom + email).
3. Activez la coloration du terminal et fixez `main` comme branche par défaut.
4. Créez un alias `git st` pour `git status` et un alias `git lg` pour `git log --oneline --graph --all`.
5. Créez un dépôt de test `~/git-formation/verif-config`, faites-y un commit, et vérifiez avec `git lg` que l'alias fonctionne.
6. Affichez la provenance exacte (`--show-origin`) de `user.name` et de `alias.st`.
7. Créez un fichier local `.git/config` **différent** pour ce dépôt de test : changez `user.email` uniquement en local (simulez un email professionnel différent pour ce projet), puis vérifiez avec `--show-origin` que le `--local` l'emporte bien sur le `--global`.

## Questions théoriques
1. Si vous travaillez sur trois projets clients différents avec un email distinct pour chacun, quel niveau de configuration utiliseriez-vous pour chaque email, et pourquoi ?
2. Que se passerait-il si vous committiez avant d'avoir configuré `user.email` ?

## Critères de réussite
- [ ] `git --version` fonctionne et une version ≥ 2.30 est installée
- [ ] Les alias `st` et `lg` fonctionnent dans un dépôt de test
- [ ] Un `user.email` local différent du global a été mis en place et vérifié
