# Lab 21 - Git Bisect

**Partie :** 5 - Avancé · **Module associé :** 16
**Notions testées :** bisect manuel, bisect run automatisé
**Durée estimée :** 30 min
**Correction :** [`../corrections/Lab-21-bisect-correction.md`](../corrections/Lab-21-bisect-correction.md)

## Contexte
Un bug a été introduit quelque part dans les 20 derniers commits de `~/git-formation/lab-bisect-pro`, mais vous ne savez pas exactement où.

## Consignes
1. Générez un historique de 20 commits sur `calcul.txt`, où un bug (`BUG=true` ajouté au fichier) est introduit à un numéro de commit de votre choix, **sans le noter par écrit** pour vous forcer à réellement chercher.
2. Démarrez une session `git bisect`, marquez `HEAD` comme mauvais et le tout premier commit comme sain.
3. Résolvez manuellement l'énigme, commit par commit proposé par Git, jusqu'à ce qu'il annonce le commit responsable.
4. Terminez proprement la session.
5. Recommencez l'exercice avec un nouveau bug introduit à un autre numéro, mais cette fois écrivez un script `test-bug.sh` et utilisez `git bisect run` pour automatiser entièrement la recherche.
6. Comparez le nombre d'étapes nécessaires en mode manuel et en mode automatisé pour un historique de taille comparable.
7. Utilisez `git bisect log` avant de reset pour voir l'historique complet de vos décisions good/bad de la session automatisée.

## Questions théoriques
1. Si le bug n'était pas "monotone" (il apparaît, disparaît, puis réapparaît selon les commits), que se passerait-il avec `git bisect` ?
2. Pourquoi le mode automatisé (`bisect run`) est-il particulièrement adapté à l'intégration dans un pipeline CI/CD ?

## Critères de réussite
- [ ] Le commit fautif a été identifié correctement en mode manuel
- [ ] Un script fonctionnel a permis une identification automatisée réussie via `bisect run`
- [ ] `git bisect reset` a été utilisé systématiquement en fin de session
