# Lab 13 - Capstone Partie 3 : Collaboration simulée à deux

**Partie :** 3 - Collaboratif (synthèse) · **Modules associés :** 7 à 9
**Notions testées :** dépôt distant, PR, workflow, conflit collaboratif
**Durée estimée :** 45 min
**Correction :** [`../corrections/Lab-13-capstone-collaboration-simulee-correction.md`](../corrections/Lab-13-capstone-collaboration-simulee-correction.md)

## Contexte
Vous simulez une petite équipe de deux développeurs (« Vous » et « Collègue ») construisant `association-collaborative`, en respectant strictement un GitHub Flow, avec dépôt distant simulé en local (ou réel sur GitHub si vous préférez).

## Consignes
1. Mettez en place le serveur (bare ou GitHub) et deux clones : `dev-vous` et `dev-collegue`.
2. Depuis `dev-vous` : premier commit, push.
3. Chacun développe une fonctionnalité sur sa propre branche courte (`feature/actualites` pour vous, `feature/galerie` pour le collègue), pousse, et « ouvre une PR » (au minimum : pousse la branche pour review).
4. Le collègue « reviewe » votre branche (checkout + inspection), l'approuve en la fusionnant dans `main`, pousse.
5. Vous synchronisez, puis intégrez la branche du collègue à votre tour de la même façon.
6. Provoquez un conflit réel : les deux clones modifient `README.md` sans se synchroniser au préalable ; le second push doit être refusé, puis résolu proprement avec un `pull` suivi d'une fusion et résolution de conflit.
7. Terminez en créant un tag `v1.0.0` annoté sur le commit final de `main`, poussé sur le distant.
8. Produisez un résumé écrit (quelques lignes) du scénario complet, comme vous le feriez dans la description finale d'une rétrospective de sprint.

## Questions théoriques
1. À quel moment précis de ce scénario une règle de protection de branche (Module 21) aurait-elle changé le déroulement des opérations ?
2. Si cette collaboration avait eu lieu avec 8 développeurs au lieu de 2, quel changement de workflow (Module 9) recommanderiez-vous ?

## Critères de réussite
- [ ] Les deux branches de fonctionnalité ont été développées, reviewées (au moins symboliquement) et fusionnées sans perte de travail
- [ ] Un conflit de push a été rencontré et résolu correctement
- [ ] Un tag annoté a été créé et poussé sur le distant
