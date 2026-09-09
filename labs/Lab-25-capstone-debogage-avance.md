# Lab 25 - Capstone Partie 5 : Débogage et historique avancé

**Partie :** 5 - Avancé (synthèse) · **Modules associés :** 14 à 19
**Notions testées :** rebase interactif, cherry-pick, bisect, hooks combinés
**Durée estimée :** 60 min
**Correction :** [`../corrections/Lab-25-capstone-debogage-avance-correction.md`](../corrections/Lab-25-capstone-debogage-avance-correction.md)

## Contexte
Vous reprenez le rôle d'un développeur senior appelé en renfort sur `~/git-formation/projet-en-crise`, un projet dans un état d'historique désordonné avec un bug caché.

## Consignes
1. Créez le dépôt et générez un historique de 12 commits sur `moteur.txt`, mélangeant des messages clairs et des messages brouillons (`wip`, `fix`, `oops`), avec un bug (`ERREUR=true` ajouté au fichier) introduit précisément à un commit de votre choix entre le 5e et le 9e.
2. **Sans savoir où se trouve le bug** (imaginez que vous ne l'avez pas placé vous-même), utilisez `git bisect run` avec un script pour l'identifier automatiquement.
3. Une fois le commit fautif identifié, créez une branche `fix-urgence` depuis `main`, et corrigez le bug dans un commit dédié.
4. Cherry-pickez ce correctif directement sur `main` (simulant qu'il doit partir en production immédiatement, sans attendre une revue complète de `fix-urgence`).
5. Nettoyez ensuite l'historique de `fix-urgence` avec un rebase interactif pour ne garder qu'un seul commit propre avant de la fusionner plus tard dans une autre branche de développement.
6. Ajoutez un hook `pre-commit` qui aurait pu **empêcher** ce type de bug d'être introduit (par exemple, un hook bloquant tout ajout de la chaîne `ERREUR=true`).
7. Testez que ce hook bloque bien une tentative de réintroduction du même bug.
8. Rédigez un court rapport post-mortem (quelques lignes) expliquant la chronologie de l'incident et les mesures prises.

## Questions théoriques
1. En quoi ce scénario illustre-t-il la complémentarité entre bisect (diagnostic), cherry-pick (correction ciblée) et hooks (prévention) ?
2. Si ce bug avait été introduit dans un commit déjà fusionné dans `main` et poussé en production depuis plusieurs jours, quelle commande du Module 10 auriez-vous utilisée plutôt qu'un simple correctif direct ?

## Critères de réussite
- [ ] Le bug a été localisé automatiquement via `git bisect run`, sans recherche manuelle
- [ ] Un correctif a été appliqué en urgence sur `main` via cherry-pick
- [ ] Un hook préventif a été mis en place et testé avec succès
