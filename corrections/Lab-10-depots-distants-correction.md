# Correction - Lab 10 : Dépôts distants

### Étapes 1-4
```bash
mkdir -p ~/git-formation/serveur && cd ~/git-formation/serveur
git init --bare atelier.git
cd ~/git-formation
git clone serveur/atelier.git dev-a
git clone serveur/atelier.git dev-b

cd dev-a
echo "# Atelier" > README.md
git add . && git commit -m "Initial commit"
git push -u origin main

cd ../dev-b
git pull
```

### Étape 5
```bash
cd ../dev-b
echo "Ligne ajoutée par dev-b" >> README.md
git add . && git commit -m "feat: ajoute une ligne"
git push

cd ../dev-a
git fetch origin
git log --all --graph --oneline    # origin/main en avance, main local inchangé
cat README.md                       # contenu INCHANGÉ
```

### Étape 6
```bash
git pull
cat README.md    # à jour désormais
```

### Étape 7
```bash
cd ../dev-b
echo "Modif B" >> README.md
git add . && git commit -m "docs: modif B"
git push

cd ../dev-a
echo "Modif A" >> README.md
git add . && git commit -m "docs: modif A"
git push
# → rejected (fetch first)
git pull
# résoudre le conflit si nécessaire, sinon merge automatique
git add README.md
git commit    # si un conflit a nécessité une résolution manuelle
git push
```

### Étape 8
```bash
git ls-remote origin
```

## Réponses aux questions théoriques

1. Git refuse le second push car le dépôt distant contient déjà, sur `main`, un commit (celui de `dev-b`) que `dev-a` ne possède pas dans son historique local. Accepter ce push écraserait silencieusement ce commit sur le distant - Git impose donc de d'abord intégrer (`pull`) ce qui existe déjà là-bas avant d'autoriser un nouvel envoi.

2. `git fetch` ne fait que télécharger des objets et mettre à jour une référence de suivi (`origin/main`) : il ne touche **jamais** à la branche locale active ni au contenu du Working Directory. `git pull`, lui, déclenche automatiquement une fusion (ou un rebase) qui **modifie réellement** vos fichiers - une opération qui peut créer des conflits ou des changements inattendus si on ne s'y attend pas.
