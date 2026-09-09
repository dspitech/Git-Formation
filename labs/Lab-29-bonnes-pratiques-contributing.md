# Lab 29 - Bonnes pratiques et CONTRIBUTING.md

**Partie :** 6 - Pro · **Module associé :** 23
**Notions testées :** conventions de commit, nommage de branches, documentation de workflow, checklist de sécurité
**Durée estimée :** 30 min
**Correction :** [`../corrections/Lab-29-bonnes-pratiques-contributing-correction.md`](../corrections/Lab-29-bonnes-pratiques-contributing-correction.md)

## Contexte
Vous êtes chargé de documenter les pratiques Git pour une nouvelle équipe rejoignant `formation-git-standards`.

## Consignes
1. Créez le dépôt avec un historique d'exemple d'au moins 6 commits variés (certains conformes aux bonnes pratiques, d'autres volontairement non conformes : messages vagues, branches mal nommées simulées par des commentaires).
2. Rédigez un `CONTRIBUTING.md` complet couvrant : le workflow choisi et pourquoi, la convention de messages de commit avec des exemples concrets tirés de votre propre historique, la convention de nommage des branches, et une checklist avant l'ouverture d'une Pull Request.
3. Rédigez un second fichier `SECURITY.md` décrivant la procédure à suivre en cas de découverte d'un secret committé par erreur, en citant les modules et commandes précises du cours (Modules 13 et 20).
4. Passez en revue votre propre historique d'exemple (étape 1) et identifiez, pour chaque commit non conforme, ce qui devrait être corrigé et avec quelle technique du cours (rebase interactif, amend...).
5. Effectuez réellement ces corrections sur votre historique de démonstration.
6. Ajoutez un hook `commit-msg` (Module 18) qui fait respecter techniquement la convention documentée dans votre `CONTRIBUTING.md`.
7. Testez que ce hook est cohérent à 100% avec ce que vous avez écrit dans la documentation (aucune contradiction entre le texte et le comportement réel).

## Questions théoriques
1. Pourquoi est-il important que la documentation (`CONTRIBUTING.md`) et l'automatisation (hooks) restent parfaitement synchronisées ?
2. Quel est le risque d'une documentation de bonnes pratiques qui n'est jamais vérifiée par un mécanisme technique ?

## Critères de réussite
- [ ] `CONTRIBUTING.md` et `SECURITY.md` sont complets, cohérents et citent des exemples concrets
- [ ] L'historique de démonstration a été nettoyé pour être conforme à sa propre documentation
- [ ] Le hook `commit-msg` reflète exactement les règles documentées
