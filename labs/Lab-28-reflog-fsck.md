# Lab 28 - Reflog et récupération d'urgence

**Partie :** 6 - Pro · **Module associé :** 22
**Notions testées :** reflog, récupération après reset --hard, récupération de branche supprimée, fsck
**Durée estimée :** 30 min
**Correction :** [`../corrections/Lab-28-reflog-fsck-correction.md`](../corrections/Lab-28-reflog-fsck-correction.md)

## Contexte
Vous reprenez `~/git-formation/lib-versionnee` du Lab 18 (Partie 4), où un `git reset --hard` accidentel avait effacé un commit important sans être corrigé - c'est le moment de le réparer.

## Consignes
1. Si vous n'avez pas conservé ce dépôt, recréez la situation : un dépôt avec plusieurs commits, puis un `git reset --hard HEAD~1` qui efface le dernier commit important par erreur.
2. Utilisez `git reflog` pour retrouver précisément l'entrée correspondant au commit perdu.
3. Restaurez complètement cet état avec `git reset --hard HEAD@{n}` (le bon indice selon votre reflog).
4. Vérifiez que le contenu et le message du commit récupéré sont identiques à l'original.
5. Provoquez un second incident : créez une branche, committez dessus, revenez sur `main`, puis supprimez cette branche avec `git branch -D` sans l'avoir fusionnée. Retrouvez son dernier commit via le reflog et recréez une branche à partir de ce commit.
6. Utilisez `git fsck --full --unreachable` pour lister les objets orphelins actuellement présents dans le dépôt.
7. Expliquez, pour au moins un objet listé, à quel incident précédent il correspond probablement.
8. Rédigez une note personnelle (3 lignes) résumant la procédure à suivre "à froid" en cas de panique après une manipulation Git destructrice.

## Questions théoriques
1. Pendant combien de temps environ un commit rendu inaccessible reste-t-il récupérable via le reflog, par défaut ?
2. Pourquoi le reflog ne peut-il jamais vous aider à récupérer le travail d'un collègue effacé sur **sa propre** machine ?

## Critères de réussite
- [ ] Un commit supprimé par `reset --hard` a été intégralement restauré via reflog
- [ ] Une branche supprimée par erreur a été recréée à partir d'un commit retrouvé dans le reflog
