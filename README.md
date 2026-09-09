# Cours Complet Git 

**Auteur du support : Lo Pape** · `pape.lo@estiam.co`
 
<div align="center">

![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)
![Version Control](https://img.shields.io/badge/Version%20Control-VCS-blue?style=for-the-badge)
![Niveau](https://img.shields.io/badge/Niveau-Débutant_à_Expert-brightgreen?style=for-the-badge)
![Labs](https://img.shields.io/badge/Labs-30_+_corrections-orange?style=for-the-badge)

**Formation complète : théorie, définitions, commandes commentées, exemples pratiques, cas d'usage professionnels et 30 labs notés**

*Version 5.0 - Édition référence*

</div>

> Ce document est un **manuel de référence**, pas un simple aide-mémoire. Il part de zéro (installation de Git) jusqu'à la maîtrise professionnelle (réécriture d'historique, gouvernance d'équipe), avec **30 labs pratiques** rangés dans deux dossiers dédiés : [`/labs`](labs/) (énoncés) et [`/corrections`](corrections/) (corrigés détaillés).

---

## Comment est organisé ce cours

Le cours est découpé en **6 parties** et **23 modules**. Chaque module suit toujours la **même progression pédagogique complète** :

| Étape | Contenu |
|---|---|
| 1. **Introduction** | pourquoi ce module compte, dans quel contexte professionnel il s'applique |
| 2. **Définitions** | le vocabulaire essentiel, expliqué simplement, avant toute commande |
| 3. **Théorie** | le concept illustré par des schémas |
| 4. **Commandes commentées** | chaque commande, chaque option importante, expliquées une à une |
| 5. **Exemples pratiques** | deux mini-exercices guidés à taper vous-même, avec le résultat attendu commenté |
| 6. **Cas d'usage professionnel** | des situations réelles d'entreprise où cette notion s'applique |
| 7. **Pièges fréquents** | les erreurs classiques des débutants (et pas seulement) |
| 8. **Auto-évaluation** | questions courtes pour vérifier la compréhension théorique |
| 9. **Lab associé** | un exercice noté complet, dans `/labs`, avec sa correction dans `/corrections` |

### Le système de Labs - 30 labs professionnels

Chaque lab de ce cours est construit comme un **cas pratique professionnel** : contexte réaliste, consignes numérotées, questions théoriques de synthèse, et critères de réussite explicites. Les labs sont **volontairement séparés en deux dossiers** pour vous forcer à chercher par vous-même avant de consulter le corrigé :

```
cours-git/
├── README.md
├── labs/                                          ← 30 énoncés (à faire SANS regarder le corrigé)
│   ├── Lab-01-installation-configuration.md
│   ├── Lab-02-trois-zones-structure-interne.md
│   ├── ...
│   └── Lab-30-projet-final-boulangerie.md
└── corrections/                                    ← 30 corrigés détaillés, commande par commande
    ├── Lab-01-installation-configuration-correction.md
    ├── ...
    └── Lab-30-projet-final-boulangerie-correction.md
```

**Répartition des 30 labs :**

| Partie | Labs « module » | Lab de synthèse (capstone) |
|---|---|---|
| Partie 1 - Fondations | Lab 01, 02, 03, 04 | **Lab 05** - Journal de bord |
| Partie 2 - Branches | Lab 06, 07, 08 | **Lab 09** - Site vitrine multi-branches |
| Partie 3 - Collaboratif | Lab 10, 11, 12 | **Lab 13** - Collaboration simulée à deux |
| Partie 4 - Intermédiaire | Lab 14, 15, 16, 17 | **Lab 18** - Nettoyage et versioning |
| Partie 5 - Avancé | Lab 19, 20, 21, 22, 23, 24 | **Lab 25** - Débogage et historique avancé |
| Partie 6 - Pro | Lab 26, 27, 28, 29 | **Lab 30** - Projet final complet |

**Méthode de travail recommandée :**
1. Lisez l'introduction et la théorie du module.
2. Tapez vous-même les deux exemples pratiques fournis - ne vous contentez jamais de les lire.
3. Lisez les cas d'usage professionnel pour ancrer la notion dans un contexte réel.
4. Ouvrez le lab correspondant dans `/labs` et faites l'exercice **sans regarder la correction**.
5. Comparez ensuite avec le fichier du même nom dans `/corrections`.
6. Le **Lab 30** est un projet de synthèse complet : ne l'abordez qu'après avoir terminé les 29 précédents.

---

## Prérequis de cette formation

Cette formation est conçue pour être suivie **sans aucun prérequis en programmation**. Voici ce dont vous avez réellement besoin :

| Prérequis | Détail |
|---|---|
| **Un ordinateur** | Windows, macOS ou Linux - les trois sont couverts dans la section installation |
| **Un terminal** | Invite de commandes (`cmd`), PowerShell ou *Git Bash* sous Windows ; Terminal sous macOS/Linux |
| **Un éditeur de texte** | VS Code (recommandé, gratuit), Notepad++, Sublime Text, ou même le Bloc-notes pour débuter |
| **Une connexion internet** | Nécessaire pour l'installation et pour les Parties 3 et 6 (dépôts distants, GitHub) - **pas nécessaire** pour les Parties 1, 2, 4 et 5, qui fonctionnent en local |
| **Un compte GitHub (gratuit)** | Recommandé à partir de la Partie 3 - créez-en un sur [github.com](https://github.com) si vous n'en avez pas |
| **Aucune connaissance en programmation requise** | Git manipule des fichiers texte, pas du code - ce cours convient aussi à des rédacteurs, designers ou chefs de projet |
| **Temps estimé** | 15 à 25 heures pour l'ensemble du cours et des 30 labs, réparties sur plusieurs semaines idéalement |

> Si vous êtes bloqué·e sur l'installation, la section suivante couvre Windows, macOS et Linux en détail.

---

## Qu'est-ce que Git, et pourquoi l'utiliser ?

### Définition

**Git** est un logiciel de **contrôle de version** (*Version Control System*, VCS) : il enregistre, à chaque instant où vous le lui demandez, un **instantané complet** de l'état de vos fichiers, et conserve tout l'historique de ces instantanés. Vous pouvez ainsi revenir en arrière, comparer des versions, et comprendre qui a changé quoi et pourquoi.

Git a été créé en **2005 par Linus Torvalds** (le créateur du noyau Linux), pour gérer le développement du noyau Linux lui-même - un projet impliquant des milliers de contributeurs. Il est aujourd'hui **le système de contrôle de version le plus utilisé au monde**, dans quasiment toute l'industrie du logiciel, mais aussi de plus en plus dans la data science, la rédaction technique, le design ou la gestion de configuration.

### Pourquoi utiliser Git plutôt que « Documents_v1_final_v2_final_final.docx » ?

| Sans Git | Avec Git |
|---|---|
| Copier des dossiers `projet_v1`, `projet_v2`, `projet_final`… | Un seul dossier, un historique complet et interrogeable |
| Impossible de savoir *qui* a changé *quoi*, ni *pourquoi* | Chaque changement est tracé : auteur, date, message explicatif |
| Travailler à plusieurs = s'écraser mutuellement le travail | Chacun travaille sur sa propre branche, sans interférence |
| Revenir en arrière = retrouver la bonne sauvegarde à la main | `git checkout`/`git revert` : retour en arrière en une commande |
| Aucune trace des tentatives, expérimentations, erreurs corrigées | L'historique complet reste consultable, même les erreurs corrigées |

### Les avantages clés de Git

1. **Distribué** : chaque développeur possède une copie **complète** de l'historique sur sa machine. Pas besoin d'être connecté à un serveur central pour consulter l'historique, créer des commits, ou changer de branche.
2. **Rapide** : la plupart des opérations (commit, branche, diff) sont locales et quasi instantanées, même sur des projets avec des centaines de milliers de commits.
3. **Branches légères** : créer une branche est quasi gratuit (un simple pointeur de 40 caractères), ce qui encourage à isoler chaque fonctionnalité ou expérimentation sans risque.
4. **Intégrité garantie** : chaque commit est identifié par un hash **SHA** calculé sur son contenu complet - toute altération, même d'un seul caractère dans l'historique, change le hash et est immédiatement détectable.
5. **Non-linéaire et collaboratif** : des dizaines, voire des milliers de personnes peuvent travailler en parallèle sur le même projet grâce aux branches et à la fusion.
6. **Écosystème immense** : GitHub, GitLab, Bitbucket, CI/CD, revue de code, intégrations diverses - Git est devenu le standard de facto de l'industrie.
7. **Gratuit et open source** : aucune licence à payer, disponible sur toutes les plateformes.

### Git vs les autres approches

- **Pas de contrôle de version du tout** : le scénario du tableau ci-dessus - fonctionne pour un fichier seul, devient vite ingérable en équipe ou sur la durée.
- **VCS centralisé (ex. SVN, CVS)** : un seul serveur central détient l'historique complet ; les postes de travail n'ont qu'une copie de la version courante. Nécessite une connexion permanente au serveur, et ce dernier est un point de défaillance unique.
- **Git (VCS distribué)** : chaque copie **est** un dépôt complet. On synchronise entre dépôts (via `push`/`pull`) plutôt que de dépendre d'un serveur unique.

### Auto-évaluation
1. En quelle année et par qui Git a-t-il été créé, et pour quel projet initial ?
2. Quelle est la différence fondamentale entre un VCS centralisé (comme SVN) et un VCS distribué (comme Git) ?
3. Citez trois avantages concrets de Git par rapport à une gestion de version « à la main » (copies de dossiers).

---

## Installer Git

Git s'installe différemment selon votre système d'exploitation. Suivez la section qui vous concerne.

### Installation sous Windows

**Option recommandée : Git for Windows**

1. Téléchargez l'installeur officiel sur [git-scm.com/download/win](https://git-scm.com/download/win) (le téléchargement démarre automatiquement).
2. Lancez l'exécutable `.exe` téléchargé.
3. Pendant l'installation, les réglages par défaut conviennent dans la grande majorité des cas. Deux écrans méritent votre attention :
   - **« Adjusting your PATH environment »** : choisissez *« Git from the command line and also from 3rd-party software »* (recommandé) pour pouvoir utiliser `git` depuis n'importe quel terminal.
   - **« Choosing the default editor »** : choisissez l'éditeur que vous préférez (VS Code si déjà installé, sinon Nano ou Notepad++ conviennent pour débuter).
4. Terminez l'installation. Vous disposez maintenant de **Git Bash** (un terminal Unix-like dédié à Git, recommandé pour ce cours) **et** de l'intégration de `git` dans PowerShell/`cmd`.
5. Vérifiez l'installation en ouvrant **Git Bash** (clic droit dans un dossier → *« Git Bash Here »*, ou depuis le menu Démarrer) :
```bash
git --version
```

> **Pourquoi Git Bash plutôt que PowerShell ?** Toutes les commandes de ce cours sont écrites en syntaxe Unix/bash (`ls`, `cat`, `mkdir -p`, `rm -rf`…). Git Bash les reproduit fidèlement sous Windows. Vous pouvez aussi utiliser PowerShell, mais certaines commandes système (non-Git) devront être adaptées (`ls` → `dir`, par exemple).

**Alternative : gestionnaire de paquets `winget`** (Windows 10/11 récents)
```powershell
winget install --id Git.Git -e --source winget
```

### Installation sous Linux

```bash
# Debian / Ubuntu et dérivés
sudo apt update && sudo apt install git

# Fedora
sudo dnf install git

# Arch Linux / Manjaro
sudo pacman -S git

# openSUSE
sudo zypper install git
```

**Ce que fait ce bloc, ligne par ligne :**
- `sudo apt update && sudo apt install git` : met à jour la liste des paquets disponibles
- `sudo dnf install git` : installe Git via le gestionnaire de paquets de Fedora
- `sudo pacman -S git` : installe Git via le gestionnaire de paquets d'Arch Linux
- `sudo zypper install git` : installe Git via le gestionnaire de paquets d'openSUSE
```bash
git --version
```

### Installation sous macOS

**Option 1 - via Homebrew (recommandé)**
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```

**Ce que fait ce bloc, ligne par ligne :**
- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` : exécute le script d'installation officiel de Homebrew téléchargé en ligne
- `brew install git` : installe Git via le gestionnaire de paquets Homebrew (macOS)

**Option 2 - via les outils en ligne de commande Xcode**
```bash
xcode-select --install
```

**Option 3 - installeur officiel**
Téléchargez le paquet `.dmg` depuis [git-scm.com/download/mac](https://git-scm.com/download/mac).

```bash
git --version
```

### Tableau récapitulatif

| OS | Méthode recommandée | Commande de vérification |
|---|---|---|
| Windows | Git for Windows (installeur) | `git --version` (dans Git Bash) |
| Linux | Gestionnaire de paquets natif (`apt`, `dnf`, `pacman`…) | `git --version` |
| macOS | Homebrew (`brew install git`) | `git --version` |

### Pièges fréquents à l'installation
- Sous Windows, oublier de cocher l'option d'ajout au PATH empêche `git` de fonctionner depuis `cmd`/PowerShell (Git Bash fonctionne toujours, lui, car il installe son propre environnement).
- Une version de Git trop ancienne (< 2.23) ne propose pas les commandes modernes `git switch`/`git restore` utilisées dans ce cours.
- Ne pas configurer son identité (`user.name`/`user.email`) juste après l'installation - voir Module 0.

### Auto-évaluation
1. Quelle est la commande pour vérifier que Git est bien installé, quel que soit l'OS ?
2. Sous Windows, quel outil installé avec Git for Windows reproduit un terminal Unix-like ?
3. Citez la commande d'installation de Git sous Ubuntu, et sous macOS via Homebrew.

---

## Créer un dépôt : pourquoi et comment (interface graphique vs ligne de commande sous Windows)

### Pourquoi créer un dépôt Git ?

Créer un dépôt (*repository*) revient à dire à Git : *« à partir de maintenant, surveille et enregistre l'historique des fichiers de ce dossier »*. On crée un dépôt dès qu'on veut :
- **suivre l'évolution** d'un projet (code, documentation, configuration…) dans le temps ;
- **pouvoir revenir en arrière** en cas d'erreur ou de régression ;
- **collaborer** avec d'autres personnes sans s'écraser le travail mutuellement ;
- **héberger** le projet sur une plateforme comme GitHub pour le partager, le sauvegarder, ou en faire un portfolio public.

Il existe **deux scénarios de départ** :
1. **Le projet existe déjà en local** (un dossier avec des fichiers) → on initialise un dépôt Git dans ce dossier (`git init`), éventuellement suivi de la création d'un dépôt distant vide que l'on relie ensuite.
2. **Le projet n'existe pas encore, ou on part d'un dépôt distant existant** → on crée le dépôt directement sur GitHub, puis on le clone en local (`git clone`).

### Méthode 1 - Ligne de commande, sous Windows (Git Bash ou PowerShell)

```bash
# Scénario A : partir d'un dossier local existant
cd ~/git-formation
mkdir mon-nouveau-projet
cd mon-nouveau-projet
git init
git add .
git commit -m "chore: premier commit du projet"
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir mon-nouveau-projet` : crée un nouveau dossier
- `cd mon-nouveau-projet` : se déplace dans le dossier indiqué
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `git add .` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git commit -m "chore: premier commit du projet"` : crée un commit avec le message indiqué directement

```bash
# Scénario B : partir d'un dépôt distant déjà créé sur GitHub
cd ~/git-formation
git clone https://github.com/votre-nom/mon-nouveau-projet.git
cd mon-nouveau-projet
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `git clone https://github.com/votre-nom/mon-nouveau-projet.git` : copie intégralement un dépôt distant (ou local) vers un nouveau dossier
- `cd mon-nouveau-projet` : se déplace dans le dossier indiqué

### Méthode 2 - Interface graphique (sans ligne de commande)

| Outil | Ce qu'il permet |
|---|---|
| **GitHub Desktop** (Windows/macOS, gratuit) | Créer un dépôt local, le publier sur GitHub, gérer branches/commits/PR visuellement |
| **VS Code (extension Git intégrée)** | Un bouton *« Initialize Repository »* directement dans l'explorateur de fichiers |
| **GitKraken** | Interface graphique avancée, gratuite pour projets publics |
| **Site web GitHub.com** | Bouton *« New repository »* pour créer un dépôt distant vide |

**Créer un dépôt avec GitHub Desktop (étapes) :**
1. Installez [GitHub Desktop](https://desktop.github.com/) et connectez-vous à votre compte GitHub.
2. Menu **File → New Repository…**
3. Renseignez le nom, l'emplacement local, cochez *« Initialize this repository with a README »* si souhaité.
4. Cliquez sur **Create Repository**.
5. Pour le publier sur GitHub : bouton **Publish repository**.

**Créer un dépôt directement sur GitHub.com puis le cloner :**
1. Sur [github.com](https://github.com), cliquez sur **+ → New repository**.
2. Renseignez un nom, une description, la visibilité, éventuellement un `.gitignore` et une licence.
3. Cliquez sur **Create repository**.
4. Copiez l'URL HTTPS proposée, puis en local :
```bash
cd ~/git-formation
git clone https://github.com/votre-nom/nom-du-depot.git
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `git clone https://github.com/votre-nom/nom-du-depot.git` : copie intégralement un dépôt distant (ou local) vers un nouveau dossier

### Ligne de commande vs interface graphique : que choisir ?

| Critère | Ligne de commande | Interface graphique |
|---|---|---|
| Rapidité pour les habitués | Très rapide | Plus lente pour des actions simples |
| Courbe d'apprentissage | Plus élevée au départ | Plus intuitive au démarrage |
| Visualisation de l'historique/graphe | Nécessite `--graph` ou un outil externe | Souvent affichée nativement |
| Automatisation (scripts, CI/CD) | Indispensable | Impossible |
| Actions avancées (rebase interactif, filter-repo…) | Toutes disponibles | Souvent limitées ou absentes |

**Recommandation pédagogique de ce cours :** apprenez la **ligne de commande en priorité**.

### Exemple pratique

```bash
cd ~/git-formation
mkdir demo-creation-depot && cd demo-creation-depot
git init
echo "# Démo création de dépôt" > README.md
git add .
git commit -m "chore: premier commit"
git log --oneline
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir demo-creation-depot && cd demo-creation-depot` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "# Démo création de dépôt" > README.md` : écrit (ou affiche) le texte indiqué
- `git add .` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git commit -m "chore: premier commit"` : crée un commit avec le message indiqué directement
- `git log --oneline` : affiche l'historique condensé, un commit résumé par ligne

### Pièges fréquents
- Confondre `git init` et `git clone`.
- Créer un dépôt GitHub avec README **et** vouloir y pousser un dépôt local séparé déjà initialisé.

### Auto-évaluation
1. Quelle commande à partir d'un dossier local existant ? Et à partir d'un distant existant ?
2. Citez deux outils graphiques permettant de créer un dépôt sans ligne de commande.
3. Pourquoi ce cours recommande-t-il la ligne de commande en priorité ?

---

## Mise en place de l'espace de travail

```bash
mkdir -p ~/git-formation && cd ~/git-formation
```

| Élément | Rôle |
|---|---|
| `mkdir` | crée un dossier |
| `-p` | crée aussi les dossiers parents manquants, sans erreur si déjà existant |
| `~/git-formation` | chemin absolu : `~` = votre dossier utilisateur |
| `&&` | exécute la suite seulement si la commande précédente a réussi |
| `cd` | change de dossier courant |

```bash
pwd     # affiche le chemin absolu du dossier courant
```

> **Convention utilisée dans tout ce cours :** chaque nouveau dépôt sera créé **à l'intérieur** de `~/git-formation`.

### Exemple pratique

```bash
mkdir -p ~/git-formation && cd ~/git-formation
mkdir test-rapide && cd test-rapide
git init
cd ~/git-formation
rm -rf test-rapide
```

**Ce que fait ce bloc, ligne par ligne :**
- `mkdir -p ~/git-formation && cd ~/git-formation` : crée le dossier indiqué, y compris les dossiers parents manquants
- `mkdir test-rapide && cd test-rapide` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `rm -rf test-rapide` : supprime définitivement le fichier ou dossier indiqué (irréversible)

---

## Sommaire

### [Partie 1 - Fondations](#partie-1--fondations)
Module 0 `[Lab 01]` - Module 1 `[Lab 02]` - Module 2 `[Lab 03]` - Module 3 `[Lab 04]` -  `[Lab 05]`

### [Partie 2 - Travailler avec des branches](#partie-2--travailler-avec-des-branches)
Module 4 `[Lab 06]` - Module 5 `[Lab 07]` - Module 6 `[Lab 08]` -  `[Lab 09]`

### [Partie 3 - Travail collaboratif (distant)](#partie-3--travail-collaboratif-distant)
Module 7 `[Lab 10]` - Module 8 `[Lab 11]` - Module 9 `[Lab 12]` -  `[Lab 13]`

### [Partie 4 - Techniques intermédiaires](#partie-4--techniques-intermédiaires)
Module 10 `[Lab 14]` - Module 11 `[Lab 15]` - Module 12 `[Lab 16]` - Module 13 `[Lab 17]` -  `[Lab 18]`

### [Partie 5 - Techniques avancées](#partie-5--techniques-avancées)
Module 14 `[Lab 19]` - Module 15 `[Lab 20]` - Module 16 `[Lab 21]` - Module 17 `[Lab 22]` - Module 18 `[Lab 23]` - Module 19 `[Lab 24]` -  `[Lab 25]`

### [Partie 6 - Maîtrise professionnelle](#partie-6--maîtrise-professionnelle)
Module 20 `[Lab 26]` - Module 21 `[Lab 27]` - Module 22 `[Lab 28]` - Module 23 `[Lab 29]` -  `[Lab 30 - PROJET FINAL]`

### Annexes
[A. Glossaire](#annexe-a--glossaire-complet) · [B. Cheat sheet](#annexe-b--aide-mémoire-cheat-sheet) · [C. Ressources](#annexe-c--ressources-complémentaires)

---

# Partie 1 - Fondations

## Module 0 · Préparer son environnement

### Introduction
Avant de créer le moindre commit, Git doit savoir **qui vous êtes** et **comment il doit se comporter** par défaut. Ce module pose les fondations invisibles mais indispensables : une identité mal configurée peut polluer tout un historique d'équipe avec des commits anonymes ou mal attribués. En entreprise, la configuration Git fait souvent partie du « poste de travail type » fourni à chaque nouvel arrivant.

### Définitions
| Terme | Définition |
|---|---|
| **VCS** | *Version Control System* : logiciel qui enregistre l'historique des modifications de fichiers dans le temps |
| **Configuration Git** | ensemble de paramètres (identité, éditeur, comportements) qui pilotent le fonctionnement de Git |
| **Scope de configuration** | niveau d'application d'un réglage : machine entière, utilisateur, ou dépôt précis |

### Théorie
Git lit sa configuration à **trois niveaux hiérarchiques**, du plus général au plus spécifique - le plus spécifique l'emporte toujours :

| Niveau | Portée | Fichier | Priorité |
|---|---|---|---|
| `--system` | toute la machine | `/etc/gitconfig` | la plus basse |
| `--global` | tous vos dépôts (utilisateur courant) | `~/.gitconfig` | intermédiaire |
| `--local` | un seul dépôt | `.git/config` | la plus haute |

### Commandes commentées

**`git --version`** - affiche la version installée ; premier réflexe de diagnostic.

**`git config --global user.name "Votre Nom"`** - définit le nom associé à **tous vos commits futurs**, sur tous vos dépôts.

**`git config --global user.email "vous@exemple.com"`** - identique pour l'email ; **obligatoire** avant le premier commit.

**`git config --global core.editor "nano"`** - éditeur ouvert pour les messages longs, le rebase interactif, etc.

**`git config --global color.ui auto`** - active la coloration syntaxique dans le terminal.

**`git config --global init.defaultBranch main`** - fixe le nom de la branche créée par `git init`.

**`git config --global alias.st status`** - crée un **alias** : `git st` fonctionnera désormais comme `git status`. Très utilisé pour raccourcir les commandes fréquentes.

**`git config --global core.autocrlf input`** (macOS/Linux) ou **`true`** (Windows) - gère la conversion des fins de ligne entre systèmes, pour éviter des diffs parasites liés uniquement au format de fichier.

**`git config --list`** - affiche toute la configuration active (fusion des 3 niveaux).

**`git config --show-origin user.name`** - indique **quel fichier** définit une valeur précise.

**`git config --unset user.name`** - supprime un réglage précédemment défini.

### Exemple pratique 1 - configuration de base

```bash
cd ~/git-formation
git config --global user.name "Alex Dupont"
git config --global user.email "alex.dupont@exemple.com"
git config --global color.ui auto
git config --global init.defaultBranch main
git config --list --global
git config --show-origin user.name
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `git config --global user.name "Alex Dupont"` : définit le nom d'auteur associé à tous vos futurs commits
- `git config --global user.email "alex.dupont@exemple.com"` : définit l'email d'auteur associé à tous vos futurs commits
- `git config --global color.ui auto` : active la coloration syntaxique dans le terminal
- `git config --global init.defaultBranch main` : fixe le nom de la branche créée par défaut lors d'un `git init`
- `git config --list --global` : affiche uniquement la configuration définie au niveau global
- `git config --show-origin user.name` : indique le fichier exact d'où provient cette valeur de configuration

### Exemple pratique 2 - créer un alias utile

```bash
git config --global alias.lg "log --oneline --graph --all"
git config --global alias.st status

# Utilisation :
cd ~/git-formation/mon-premier-depot 2>/dev/null || (mkdir -p ~/git-formation/mon-premier-depot && cd ~/git-formation/mon-premier-depot && git init)
git st        # équivaut à "git status"
git lg        # équivaut à "git log --oneline --graph --all"
```

**Ce que fait ce bloc, ligne par ligne :**
- `git config --global alias.lg "log --oneline --graph --all"` : crée un alias : la commande abrégée déclenchera la commande complète associée
- `git config --global alias.st status` : crée un alias : la commande abrégée déclenchera la commande complète associée
- `cd ~/git-formation/mon-premier-depot 2>/dev/null || (mkdir -p ~/git-formation/mon-premier-depot && cd ~/git-formation/mon-premier-depot && git init)` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `git st        # équivaut à "git status"` : exécute l'alias `st` créé précédemment (équivaut à `git status`)
- `git lg        # équivaut à "git log --oneline --graph --all"` : exécute l'alias `lg` créé précédemment (équivaut à `git log --oneline --graph --all`)

### Cas d'usage professionnel
- **Onboarding d'un nouvel employé** : un script de configuration standardisé (`user.email` au format `prenom.nom@entreprise.com`, alias communs à l'équipe) garantit une cohérence dès le premier jour.
- **Environnements multiples** : un développeur freelance utilise souvent un `user.email` différent en `--local` pour chaque client, tout en gardant un `user.name` `--global` commun.
- **CI/CD** : les pipelines d'intégration continue configurent systématiquement une identité Git technique (`ci-bot@entreprise.com`) pour les commits automatisés (changelogs, bump de version).

### Pièges fréquents
- Committer sans `user.email` configuré.
- Confondre `--global` et `--local`.

### Auto-évaluation
1. Différence entre `--global` et `--local` ?
2. Ordre de priorité entre les trois niveaux de configuration ?
3. Commande pour savoir d'où vient la valeur de `user.name` ?

### Lab associé
 [`labs/Lab-01-installation-configuration.md`](labs/Lab-01-installation-configuration.md) · [Correction](corrections/Lab-01-installation-configuration-correction.md)

---

## Module 1 · Comprendre ce qu'est Git

### Introduction
Ce module pose **le** concept que tout le reste du cours présuppose acquis : les trois zones de Git. Neuf débutants sur dix qui « ne comprennent rien à Git » butent en réalité sur ce schéma. Prenez le temps de vraiment l'intégrer avant de continuer - tout Module suivant s'appuie dessus, explicitement ou non.

###  Définitions
| Terme | Définition |
|---|---|
| **Git** | logiciel de contrôle de version **distribué**, installé localement |
| **GitHub / GitLab / Bitbucket** | plateformes web qui **hébergent** des dépôts Git distants |
| **Working Directory** | les fichiers tels qu'ils existent sur le disque |
| **Staging Area (Index)** | zone tampon où l'on prépare le prochain commit |
| **Repository** | la base de données (`.git/`) contenant tout l'historique |

### Théorie
```
┌──────────────────┐    git add     ┌──────────────────┐    git commit    ┌──────────────────┐
│  Working Dir      │ ─────────────▶│  Staging Area     │ ─────────────────▶│  Repository       │
│                    │◀───────────────│                   │◀───────────────────│                  │
└──────────────────┘  git restore    └──────────────────┘    git reset       └──────────────────┘
```

#### Git ≠ GitHub
Git fonctionne **sans connexion internet**. GitHub/GitLab/Bitbucket sont des services qui hébergent des dépôts Git distants et ajoutent Issues, Pull Requests, CI/CD.

### Commandes commentées

**`git init`** - transforme le dossier courant en dépôt Git (crée `.git/`).

**`ls -la .git`** - observe la structure interne du dépôt (commande système, pas Git).

**`cat .git/HEAD`** - affiche la référence actuellement pointée par HEAD.

**`git help <commande>`** - ouvre la documentation intégrée d'une commande (ex. `git help commit`), équivalent à `man git-commit`.

**`git <commande> -h`** - affiche un résumé rapide des options d'une commande, sans ouvrir la documentation complète.

###  Exemple pratique 1 - structure interne

```bash
cd ~/git-formation
mkdir mon-premier-depot && cd mon-premier-depot
git init
ls -la .git
cat .git/HEAD
ls .git/refs
ls .git/objects
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir mon-premier-depot && cd mon-premier-depot` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `ls -la .git` : liste tout le contenu du dossier, y compris les fichiers cachés, en détail
- `cat .git/HEAD` : affiche le contenu du fichier indiqué
- `ls .git/refs` : liste le contenu du dossier ou du fichier indiqué
- `ls .git/objects` : liste le contenu du dossier ou du fichier indiqué

###  Exemple pratique 2 - consulter l'aide intégrée

```bash
git help commit          # ouvre la documentation complète (pager)
git commit -h             # résumé rapide des options, directement dans le terminal
```

**Ce que fait ce bloc, ligne par ligne :**
- `git help commit          # ouvre la documentation complète (pager)` : ouvre la documentation complète d'une commande
- `git commit -h             # résumé rapide des options, directement dans le terminal` : affiche un résumé rapide des options de la commande, sans ouvrir la doc complète

###  Cas d'usage professionnel
- **Travail hors ligne** : un développeur dans un train ou un avion continue à committer, changer de branche, consulter l'historique - la synchronisation se fera à la prochaine connexion.
- **Migration d'outil** : une entreprise qui migre de SVN vers Git doit d'abord faire comprendre à ses équipes que l'historique est désormais **local et complet**, pas centralisé.
- **Documentation autonome** : `git help` évite de devoir chercher en ligne pour la syntaxe exacte d'une commande peu utilisée.

###  Pièges fréquents
- Croire que supprimer `.git/` supprime les fichiers du projet.
- Confondre Git et GitHub.

###  Auto-évaluation
1. Différence entre Working Directory, Staging Area et Repository ?
2. Git nécessite-t-il internet au quotidien ?
3. Différence fondamentale entre Git et GitHub ?

###  Lab associé
 [`labs/Lab-02-trois-zones-structure-interne.md`](labs/Lab-02-trois-zones-structure-interne.md) ·  [Correction](corrections/Lab-02-trois-zones-structure-interne-correction.md)

---

## Module 2 · Le dépôt local : init, add, commit

###  Introduction
C'est ici que vous passez de la théorie à la pratique quotidienne : créer des commits, encore et encore, est l'action la plus fréquente de toute une carrière avec Git. Un développeur professionnel fait en moyenne plusieurs dizaines de commits par jour sur les projets actifs. Bien maîtriser ce cycle, et rédiger des messages de qualité, a un impact direct sur la lisibilité de tout projet en équipe.

###  Définitions
| Terme | Définition |
|---|---|
| **Untracked** | fichier visible par Git mais pas encore suivi |
| **Modified** | fichier suivi, modifié depuis le dernier commit |
| **Staged** | modification prête pour le prochain commit |
| **Commit** | instantané permanent identifié par un hash SHA |
| **Conventional Commits** | convention `feat:`, `fix:`, `docs:`… |

### Théorie
```
Untracked ──git add──▶ Staged ──git commit──▶ Committed
                                                    │ modification
                                                    ▼
                                                Modified ──git add──▶ Staged ──…
```

### Commandes commentées

**`git status`** - LA commande la plus utilisée : affiche l'état de chaque fichier.

**`git status -s`** (ou `--short`) - version condensée, un code à deux lettres par fichier (`M` modifié, `A` ajouté, `??` untracked…), pratique une fois l'habitude prise.

**`git add fichier.txt`** - copie l'état du fichier dans la Staging Area.

**`git add .`** - ajoute tous les fichiers nouveaux/modifiés du dossier courant.

**`git add -p`** - mode interactif, hunk par hunk.

**`git commit -m "message"`** - commit avec message court.

**`git commit`** - ouvre l'éditeur pour un message détaillé.

**`git commit -am "message"`** - add(fichiers suivis)+commit - n'ajoute **pas** les untracked.

**`git commit --amend`** - modifie le dernier commit (jamais sur un commit partagé).

**`git commit --allow-empty -m "message"`** - crée un commit **sans aucun changement** de fichier ; utile pour déclencher un pipeline CI/CD ou marquer un jalon.

**`git rm fichier.txt`** - supprime et stage la suppression.

**`git mv ancien.txt nouveau.txt`** - renomme et stage le renommage.

###  Exemple pratique 1 - cycle complet add/commit

```bash
cd ~/git-formation
mkdir lab-recettes && cd lab-recettes
git init
echo "# Mes Recettes" > README.md
git status
git add README.md
git status
git commit -m "feat: ajoute le README initial"

echo "## Tarte aux pommes" >> README.md
echo "- 4 pommes" > tarte-pommes.txt
git status -s
git add .
git commit -m "feat: ajoute la recette de la tarte aux pommes"
git commit --amend -m "feat: ajoute la recette de la tarte aux pommes maison"
git log --oneline
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-recettes && cd lab-recettes` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "# Mes Recettes" > README.md` : écrit (ou affiche) le texte indiqué
- `git status` : affiche l'état actuel de chaque fichier (untracked/modified/staged)
- `git add README.md` : ajoute ce(s) fichier(s) précis à la Staging Area
- `git status` : affiche l'état actuel de chaque fichier (untracked/modified/staged)
- `git commit -m "feat: ajoute le README initial"` : crée un commit avec le message indiqué directement
- `echo "## Tarte aux pommes" >> README.md` : écrit (ou affiche) le texte indiqué
- `echo "- 4 pommes" > tarte-pommes.txt` : écrit (ou affiche) le texte indiqué
- `git status -s` : affiche l'état des fichiers en version condensée (codes à deux lettres)
- `git add .` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git commit -m "feat: ajoute la recette de la tarte aux pommes"` : crée un commit avec le message indiqué directement
- `git commit --amend -m "feat: ajoute la recette de la tarte aux pommes maison"` : remplace le dernier commit (contenu et/ou message), sans en créer un nouveau
- `git log --oneline` : affiche l'historique condensé, un commit résumé par ligne

###  Exemple pratique 2 - renommer et supprimer

```bash
git mv tarte-pommes.txt recette-tarte.txt
git status -s
git commit -m "chore: renomme le fichier de recette"

echo "brouillon jetable" > temp.txt
git add . && git commit -m "chore: ajoute un fichier temporaire"
git rm temp.txt
git commit -m "chore: supprime le fichier temporaire"
git log --oneline
```

**Ce que fait ce bloc, ligne par ligne :**
- `git mv tarte-pommes.txt recette-tarte.txt` : renomme ou déplace un fichier et stage ce changement en une seule opération
- `git status -s` : affiche l'état des fichiers en version condensée (codes à deux lettres)
- `git commit -m "chore: renomme le fichier de recette"` : crée un commit avec le message indiqué directement
- `echo "brouillon jetable" > temp.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "chore: ajoute un fichier temporaire"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git rm temp.txt` : supprime le fichier du disque et stage sa suppression
- `git commit -m "chore: supprime le fichier temporaire"` : crée un commit avec le message indiqué directement
- `git log --oneline` : affiche l'historique condensé, un commit résumé par ligne

###  Cas d'usage professionnel
- **Changelog automatique** : des outils comme `semantic-release` génèrent un fichier `CHANGELOG.md` automatiquement à partir des messages Conventional Commits (`feat:`, `fix:`…).
- **Revue de code facilitée** : des commits atomiques et bien nommés permettent à un relecteur de comprendre une Pull Request commit par commit, plutôt que de devoir tout relire d'un bloc.
- **Traçabilité réglementaire** : dans les secteurs régulés (santé, finance), l'historique Git sert parfois de preuve d'audit - d'où l'importance de messages précis et d'une identité correctement configurée.

###  Pièges fréquents
- `git commit -am` n'ajoute pas les untracked.
- `git add .` ajoute tout le dossier courant : vérifiez avec `git status`.

###  Auto-évaluation
1. Quelle commande tapez-vous systématiquement en premier ?
2. Pourquoi `git commit -am` peut-il être piégeux ?
3. Que fait `git add -p` par rapport à `git add .` ?

###  Lab associé
 [`labs/Lab-03-cycle-add-commit.md`](labs/Lab-03-cycle-add-commit.md) ·  [Correction](corrections/Lab-03-cycle-add-commit-correction.md)

---

## Module 3 · L'historique : log, diff, show

###  Introduction
Un historique bien construit ne sert à rien si l'on ne sait pas l'explorer. Ce module transforme Git d'un simple outil de sauvegarde en un véritable **outil d'investigation** : retrouver quand un bug a été introduit, comprendre pourquoi une ligne de code existe, comparer deux versions d'un fichier avant une décision de fusion. C'est une compétence quotidienne pour tout développeur, mainteneur ou relecteur de code.

###  Définitions
| Terme | Définition |
|---|---|
| **DAG** | graphe orienté acyclique - structure réelle de l'historique une fois les merges pris en compte |
| **Référence relative** | notation (`HEAD~1`, `HEAD^`) désignant un commit relativement à un autre |

### Théorie
```
A ── B ── C ── D   (main)
          │
          └── E ── F   (feature)
```

| Référence | Signification |
|---|---|
| `HEAD` | le commit actuellement « checké out » |
| `HEAD~1` / `HEAD^` | le parent direct |
| `HEAD~3` | 3 commits avant HEAD |
| `HEAD^2` | le 2ᵉ parent (commit de merge) |

### Commandes commentées

**`git log`** - historique complet et détaillé.

**`git log --oneline`** - une ligne par commit.

**`git log --oneline --graph --all`** - vue graphique multi-branches.

**`git log -5`** - limite aux 5 commits récents.

**`git log --author="Marie"`** - filtre par auteur.

**`git log --since="2 weeks ago"`** / **`--until="..."`** - filtre par date.

**`git log -- fichier.txt`** - limite à un fichier précis.

**`git log -p`** - affiche aussi le patch (diff) de chaque commit.

**`git log --stat`** - affiche les statistiques de fichiers modifiés (nombre de lignes +/-) sans le détail complet du diff.

**`git log --grep="fix"`** - recherche dans les messages de commit.

**`git shortlog -sn`** - résumé du nombre de commits par auteur, trié - utile pour un rapport d'activité d'équipe.

**`git diff`** - Working Dir ↔ Staging (non stagé).

**`git diff --staged`** - Staging ↔ dernier commit.

**`git diff HEAD~1 HEAD -- fichier.txt`** - compare deux commits sur un fichier précis.

**`git show <hash>`** - détail complet d'un commit.

**`git blame fichier.txt`** - affiche, ligne par ligne, quel commit (et quel auteur) a introduit chaque ligne du fichier - très utilisé pour comprendre l'origine d'un bug.

###  Exemple pratique 1 - naviguer dans l'historique

```bash
cd ~/git-formation/lab-recettes
git log --oneline --graph --all
echo "## Crêpes" >> README.md
git diff
git add README.md
git diff --staged
git commit -m "feat: ajoute la recette des crêpes"
git diff HEAD~1 HEAD
git show HEAD
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation/lab-recettes` : se déplace dans le dossier indiqué
- `git log --oneline --graph --all` : affiche l'historique condensé sous forme de graphe, toutes branches confondues
- `echo "## Crêpes" >> README.md` : écrit (ou affiche) le texte indiqué
- `git diff` : compare le working directory à la Staging Area (modifications non stagées)
- `git add README.md` : ajoute ce(s) fichier(s) précis à la Staging Area
- `git diff --staged` : compare la Staging Area au dernier commit (ce qui sera committé)
- `git commit -m "feat: ajoute la recette des crêpes"` : crée un commit avec le message indiqué directement
- `git diff HEAD~1 HEAD` : compare deux commits précis (ici l'avant-dernier et le dernier)
- `git show HEAD` : affiche le détail complet d'un commit (métadonnées + diff)

###  Exemple pratique 2 - enquêter avec blame et stat

```bash
git blame README.md
git log --stat -3
git shortlog -sn
```

**Ce que fait ce bloc, ligne par ligne :**
- `git blame README.md` : affiche, ligne par ligne, quel commit a introduit chaque ligne du fichier
- `git log --stat -3` : affiche les statistiques de fichiers modifiés (lignes +/-) par commit
- `git shortlog -sn` : résume le nombre de commits par auteur, du plus au moins actif

###  Cas d'usage professionnel
- **Débogage en production** : `git blame` permet d'identifier immédiatement qui a introduit une ligne suspecte, et dans quel commit (donc quel contexte/ticket associé).
- **Revue d'activité de sprint** : `git shortlog -sn --since="1 week ago"` donne un aperçu rapide de la contribution de chacun sur une période.
- **Audit avant une release** : `git log --oneline main..release/1.0` liste précisément les commits qui partiront en production, pour validation finale.

###  Pièges fréquents
- Confondre `git diff` et `git diff --staged`.

###  Auto-évaluation
1. Commande pour voir les modifications déjà stagées ?
2. Que signifie `HEAD~3` ?
3. Comment afficher l'historique d'un fichier précis ?

###  Lab associé
 [`labs/Lab-04-explorer-historique.md`](labs/Lab-04-explorer-historique.md) ·  [Correction](corrections/Lab-04-explorer-historique-correction.md)

---

###  Lab de synthèse - Partie 1

 [`labs/Lab-05-capstone-journal-de-bord.md`](labs/Lab-05-capstone-journal-de-bord.md) ·  [Correction](corrections/Lab-05-capstone-journal-de-bord-correction.md)

---

# Partie 2 - Travailler avec des branches

## Module 4 · Branches : créer, naviguer, fusionner

###  Introduction
Les branches sont ce qui distingue véritablement Git des approches de sauvegarde classiques : elles permettent d'isoler un travail en cours, d'expérimenter sans risque, et de faire progresser plusieurs fonctionnalités en parallèle sans jamais qu'elles ne se marchent dessus. Dans une équipe professionnelle, il est courant d'avoir des dizaines de branches actives simultanément.

###  Définitions
| Terme | Définition |
|---|---|
| **Branche** | pointeur mobile vers un commit |
| **HEAD** | pointeur vers la branche/commit actif |
| **Fast-forward** | fusion sans nouveau commit |
| **Merge commit** | commit à deux parents |

### Théorie
```
Fast-forward :  main, feature ── A ── B ── C ── D
Merge commit :  main ──── A ── B ──────── E ── M   (M a deux parents : E et D)
                                \                /
                feature          C ── D ────────
```

### Commandes commentées

**`git branch`** - liste les branches locales.

**`git branch -a`** - liste aussi les branches distantes (`remotes/origin/...`).

**`git branch nom`** - crée sans basculer.

**`git checkout nom`** / **`git switch nom`** - bascule.

**`git checkout -b nom`** / **`git switch -c nom`** - crée et bascule.

**`git branch -d nom`** / **`-D nom`** - supprime (protégé) / force.

**`git branch -m ancien nouveau`** - renomme une branche.

**`git merge nom`** - fusionne `nom` dans la branche courante.

**`git merge --no-ff nom`** - force un merge commit même en cas de fast-forward possible.

**`git merge --abort`** - annule une fusion en cours.

**`git log --merges`** - n'affiche que les commits de fusion, utile pour visualiser les grandes étapes d'intégration d'un projet.

###  Exemple pratique 1 - fast-forward

```bash
cd ~/git-formation
mkdir lab-branches-demo && cd lab-branches-demo
git init
echo "Page d'accueil" > index.html
git add . && git commit -m "feat: page d'accueil initiale"
git checkout -b feature-contact
echo "Page de contact" > contact.html
git add . && git commit -m "feat: ajoute la page de contact"
git checkout main
ls
git merge feature-contact
git log --oneline --graph
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-branches-demo && cd lab-branches-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "Page d'accueil" > index.html` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: page d'accueil initiale"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git checkout -b feature-contact` : crée une nouvelle branche et bascule dessus immédiatement
- `echo "Page de contact" > contact.html` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: ajoute la page de contact"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git checkout main` : bascule sur la branche `main`
- `ls` : liste le contenu du dossier courant
- `git merge feature-contact` : fusionne la branche indiquée dans la branche actuellement active
- `git log --oneline --graph` : affiche l'historique condensé sous forme de graphe (branche courante)

###  Exemple pratique 2 - forcer un merge commit avec `--no-ff`

```bash
git checkout -b feature-mentions-legales
echo "Mentions légales" > mentions.html
git add . && git commit -m "feat: ajoute les mentions légales"
git checkout main
git merge --no-ff feature-mentions-legales -m "merge: intègre les mentions légales"
git log --oneline --graph
```

**Ce que fait ce bloc, ligne par ligne :**
- `git checkout -b feature-mentions-legales` : crée une nouvelle branche et bascule dessus immédiatement
- `echo "Mentions légales" > mentions.html` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: ajoute les mentions légales"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git checkout main` : bascule sur la branche `main`
- `git merge --no-ff feature-mentions-legales -m "merge: intègre les mentions légales"` : force la création d'un commit de fusion, même si un fast-forward est possible
- `git log --oneline --graph` : affiche l'historique condensé sous forme de graphe (branche courante)

###  Cas d'usage professionnel
- **Isolation de fonctionnalités** : chaque ticket Jira/Trello correspond typiquement à une branche `feature/JIRA-123-nom-court`, permettant de suivre précisément l'avancement.
- **`--no-ff` en équipe** : de nombreuses équipes forcent `--no-ff` sur `main` pour garder une trace visuelle claire de chaque fonctionnalité intégrée, même quand un fast-forward serait techniquement possible.
- **Environnements parallèles** : une équipe maintient simultanément une branche `main` (production), `staging` (pré-production) et de multiples branches `feature/*`, chacune déployée sur un environnement de test dédié.

###  Pièges fréquents
- Oublier sur quelle branche on se trouve.
- Confondre `git branch nom` et `git checkout -b nom`.

###  Auto-évaluation
1. Qu'est-ce qu'une branche techniquement ?
2. Quand Git fait-il un fast-forward ?
3. Différence `-d`/`-D` ?

###  Lab associé
 [`labs/Lab-06-branches-fast-forward-merge.md`](labs/Lab-06-branches-fast-forward-merge.md) ·  [Correction](corrections/Lab-06-branches-fast-forward-merge-correction.md)

---

## Module 5 · Les conflits de fusion

###  Introduction
Le conflit de fusion est souvent perçu comme un moment de panique par les débutants - c'est en réalité l'une des grandes forces de Git : plutôt que d'écraser silencieusement du travail, il **s'arrête et vous demande de trancher**. Une fois la mécanique comprise, résoudre un conflit devient une opération routinière, même sur des projets à forte contribution.

###  Définitions
| Terme | Définition |
|---|---|
| **Conflit de fusion** | fusion automatique impossible entre deux versions |
| **Marqueurs de conflit** | `<<<<<<<`, `=======`, `>>>>>>>` |

### Théorie
```
<<<<<<< HEAD
Version courante
=======
Version fusionnée
>>>>>>> nom-de-l-autre-branche
```
Résolution : éditer → supprimer les marqueurs → `git add` → `git commit`.

### Commandes commentées

**`git merge branche-x`** - déclenche potentiellement un conflit.

**`git status`** - liste les fichiers en conflit.

**`git diff`** (pendant un conflit) - affiche les marqueurs directement dans le diff.

**`git merge --abort`** - annule totalement.

**`git checkout --ours fichier`** / **`--theirs fichier`** - garde une version précise.

**`git mergetool`** - ouvre un outil graphique de résolution de conflit configuré (ex. `vimdiff`, `meld`, VS Code).

**`git log --merge`** - pendant un conflit, liste les commits impliqués des deux côtés de la fusion, pour comprendre le contexte de chaque changement.

###  Exemple pratique 1 - provoquer et résoudre un conflit

```bash
cd ~/git-formation
mkdir lab-conflit-demo && cd lab-conflit-demo
git init
echo "Bonjour, bienvenue." > accueil.txt
git add . && git commit -m "Initial commit"
git checkout -b branche-fr
echo "Bonjour chaleureusement !" > accueil.txt
git add . && git commit -m "feat: message chaleureux"
git checkout main
echo "Bienvenue officiellement." > accueil.txt
git add . && git commit -m "feat: message formel"
git merge branche-fr
cat accueil.txt
echo "Bienvenue chaleureusement." > accueil.txt
git add accueil.txt
git commit
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-conflit-demo && cd lab-conflit-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "Bonjour, bienvenue." > accueil.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "Initial commit"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git checkout -b branche-fr` : crée une nouvelle branche et bascule dessus immédiatement
- `echo "Bonjour chaleureusement !" > accueil.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: message chaleureux"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git checkout main` : bascule sur la branche `main`
- `echo "Bienvenue officiellement." > accueil.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: message formel"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git merge branche-fr` : fusionne la branche indiquée dans la branche actuellement active
- `cat accueil.txt` : affiche le contenu du fichier indiqué
- `echo "Bienvenue chaleureusement." > accueil.txt` : écrit (ou affiche) le texte indiqué
- `git add accueil.txt` : ajoute ce(s) fichier(s) précis à la Staging Area
- `git commit` : ouvre l'éditeur configuré pour rédiger un message de commit détaillé

###  Exemple pratique 2 - résoudre avec `--ours`/`--theirs`

```bash
git checkout -b branche-test-ours
echo "Version A" > choix.txt
git add . && git commit -m "feat: version A"
git checkout main
echo "Version B" > choix.txt
git add . && git commit -m "feat: version B"
git merge branche-test-ours
git checkout --ours choix.txt     # garde la version de main (courante)
git add choix.txt
git commit
cat choix.txt
```

**Ce que fait ce bloc, ligne par ligne :**
- `git checkout -b branche-test-ours` : crée une nouvelle branche et bascule dessus immédiatement
- `echo "Version A" > choix.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: version A"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git checkout main` : bascule sur la branche `main`
- `echo "Version B" > choix.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: version B"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git merge branche-test-ours` : fusionne la branche indiquée dans la branche actuellement active
- `git checkout --ours choix.txt     # garde la version de main (courante)` : résout un conflit en gardant la version de la branche courante
- `git add choix.txt` : ajoute ce(s) fichier(s) précis à la Staging Area
- `git commit` : ouvre l'éditeur configuré pour rédiger un message de commit détaillé
- `cat choix.txt` : affiche le contenu du fichier indiqué

### Cas d'usage professionnel
- **Fusion de branches longues** : plus une branche vit longtemps sans être synchronisée avec `main`, plus les conflits qu'elle génère au moment de la fusion sont nombreux et complexes - d'où l'intérêt des branches courtes (Module 9).
- **Fichiers de configuration partagés** : les conflits sur des fichiers comme `package.json` ou `pom.xml` sont fréquents en équipe ; certaines organisations ajoutent des stratégies de fusion personnalisées (`.gitattributes`) pour les fichiers générés automatiquement.
- **Pair programming à distance** : deux développeurs travaillant sur la même fonctionnalité en parallèle synchronisent volontairement leurs branches plusieurs fois par jour pour détecter les conflits tôt, quand ils sont encore petits.

###  Pièges fréquents
- Oublier de supprimer un marqueur avant de committer.
- `--ours`/`--theirs` s'inversent entre merge et rebase.

###  Auto-évaluation
1. Que signifient les marqueurs de conflit ?
2. Commande pour annuler un merge en cours ?
3. Les 4 étapes de résolution manuelle ?

###  Lab associé
 [`labs/Lab-07-conflits-de-fusion.md`](labs/Lab-07-conflits-de-fusion.md) ·  [Correction](corrections/Lab-07-conflits-de-fusion-correction.md)

---

## Module 6 · Rebase et historique linéaire

###  Introduction
Le rebase divise souvent les équipes : certains l'adorent pour son historique propre et linéaire, d'autres le bannissent pour son risque de casse en cas de mauvaise utilisation. Ce module vous donne les clés pour l'utiliser **en toute sécurité**, en comprenant précisément ce qu'il fait - et surtout ce qu'il ne faut jamais faire avec.

###  Définitions
| Terme | Définition |
|---|---|
| **Rebase** | rejeu des commits sur une nouvelle base, hash réécrits |
| **Historique linéaire** | sans bifurcation visible |

### Théorie
```
main ──── A ── B ──── E
                \
feature          C ── D

git rebase main (depuis feature) →

main ──── A ── B ──── E
                       \
feature                 C' ── D'   (nouveaux hash !)
```

| | `merge` | `rebase` |
|---|---|---|
| Historique | conserve les divergences | linéaire |
| Sécurité | ne réécrit rien | réécrit - dangereux si partagé |
| Règle d'or | toujours sûr | jamais sur du partagé |

### Commandes commentées

**`git rebase main`** - rejoue les commits sur `main`.

**`git rebase --abort`** - annule un rebase en cours.

**`git rebase --continue`** - poursuit après résolution d'un conflit.

**`git rebase --skip`** - ignore le commit en conflit (rare, prudence).

**`git pull --rebase`** - fetch + rebase au lieu de merge.

**`git rebase --onto nouvelle-base ancienne-base branche`** - rebase avancé : déplace une plage précise de commits vers une nouvelle base, utile pour réorganiser une branche complexe.

###  Exemple pratique 1 - rebase simple

```bash
cd ~/git-formation
mkdir lab-rebase-demo && cd lab-rebase-demo
git init
echo "v1" > app.txt
git add . && git commit -m "Initial commit"
git checkout -b feature-x
echo "v2-feature" >> app.txt
git add . && git commit -m "feat: fonctionnalité X"
git checkout main
echo "v2-main" >> app.txt
git add . && git commit -m "fix: bug urgent"
git checkout feature-x
git rebase main
git log --oneline --graph --all
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-rebase-demo && cd lab-rebase-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "v1" > app.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "Initial commit"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git checkout -b feature-x` : crée une nouvelle branche et bascule dessus immédiatement
- `echo "v2-feature" >> app.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: fonctionnalité X"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git checkout main` : bascule sur la branche `main`
- `echo "v2-main" >> app.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "fix: bug urgent"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git checkout feature-x` : bascule sur la branche ou le commit indiqué
- `git rebase main` : rejoue les commits de la branche courante par-dessus `main`
- `git log --oneline --graph --all` : affiche l'historique condensé sous forme de graphe, toutes branches confondues

###  Exemple pratique 2 - `git pull --rebase` en pratique

```bash
cd ~/git-formation
mkdir -p serveur-rebase && cd serveur-rebase
git init --bare projet.git
cd ~/git-formation
git clone serveur-rebase/projet.git clone-a
git clone serveur-rebase/projet.git clone-b

cd clone-a
echo "base" > app.txt && git add . && git commit -m "Initial commit"
git push -u origin main

cd ../clone-b
git pull
echo "modif B" >> app.txt && git add . && git commit -m "feat: modif B"
git push

cd ../clone-a
echo "modif A" >> app.txt && git add . && git commit -m "feat: modif A"
git pull --rebase        # au lieu d'un simple "git pull"
git log --oneline --graph
git push
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir -p serveur-rebase && cd serveur-rebase` : crée le dossier indiqué, y compris les dossiers parents manquants
- `git init --bare projet.git` : crée un dépôt sans working directory (simule un serveur distant)
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `git clone serveur-rebase/projet.git clone-a` : copie intégralement un dépôt distant (ou local) vers un nouveau dossier
- `git clone serveur-rebase/projet.git clone-b` : copie intégralement un dépôt distant (ou local) vers un nouveau dossier
- `cd clone-a` : se déplace dans le dossier indiqué
- `echo "base" > app.txt && git add . && git commit -m "Initial commit"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git push -u origin main` : envoie la branche vers le distant et la lie pour les prochains push/pull
- `cd ../clone-b` : se déplace dans le dossier indiqué
- `git pull` : récupère les commits distants et les fusionne dans la branche courante
- `echo "modif B" >> app.txt && git add . && git commit -m "feat: modif B"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git push` : envoie les commits locaux de la branche courante vers son distant de suivi
- `cd ../clone-a` : se déplace dans le dossier indiqué
- `echo "modif A" >> app.txt && git add . && git commit -m "feat: modif A"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git pull --rebase        # au lieu d'un simple "git pull"` : récupère les commits distants puis les rebase, au lieu de fusionner
- `git log --oneline --graph` : affiche l'historique condensé sous forme de graphe (branche courante)
- `git push` : envoie les commits locaux de la branche courante vers son distant de suivi

###  Cas d'usage professionnel
- **Nettoyage avant Pull Request** : de nombreuses équipes exigent un rebase local (jamais partagé) pour présenter un historique propre avant l'ouverture d'une PR.
- **`pull --rebase` par défaut** : certaines équipes configurent `git config --global pull.rebase true` pour garder systématiquement un historique linéaire, évitant les innombrables petits merge commits de synchronisation.
- **Synchronisation de branche longue** : une branche `feature` qui dure plusieurs semaines est régulièrement rebasée sur `main` (tant qu'elle reste personnelle et non partagée) pour limiter les conflits à la fusion finale.

###  Pièges fréquents
- Ne jamais rebaser une branche publique/partagée.

###  Auto-évaluation
1. Règle d'or du rebase ?
2. Pourquoi les hash changent après rebase ?
3. Contexte pro où le rebase est apprécié ?

###  Lab associé
 [`labs/Lab-08-rebase.md`](labs/Lab-08-rebase.md) ·  [Correction](corrections/Lab-08-rebase-correction.md)

---

###  Lab de synthèse - Partie 2

 [`labs/Lab-09-capstone-site-vitrine-branches.md`](labs/Lab-09-capstone-site-vitrine-branches.md) ·  [Correction](corrections/Lab-09-capstone-site-vitrine-branches-correction.md)

---

# Partie 3 - Travail collaboratif (distant)

## Module 7 · Dépôts distants : clone, push, pull, fetch

###  Introduction
Jusqu'ici, tout se passait sur votre seule machine. Ce module ouvre Git au travail en équipe réel : synchroniser son travail avec un serveur distant, récupérer celui des autres, et comprendre précisément ce que chaque commande touche (ou ne touche pas). C'est la porte d'entrée vers GitHub/GitLab et la collaboration professionnelle moderne.

###  Définitions
| Terme | Définition |
|---|---|
| **Remote** | copie du dépôt hébergée ailleurs |
| **Origin** | nom conventionnel du distant principal |
| **Bare repository** | dépôt sans working directory |
| **Tracking branch** | branche locale liée à une distante |

### Théorie
- `git fetch` : télécharge sans toucher au working directory. 100% sûr.
- `git pull` : `fetch` + `merge`/`rebase` automatique. Modifie le working directory.

### Commandes commentées

**`git clone <url>`** - copie un dépôt distant.

**`git clone <url> mon-dossier`** - clone dans un dossier au nom choisi.

**`git remote -v`** - liste les distants.

**`git remote add origin <url>`** - lie un distant.

**`git remote set-url origin <url>`** - change l'URL d'un distant déjà configuré.

**`git fetch origin`** - télécharge sans fusionner.

**`git fetch --all`** - depuis tous les distants configurés.

**`git pull origin main`** - fetch + merge.

**`git push origin main`** / **`-u`** - envoie / envoie et lie.

**`git push origin --delete nom`** - supprime une branche distante.

**`git branch -vv`** - affiche le lien local/distant et l'écart (en avance/en retard).

**`git ls-remote origin`** - liste les références (branches, tags) présentes sur le distant, sans rien télécharger localement - utile pour un diagnostic rapide.

###  Exemple pratique 1 - dépôt distant simulé

```bash
cd ~/git-formation
mkdir -p serveur-simule && cd serveur-simule
git init --bare projet.git
cd ~/git-formation
git clone serveur-simule/projet.git mon-clone
cd mon-clone
echo "# Mon Projet" > README.md
git add . && git commit -m "Initial commit"
git push -u origin main
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir -p serveur-simule && cd serveur-simule` : crée le dossier indiqué, y compris les dossiers parents manquants
- `git init --bare projet.git` : crée un dépôt sans working directory (simule un serveur distant)
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `git clone serveur-simule/projet.git mon-clone` : copie intégralement un dépôt distant (ou local) vers un nouveau dossier
- `cd mon-clone` : se déplace dans le dossier indiqué
- `echo "# Mon Projet" > README.md` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "Initial commit"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git push -u origin main` : envoie la branche vers le distant et la lie pour les prochains push/pull

###  Exemple pratique 2 - fetch vs pull, en détail

```bash
cd ~/git-formation
git clone serveur-simule/projet.git clone-collegue
cd clone-collegue
echo "Section ajoutée" >> README.md
git add . && git commit -m "feat: ajoute une section"
git push

cd ~/git-formation/mon-clone
git fetch origin
git log --oneline --all --graph     # origin/main en avance, main local inchangé
cat README.md                        # contenu INCHANGÉ sur le disque
git pull
cat README.md                        # à jour maintenant
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `git clone serveur-simule/projet.git clone-collegue` : copie intégralement un dépôt distant (ou local) vers un nouveau dossier
- `cd clone-collegue` : se déplace dans le dossier indiqué
- `echo "Section ajoutée" >> README.md` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: ajoute une section"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git push` : envoie les commits locaux de la branche courante vers son distant de suivi
- `cd ~/git-formation/mon-clone` : se déplace dans le dossier indiqué
- `git fetch origin` : télécharge les nouveaux commits du distant, sans toucher au working directory
- `git log --oneline --all --graph     # origin/main en avance, main local inchangé` : affiche l'historique condensé, un commit résumé par ligne
- `cat README.md                        # contenu INCHANGÉ sur le disque` : affiche le contenu du fichier indiqué
- `git pull` : récupère les commits distants et les fusionne dans la branche courante
- `cat README.md                        # à jour maintenant` : affiche le contenu du fichier indiqué

###  Cas d'usage professionnel
- **Sauvegarde délocalisée** : héberger son dépôt sur GitHub/GitLab garantit une copie hors de sa machine en cas de panne matérielle.
- **Revue avant intégration** : `git fetch` seul, suivi d'une inspection (`git log`, `git diff`) avant `merge`, est une pratique plus prudente que `git pull` en aveugle sur des projets sensibles.
- **Dépôts miroirs** : certaines entreprises maintiennent un miroir interne (`git remote add mirror <url-interne>`) en plus du dépôt GitHub public, pour des raisons de conformité ou de résilience réseau.

###  Pièges fréquents
- `git push --force` sans comprendre les conséquences.
- Oublier `-u` au premier push.

### Auto-évaluation
1. Différence `fetch`/`pull` ?
2. Pourquoi `push --force` est dangereux ?
3. Rôle de `-u` ?

###  Lab associé
 [`labs/Lab-10-depots-distants.md`](labs/Lab-10-depots-distants.md) ·  [Correction](corrections/Lab-10-depots-distants-correction.md)

---

## Module 8 · GitHub : Pull Requests et code review

###  Introduction
La Pull Request est le cœur battant de la collaboration open source et de la quasi-totalité des équipes de développement modernes. Ce module vous apprend non seulement à en créer une, mais à comprendre son rôle : un espace de discussion, de validation qualité, et de documentation vivante des décisions techniques d'un projet.

###  Définitions
| Terme | Définition |
|---|---|
| **Issue** | suivi de bug/tâche |
| **Pull Request** | proposition d'intégration d'une branche |
| **Fork** | copie sous son propre compte |
| **Squash and merge** | fusion combinant tous les commits en un |

### Théorie
```
1. Cloner/forker → 2. Branche → 3. Commits → 4. Push → 5. PR → 6. Review → 7. Merge → 8. Nettoyer
```

| Stratégie de fusion | Effet | Quand l'utiliser |
|---|---|---|
| **Merge commit** | conserve tous les commits + crée un commit de merge | historique détaillé utile |
| **Squash and merge** | combine tous les commits en un seul | le plus courant en entreprise |
| **Rebase and merge** | rejoue chaque commit individuellement, sans merge commit | historique linéaire souhaité |

### Commandes commentées

**`git checkout -b feature/nom-de-la-fonctionnalite`** - convention de nommage la plus répandue.

**`gh pr create --title "..." --body "..."`** - crée une PR depuis le terminal.

**`gh pr list`** - liste les PR ouvertes.

**`gh pr view 42 --web`** - ouvre la PR n°42 dans le navigateur.

**`gh pr checkout 42`** - récupère localement la PR n°42 pour la tester.

**`gh pr merge 42 --squash`** - fusionne depuis le terminal.

**`gh pr diff 42`** - affiche le diff complet d'une PR directement dans le terminal, sans navigateur.

###  Exemple pratique 1 - cycle de PR complet

```bash
cd ~/git-formation/mon-clone
git checkout main && git pull
git checkout -b feature/nouvelle-section
echo "Nouvelle section" > section.txt
git add . && git commit -m "feat: ajoute une nouvelle section"
git push -u origin feature/nouvelle-section
# → ouvrir une PR sur GitHub, fusionner, puis :
git checkout main && git pull
git branch -d feature/nouvelle-section
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation/mon-clone` : se déplace dans le dossier indiqué
- `git checkout main && git pull` : bascule sur la branche `main`
- `git checkout -b feature/nouvelle-section` : crée une nouvelle branche et bascule dessus immédiatement
- `echo "Nouvelle section" > section.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: ajoute une nouvelle section"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git push -u origin feature/nouvelle-section` : envoie la branche vers le distant et la lie pour les prochains push/pull
- `git checkout main && git pull` : bascule sur la branche `main`
- `git branch -d feature/nouvelle-section` : supprime une branche locale (refuse si elle n'est pas fusionnée)

###  Exemple pratique 2 - utiliser le CLI GitHub (`gh`)

```bash
cd ~/git-formation/mon-clone
git checkout -b feature/via-cli
echo "Contenu via CLI" > cli-demo.txt
git add . && git commit -m "feat: ajoute une démo via CLI"
git push -u origin feature/via-cli
gh pr create --title "Ajoute une démo CLI" --body "Créée entièrement depuis le terminal avec gh."
gh pr list
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation/mon-clone` : se déplace dans le dossier indiqué
- `git checkout -b feature/via-cli` : crée une nouvelle branche et bascule dessus immédiatement
- `echo "Contenu via CLI" > cli-demo.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: ajoute une démo via CLI"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git push -u origin feature/via-cli` : envoie la branche vers le distant et la lie pour les prochains push/pull
- `gh pr create --title "Ajoute une démo CLI" --body "Créée entièrement depuis le terminal avec gh."` : crée une Pull Request directement depuis le terminal
- `gh pr list` : liste les Pull Requests actuellement ouvertes

###  Cas d'usage professionnel
- **Revue obligatoire avant production** : la plupart des équipes interdisent tout merge direct sur `main` sans au moins une approbation de PR (voir Module 21, branch protection).
- **Documentation vivante** : les discussions dans une PR (pourquoi tel choix technique, quelles alternatives envisagées) constituent souvent la meilleure documentation d'un projet, consultable des années après.
- **Contribution open source** : contribuer à un projet open source passe presque toujours par un fork + PR, même sans droit d'écriture direct sur le dépôt original.

###  Pièges fréquents
- PR avec des dizaines de commits « WIP ».

###  Auto-évaluation
1. Différence entre les 3 stratégies de fusion ?
2. Pourquoi Squash and merge est privilégié en entreprise ?
3. Que se passe-t-il sur une PR quand on pousse un nouveau commit ?

###  Lab associé
 [`labs/Lab-11-pull-requests-code-review.md`](labs/Lab-11-pull-requests-code-review.md) ·  [Correction](corrections/Lab-11-pull-requests-code-review-correction.md)

---

## Module 9 · Workflows d'équipe

###  Introduction
Git ne force aucune méthode d'organisation : c'est à chaque équipe de choisir son workflow, et ce choix a des conséquences concrètes sur la vitesse de livraison, la stabilité, et la complexité opérationnelle. Ce module compare les trois approches dominantes du marché pour vous permettre de faire un choix éclairé, ou de comprendre celui déjà fait par une équipe que vous rejoignez.

###  Définitions
| Terme | Définition |
|---|---|
| **Workflow Git** | convention d'équipe sur les branches |
| **Feature flag** | code caché en prod sans branche longue |

### Théorie
| Critère | Git Flow | GitHub Flow | Trunk-Based |
|---|---|---|---|
| Complexité | Élevée | Faible | Moyenne |
| Adapté à | Releases versionnées | SaaS continu | DevOps mature |
| Durée de vie des branches | Longue | Courte | Très courte/inexistante |

- **Git Flow** : `main`, `develop`, `feature/*`, `release/*`, `hotfix/*`.
- **GitHub Flow** : une branche longue (`main`), branches courtes par fonctionnalité.
- **Trunk-Based** : commits fréquents directement sur `main`, feature flags.

###  Exemple pratique 1 - un cycle GitHub Flow

```bash
cd ~/git-formation/mon-clone
git checkout main && git pull
git checkout -b feature/tarte-citron
echo "## Tarte au citron" > tarte-citron.txt
git add . && git commit -m "feat: ajoute la tarte au citron"
git push -u origin feature/tarte-citron
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation/mon-clone` : se déplace dans le dossier indiqué
- `git checkout main && git pull` : bascule sur la branche `main`
- `git checkout -b feature/tarte-citron` : crée une nouvelle branche et bascule dessus immédiatement
- `echo "## Tarte au citron" > tarte-citron.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: ajoute la tarte au citron"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git push -u origin feature/tarte-citron` : envoie la branche vers le distant et la lie pour les prochains push/pull

###  Exemple pratique 2 - simuler un Git Flow minimal

```bash
cd ~/git-formation/mon-clone
git checkout -b develop
git checkout -b feature/nouvelle-fonctionnalite develop
echo "code de la fonctionnalité" > feature.txt
git add . && git commit -m "feat: nouvelle fonctionnalité"
git checkout develop
git merge --no-ff feature/nouvelle-fonctionnalite -m "merge: intègre la fonctionnalité dans develop"
git checkout -b release/1.0 develop
git checkout main
git merge --no-ff release/1.0 -m "merge: release 1.0 en production"
git tag -a v1.0.0 -m "Version 1.0.0"
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation/mon-clone` : se déplace dans le dossier indiqué
- `git checkout -b develop` : crée une nouvelle branche et bascule dessus immédiatement
- `git checkout -b feature/nouvelle-fonctionnalite develop` : crée une nouvelle branche et bascule dessus immédiatement
- `echo "code de la fonctionnalité" > feature.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: nouvelle fonctionnalité"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git checkout develop` : bascule sur la branche `dev`
- `git merge --no-ff feature/nouvelle-fonctionnalite -m "merge: intègre la fonctionnalité dans develop"` : force la création d'un commit de fusion, même si un fast-forward est possible
- `git checkout -b release/1.0 develop` : crée une nouvelle branche et bascule dessus immédiatement
- `git checkout main` : bascule sur la branche `main`
- `git merge --no-ff release/1.0 -m "merge: release 1.0 en production"` : force la création d'un commit de fusion, même si un fast-forward est possible
- `git tag -a v1.0.0 -m "Version 1.0.0"` : crée un tag annoté (objet complet avec auteur, date, message)

###  Cas d'usage professionnel
- **SaaS à déploiement continu** : une startup qui déploie 10 fois par jour choisit naturellement GitHub Flow ou Trunk-Based, jamais Git Flow.
- **Logiciel embarqué/firmware** : un fabricant qui maintient simultanément les versions 2.x et 3.x de son firmware, avec des cycles de certification longs, s'appuie sur Git Flow pour gérer les branches `release/*` en parallèle.
- **Grande équipe (50+ développeurs)** : le Trunk-Based Development, appuyé par des feature flags et une suite de tests automatisés robuste, minimise les conflits de fusion à grande échelle.

###  Pièges fréquents
- Choisir Git Flow pour un petit SaaS déployé en continu.

###  Auto-évaluation
1. Workflow pour un SaaS déployé plusieurs fois par jour ?
2. Qu'est-ce qu'un feature flag ?
3. Pourquoi Git Flow reste pertinent pour du desktop/firmware ?

###  Lab associé
 [`labs/Lab-12-workflows-equipe.md`](labs/Lab-12-workflows-equipe.md) ·  [Correction](corrections/Lab-12-workflows-equipe-correction.md)

---

###  Lab de synthèse - Partie 3

 [`labs/Lab-13-capstone-collaboration-simulee.md`](labs/Lab-13-capstone-collaboration-simulee.md) ·  [Correction](corrections/Lab-13-capstone-collaboration-simulee-correction.md)

---

# Partie 4 - Techniques intermédiaires

## Module 10 · Annuler et corriger : reset, revert, restore

###  Introduction
Savoir avancer ne suffit pas : savoir **annuler proprement** est tout aussi crucial, et c'est souvent ce qui distingue un utilisateur confiant d'un utilisateur qui a peur de « casser » son dépôt. Ce module détaille les quatre outils d'annulation de Git et, surtout, **lequel utiliser selon le contexte** - la question la plus fréquente des développeurs à ce sujet.

###  Définitions
| Terme | Définition |
|---|---|
| **reset** | déplace le pointeur de branche (réécrit l'historique local) |
| **revert** | nouveau commit annulant un précédent |
| **restore** | restaure l'état d'un fichier |

### Tableau de décision
| Je veux… | Commande |
|---|---|
| Annuler un fichier non stagé | `git restore fichier.txt` |
| Désindexer sans perdre le contenu | `git restore --staged fichier.txt` |
| Annuler le dernier commit, garder stagé | `git reset --soft HEAD~1` |
| Annuler le dernier commit, garder non stagé | `git reset HEAD~1` |
| Annuler et tout perdre | `git reset --hard HEAD~1` |
| Annuler un commit déjà partagé | `git revert <hash>` |

### Commandes commentées

**`git restore fichier.txt`** - annule une modification non stagée.

**`git restore --staged fichier.txt`** - désindexe, sans toucher au contenu.

**`git restore --source=HEAD~2 fichier.txt`** - restaure un fichier tel qu'il était 2 commits plus tôt.

**`git reset --soft HEAD~1`** - garde le contenu stagé.

**`git reset HEAD~1`** (mixed, défaut) - garde le contenu non stagé.

**`git reset --hard HEAD~1`** - supprime le contenu du disque.

**`git revert <hash>`** - crée un nouveau commit annulant `<hash>`.

**`git revert --no-commit <hash>`** - prépare le revert sans committer immédiatement, pour ajuster avant.

**`git revert -m 1 <hash-du-merge>`** - annule un **commit de merge** spécifiquement, en précisant quel parent (`-m 1` ou `-m 2`) sert de référence.

###  Exemple pratique 1 - les 3 modes de reset

```bash
cd ~/git-formation
mkdir lab-reset-demo && cd lab-reset-demo
git init
echo "v1" > fichier.txt && git add . && git commit -m "commit 1"
echo "v2" > fichier.txt && git add . && git commit -m "commit 2"
echo "v3" > fichier.txt && git add . && git commit -m "commit 3"
git reset --soft HEAD~1
git status
git commit -m "commit 3 (recréé)"
git reset --hard HEAD~1
cat fichier.txt
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-reset-demo && cd lab-reset-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "v1" > fichier.txt && git add . && git commit -m "commit 1"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `echo "v2" > fichier.txt && git add . && git commit -m "commit 2"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `echo "v3" > fichier.txt && git add . && git commit -m "commit 3"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git reset --soft HEAD~1` : déplace HEAD vers ce commit, en gardant le contenu annulé dans la Staging Area
- `git status` : affiche l'état actuel de chaque fichier (untracked/modified/staged)
- `git commit -m "commit 3 (recréé)"` : crée un commit avec le message indiqué directement
- `git reset --hard HEAD~1` : déplace HEAD vers ce commit, en supprimant tout contenu non commité du disque
- `cat fichier.txt` : affiche le contenu du fichier indiqué

###  Exemple pratique 2 - revert d'un commit déjà partagé

```bash
echo "config stable" > config.txt
git add . && git commit -m "config initiale"
echo "config CASSÉE" > config.txt
git add . && git commit -m "feat: nouvelle config (cassée par erreur)"
git revert HEAD
cat config.txt
git log --oneline
```

**Ce que fait ce bloc, ligne par ligne :**
- `echo "config stable" > config.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "config initiale"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `echo "config CASSÉE" > config.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: nouvelle config (cassée par erreur)"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git revert HEAD` : crée un nouveau commit annulant les effets du tout dernier commit
- `cat config.txt` : affiche le contenu du fichier indiqué
- `git log --oneline` : affiche l'historique condensé, un commit résumé par ligne

###  Cas d'usage professionnel
- **Incident en production** : un commit vient de casser un environnement live et a déjà été poussé - `git revert` est la **seule** réponse sûre, jamais `reset --hard` + `push --force`.
- **Nettoyage de brouillon local** : avant un premier commit, `git restore` est utilisé en boucle pour annuler des essais qui n'ont jamais quitté le poste du développeur.
- **Annulation d'un merge problématique** : `git revert -m 1` permet d'annuler l'intégralité d'une fusion défaillante sans casser l'historique déjà partagé par l'équipe.

###  Pièges fréquents
- `reset --hard` supprime le contenu non commité.

###  Auto-évaluation
1. Différence `--soft`/`--mixed`/`--hard` ?
2. Pourquoi `revert` sur un historique partagé ?
3. Comment désindexer sans perdre le contenu ?

###  Lab associé
 [`labs/Lab-14-reset-revert-restore.md`](labs/Lab-14-reset-revert-restore.md) ·  [Correction](corrections/Lab-14-reset-revert-restore-correction.md)

---

## Module 11 · Stash et travail temporaire

###  Introduction
Le stash répond à une situation extrêmement courante : vous êtes en plein milieu d'un travail non terminé, et on vous demande de basculer immédiatement sur autre chose (urgence, revue, changement de priorité). Plutôt que de committer du code à moitié fini, ou de perdre votre travail, Git propose une solution élégante et propre.

###  Définitions
| Terme | Définition |
|---|---|
| **Stash** | mise de côté temporaire des modifications non commitées |

### Théorie
```
Working Dir (sale) ──git stash──▶ Pile [stash@{0}, stash@{1}, …] ──git stash pop──▶ Working Dir restauré
```

### Commandes commentées

**`git stash`** / **`git stash save "msg"`** - range les modifications.

**`git stash -u`** - inclut les untracked.

**`git stash -a`** - inclut même les fichiers ignorés par `.gitignore` (rare, cas particuliers).

**`git stash list`** - liste la pile.

**`git stash show stash@{0}`** - affiche un résumé du contenu d'un stash précis.

**`git stash apply`** / **`git stash pop`** - réapplique sans/avec retrait.

**`git stash apply stash@{2}`** - réapplique une entrée précise.

**`git stash drop stash@{0}`** - supprime une entrée.

**`git stash clear`** - supprime **tous** les stash (irréversible).

**`git stash branch nouvelle-branche`** - crée une nouvelle branche à partir d'un stash, pratique quand l'application directe génère un conflit.

###  Exemple pratique 1 - mise de côté en urgence

```bash
cd ~/git-formation
mkdir lab-stash-demo && cd lab-stash-demo
git init
echo "version stable" > app.txt
git add . && git commit -m "Initial commit"
echo "travail en cours..." >> app.txt
git stash save "WIP: travail en cours"
echo "correction urgente" >> app.txt
git add . && git commit -m "fix: correction urgente"
git stash pop
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-stash-demo && cd lab-stash-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "version stable" > app.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "Initial commit"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `echo "travail en cours..." >> app.txt` : écrit (ou affiche) le texte indiqué
- `git stash save "WIP: travail en cours"` : met de côté les modifications en cours, avec un message descriptif
- `echo "correction urgente" >> app.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "fix: correction urgente"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git stash pop` : réapplique la dernière entrée de stash et la retire de la pile

###  Exemple pratique 2 - gérer plusieurs stash

```bash
echo "modif A" >> app.txt
git stash save "Modification A"
echo "modif B" >> app.txt
git stash save "Modification B"
git stash list
git stash show stash@{1}
git stash apply stash@{0}
git stash drop stash@{0}
git stash list
```

**Ce que fait ce bloc, ligne par ligne :**
- `echo "modif A" >> app.txt` : écrit (ou affiche) le texte indiqué
- `git stash save "Modification A"` : met de côté les modifications en cours, avec un message descriptif
- `echo "modif B" >> app.txt` : écrit (ou affiche) le texte indiqué
- `git stash save "Modification B"` : met de côté les modifications en cours, avec un message descriptif
- `git stash list` : liste toutes les entrées de la pile de stash
- `git stash show stash@{1}` : affiche un résumé du contenu d'une entrée de stash précise
- `git stash apply stash@{0}` : réapplique une entrée de stash sans la retirer de la pile
- `git stash drop stash@{0}` : supprime une entrée précise de la pile sans l'appliquer
- `git stash list` : liste toutes les entrées de la pile de stash

###  Cas d'usage professionnel
- **Changement de priorité imprévu** : un développeur en plein refactoring doit traiter un bug critique signalé par le support - `git stash` lui permet de basculer instantanément sans rien perdre.
- **Test d'une hypothèse sur une autre branche** : `git stash branch experimentation` permet de tester une modification en cours sur une branche fraîche, sans risquer de conflit avec la branche d'origine.
- **Synchronisation avant pull** : si `git pull` refuse d'avancer à cause de modifications locales non commitées, `git stash` puis `git stash pop` après le pull est un réflexe courant.

###  Pièges fréquents
- Stash oubliés pendant des semaines.

### Auto-évaluation
1. Différence `apply`/`pop` ?
2. Comment inclure les untracked ?
3. Comment visualiser un stash sans l'appliquer ?

###  Lab associé
 [`labs/Lab-15-stash.md`](labs/Lab-15-stash.md) ·  [Correction](corrections/Lab-15-stash-correction.md)

---

## Module 12 · Tags et versions

###  Introduction
Une fois un logiciel livré, il faut pouvoir désigner **précisément** cette version, la retrouver des mois plus tard, et éventuellement y revenir pour un correctif urgent. C'est le rôle des tags - et de la convention de versionnage sémantique (SemVer), quasi universelle dans l'industrie.

###  Définitions
| Terme | Définition |
|---|---|
| **Tag** | pointeur immuable marquant une version |
| **SemVer** | `MAJOR.MINOR.PATCH` |
| **Tag léger/annoté** | simple pointeur / objet complet avec métadonnées |

### Commandes commentées

**`git tag`** - liste tous les tags.

**`git tag v1.0.0`** - tag léger.

**`git tag -a v1.0.0 -m "..."`** - tag annoté (recommandé).

**`git tag -a v0.9.0 <hash> -m "..."`** - tag annoté rétroactif, sur un commit précis.

**`git tag -l "v1.*"`** - filtre les tags par motif.

**`git show v1.0.0`** - détails.

**`git push origin v1.0.0`** - pousse un tag précis.

**`git push origin --tags`** - pousse tous les tags.

**`git push --follow-tags`** - pousse les commits **et** les tags annotés associés en une seule commande.

**`git tag -d v1.0.0`** - supprime un tag localement.

**`git push origin --delete v1.0.0`** - supprime un tag sur le distant.

**`git checkout v1.0.0`** - detached HEAD sur ce tag.

###  Exemple pratique 1 - versionner un projet

```bash
cd ~/git-formation
mkdir lab-tags-demo && cd lab-tags-demo
git init
echo "v0.1" > app.txt && git add . && git commit -m "feat: version initiale"
git tag -a v1.0.0 -m "Première version stable"
git show v1.0.0
git checkout v1.0.0
cat app.txt
git checkout main
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-tags-demo && cd lab-tags-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "v0.1" > app.txt && git add . && git commit -m "feat: version initiale"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git tag -a v1.0.0 -m "Première version stable"` : crée un tag annoté (objet complet avec auteur, date, message)
- `git show v1.0.0` : affiche le détail complet d'un commit (métadonnées + diff)
- `git checkout v1.0.0` : bascule en detached HEAD directement sur ce tag/commit précis
- `cat app.txt` : affiche le contenu du fichier indiqué
- `git checkout main` : bascule sur la branche `main`

###  Exemple pratique 2 - plusieurs versions et filtrage

```bash
echo "v0.2" >> app.txt && git add . && git commit -m "feat: nouvelle fonctionnalité"
git tag -a v1.1.0 -m "Ajoute la fonctionnalité X"
echo "correctif" >> app.txt && git add . && git commit -m "fix: correctif de sécurité"
git tag -a v1.1.1 -m "Correctif de sécurité"
git tag -l "v1.1.*"
git log --oneline --decorate
```

**Ce que fait ce bloc, ligne par ligne :**
- `echo "v0.2" >> app.txt && git add . && git commit -m "feat: nouvelle fonctionnalité"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git tag -a v1.1.0 -m "Ajoute la fonctionnalité X"` : crée un tag annoté (objet complet avec auteur, date, message)
- `echo "correctif" >> app.txt && git add . && git commit -m "fix: correctif de sécurité"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git tag -a v1.1.1 -m "Correctif de sécurité"` : crée un tag annoté (objet complet avec auteur, date, message)
- `git tag -l "v1.1.*"` : liste les tags correspondant au motif indiqué
- `git log --oneline --decorate` : affiche l'historique condensé avec les noms de branches/tags associés

###  Cas d'usage professionnel
- **Releases de production** : chaque déploiement en production est associé à un tag annoté, permettant de savoir exactement quel code tourne à un instant donné.
- **Rollback rapide** : en cas d'incident, revenir au tag de la version précédente stable (`git checkout v1.1.0`) est un réflexe standard de gestion de crise.
- **Génération automatique de notes de version** : des outils CI/CD lisent les tags SemVer pour déterminer automatiquement le numéro de la prochaine version (`patch`, `minor`, `major`) en fonction des commits Conventional Commits inclus.

###  Pièges fréquents
- `checkout v1.0.0` place en detached HEAD.

###  Auto-évaluation
1. Différence tag léger/annoté ?
2. SemVer `2.4.1` ?
3. Pourquoi `push --tags` en plus de `push` ?

###  Lab associé
 [`labs/Lab-16-tags-versions.md`](labs/Lab-16-tags-versions.md) ·  [Correction](corrections/Lab-16-tags-versions-correction.md)

---

## Module 13 · .gitignore et gestion des fichiers

###  Introduction
Tout projet réel génère des fichiers qui n'ont **rien à faire** dans l'historique : dépendances installées, fichiers de build, secrets de configuration, artefacts d'éditeur. Ce module vous apprend à garder un dépôt propre et sécurisé dès le premier commit - une négligence ici est l'une des causes les plus fréquentes de fuites de données sensibles en entreprise.

###  Définitions
| Terme | Définition |
|---|---|
| **.gitignore** | liste de motifs de fichiers à ne jamais suivre |

### Syntaxe essentielle
```gitignore
# Commentaire
secret.env             # fichier précis
*.log                  # extension
node_modules/           # dossier entier
**/__pycache__/         # partout dans l'arborescence
!important.log          # exception à une règle plus large
/config.local.json      # uniquement à la racine
```

### Commandes commentées

**`git status --ignored`** - affiche aussi les ignorés.

**`git check-ignore -v fichier`** - quelle règle ignore ce fichier.

**`git rm --cached fichier`** - retire du suivi sans supprimer du disque.

**`git ls-files`** - liste tous les fichiers actuellement suivis par Git, pratique pour vérifier qu'aucun fichier indésirable n'est déjà tracké.

**Fichier `.git/info/exclude`** - équivalent d'un `.gitignore` **personnel**, non partagé avec l'équipe (non versionné).

###  Exemple pratique 1 - mise en place complète

```bash
cd ~/git-formation
mkdir lab-gitignore-demo && cd lab-gitignore-demo
git init
mkdir node_modules && echo "lib" > node_modules/lib.js
echo "SECRET_KEY=abc123" > .env
git status
cat > .gitignore << 'EOF'
node_modules/
.env
*.log
.DS_Store
EOF
git status
git check-ignore -v .env
git check-ignore -v node_modules/lib.js
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-gitignore-demo && cd lab-gitignore-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `mkdir node_modules && echo "lib" > node_modules/lib.js` : crée un nouveau dossier
- `echo "SECRET_KEY=abc123" > .env` : écrit (ou affiche) le texte indiqué
- `git status` : affiche l'état actuel de chaque fichier (untracked/modified/staged)
- `cat > .gitignore << 'EOF'` : crée (ou écrase) `.gitignore` avec le contenu multi-lignes qui suit (jusqu'au marqueur `EOF`)
- `git status` : affiche l'état actuel de chaque fichier (untracked/modified/staged)
- `git check-ignore -v .env` : indique la règle exacte du `.gitignore` responsable de l'ignorance de ce fichier
- `git check-ignore -v node_modules/lib.js` : indique la règle exacte du `.gitignore` responsable de l'ignorance de ce fichier

###  Exemple pratique 2 - corriger un fichier déjà suivi par erreur

```bash
cd ~/git-formation
mkdir lab-gitignore-fix && cd lab-gitignore-fix
git init
echo "API_KEY=vrai-secret" > .env
git add . && git commit -m "Initial commit (erreur : .env inclus)"
echo ".env" > .gitignore
git rm --cached .env
git add .gitignore
git commit -m "fix: retire .env du suivi"
git log -p -- .env      # le secret reste visible dans l'historique passé !
git ls-files             # .env n'apparaît plus dans les fichiers suivis désormais
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-gitignore-fix && cd lab-gitignore-fix` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "API_KEY=vrai-secret" > .env` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "Initial commit (erreur : .env inclus)"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `echo ".env" > .gitignore` : écrit (ou affiche) le texte indiqué
- `git rm --cached .env` : retire le fichier du suivi Git futur, sans le supprimer du disque
- `git add .gitignore` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git commit -m "fix: retire .env du suivi"` : crée un commit avec le message indiqué directement
- `git log -p -- .env      # le secret reste visible dans l'historique passé !` : affiche l'historique avec le patch (diff complet) de chaque commit
- `git ls-files             # .env n'apparaît plus dans les fichiers suivis désormais` : liste tous les fichiers actuellement suivis par Git

###  Cas d'usage professionnel
- **Templates `.gitignore` standards** : GitHub propose des modèles prêts à l'emploi par langage (Node, Python, Java…) lors de la création d'un dépôt, à personnaliser ensuite.
- **Scanners de secrets automatiques** : GitHub et GitLab intègrent des scanners qui alertent automatiquement si un `.env`, une clé AWS ou un token semble avoir été committé, en complément d'un bon `.gitignore`.
- **Fichiers de configuration locale par développeur** : `.git/info/exclude` est utilisé pour ignorer des fichiers propres à l'environnement d'un seul développeur (ex. un fichier `.vscode/settings.json` personnalisé), sans imposer cette règle à toute l'équipe.

###  Pièges fréquents
- `.gitignore` n'agit que sur le futur.

###  Auto-évaluation
1. `git rm --cached` vs `git rm` ?
2. Effet de `.gitignore` sur un fichier déjà suivi ?
3. Bonne pratique si une clé API a fuité ?

###  Lab associé
 [`labs/Lab-17-gitignore.md`](labs/Lab-17-gitignore.md) ·  [Correction](corrections/Lab-17-gitignore-correction.md)

---

###  Lab de synthèse - Partie 4

 [`labs/Lab-18-capstone-nettoyage-versioning.md`](labs/Lab-18-capstone-nettoyage-versioning.md) ·  [Correction](corrections/Lab-18-capstone-nettoyage-versioning-correction.md)

---

# Partie 5 - Techniques avancées

## Module 14 · Rebase interactif et réécriture d'historique

###  Introduction
Le rebase interactif est l'outil de « mise en beauté » de l'historique Git : il permet de transformer une série de commits brouillons en un historique clair et professionnel avant de le partager. C'est une compétence très valorisée en entreprise, signe d'un développeur soigneux de la lisibilité de son travail pour ses collègues.

###  Définitions
| Terme | Définition |
|---|---|
| **Rebase interactif** (`rebase -i`) | réordonner/fusionner/modifier/supprimer des commits |
| **squash** | fusionne en gardant les 2 messages |
| **fixup** | fusionne en supprimant le message |

### Théorie
```bash
git rebase -i HEAD~4
```
```
pick a1b2c3d Premier commit
pick e4f5g6h typo
pick i7j8k9l WIP
pick m0n1o2p fix du WIP
```
Actions : `pick`, `reword`, `edit`, `squash`, `fixup`, `drop`.
 Ordre : du plus ancien (haut) au plus récent (bas) - inverse de `git log`.

### Commandes commentées

**`git rebase -i HEAD~N`** - rebase interactif sur les N derniers commits.

**`git rebase -i <hash-parent>`** - rebase interactif depuis un commit précis.

**`git commit --amend`** (pendant un `edit`) - modifie le commit sur lequel le rebase s'est arrêté.

**`git rebase --continue`** / **`--abort`** - poursuit / annule.

**`git rebase --edit-todo`** - modifie le plan de rebase en cours sans repartir de zéro.

###  Exemple pratique 1 - nettoyer un historique brouillon

```bash
cd ~/git-formation
mkdir lab-rebase-i-demo && cd lab-rebase-i-demo
git init
echo "fonction A" > app.txt && git add . && git commit -m "ajoute fonction A"
echo "fonction A corrigée" > app.txt && git add . && git commit -m "fix typo"
echo "fonction B" >> app.txt && git add . && git commit -m "WIP fonction B"
git rebase -i HEAD~3
# fixup le 2e commit dans le 1er ; laisser pick pour le 3e
git log --oneline
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-rebase-i-demo && cd lab-rebase-i-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "fonction A" > app.txt && git add . && git commit -m "ajoute fonction A"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `echo "fonction A corrigée" > app.txt && git add . && git commit -m "fix typo"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `echo "fonction B" >> app.txt && git add . && git commit -m "WIP fonction B"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git rebase -i HEAD~3` : ouvre le rebase interactif pour réordonner/fusionner/modifier les commits
- `git log --oneline` : affiche l'historique condensé, un commit résumé par ligne

###  Exemple pratique 2 - réordonner et supprimer un commit

```bash
echo "console.log('debug')" > debug.txt
git add . && git commit -m "oops: fichier de debug ajouté par erreur"
echo "v2" >> app.txt && git add . && git commit -m "feat: nouvelle fonctionnalité"
git rebase -i HEAD~3
# changer "pick" en "drop" pour le commit de debug
git log --oneline
ls    # debug.txt n'existe plus
```

**Ce que fait ce bloc, ligne par ligne :**
- `echo "console.log('debug')" > debug.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "oops: fichier de debug ajouté par erreur"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `echo "v2" >> app.txt && git add . && git commit -m "feat: nouvelle fonctionnalité"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git rebase -i HEAD~3` : ouvre le rebase interactif pour réordonner/fusionner/modifier les commits
- `git log --oneline` : affiche l'historique condensé, un commit résumé par ligne
- `ls    # debug.txt n'existe plus` : liste le contenu du dossier courant

###  Cas d'usage professionnel
- **Historique propre avant PR** : de nombreuses équipes exigent qu'une branche de fonctionnalité soit « squashée/fixupée » en 1 à 3 commits logiques avant l'ouverture d'une Pull Request.
- **Séparation d'un gros commit** : `edit` permet de reprendre un commit trop volumineux et de le scinder en plusieurs commits plus atomiques via des `git reset HEAD~1` puis des commits successifs.
- **Correction d'un message erroné en profondeur** : `reword` sur un commit ancien (mais jamais partagé) permet de corriger une faute ou clarifier une intention sans toucher au contenu.

###  Pièges fréquents
- Ne jamais rebaser des commits déjà partagés.

###  Auto-évaluation
1. `squash` vs `fixup` ?
2. Effet de `drop` sur un commit introduisant un fichier ?
3. Pourquoi l'ordre est inversé par rapport à `git log` ?

###  Lab associé
 [`labs/Lab-19-rebase-interactif.md`](labs/Lab-19-rebase-interactif.md) ·  [Correction](corrections/Lab-19-rebase-interactif-correction.md)

---

## Module 15 · Cherry-pick et gestion fine des commits

###  Introduction
Parfois, on n'a besoin que d'**un seul** commit précis d'une branche, sans vouloir intégrer tout le reste. Le cherry-pick répond exactement à ce besoin - typiquement pour porter un correctif urgent en production sans attendre qu'une fonctionnalité entière soit terminée.

###  Définitions
| Terme | Définition |
|---|---|
| **Cherry-pick** | applique un commit précis d'une branche sur une autre |
| **Backport** | porter un correctif vers une ancienne version |

### Commandes commentées

**`git cherry-pick <hash>`** - applique ce commit.

**`git cherry-pick <h1> <h2>`** - plusieurs commits à la suite.

**`git cherry-pick <h1>..<h2>`** - une plage de commits (exclut h1, inclut h2).

**`git cherry-pick --no-commit <hash>`** - applique sans committer, pour ajuster avant.

**`git cherry-pick --continue`** / **`--abort`** - gestion de conflit.

**`git cherry-pick -x <hash>`** - ajoute automatiquement une ligne `(cherry picked from commit ...)` au message, pour tracer l'origine.

###  Exemple pratique 1 - hotfix isolé

```bash
cd ~/git-formation
mkdir lab-cherry-demo && cd lab-cherry-demo
git init
echo "v1" > app.txt && git add . && git commit -m "feat: version initiale"
git checkout -b dev
echo "feature en cours" >> app.txt && git add . && git commit -m "feat: fonctionnalité en développement"
echo "correctif sécurité" >> app.txt && git add . && git commit -m "fix: faille de sécurité critique"
git log --oneline
git checkout main
git cherry-pick $(git log dev --format=%H --grep="fix: faille")
cat app.txt
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-cherry-demo && cd lab-cherry-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "v1" > app.txt && git add . && git commit -m "feat: version initiale"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git checkout -b dev` : crée une nouvelle branche et bascule dessus immédiatement
- `echo "feature en cours" >> app.txt && git add . && git commit -m "feat: fonctionnalité en développement"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `echo "correctif sécurité" >> app.txt && git add . && git commit -m "fix: faille de sécurité critique"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git log --oneline` : affiche l'historique condensé, un commit résumé par ligne
- `git checkout main` : bascule sur la branche `main`
- `git cherry-pick $(git log dev --format=%H --grep="fix: faille")` : affiche l'historique propre à la branche `dev`
- `cat app.txt` : affiche le contenu du fichier indiqué

###  Exemple pratique 2 - cherry-pick avec traçabilité (`-x`)

```bash
git checkout dev
echo "autre correctif" >> app.txt && git add . && git commit -m "fix: corrige un second bug"
git checkout main
git cherry-pick -x $(git log dev --format=%H -1)
git log -1
```

**Ce que fait ce bloc, ligne par ligne :**
- `git checkout dev` : bascule sur la branche `dev`
- `echo "autre correctif" >> app.txt && git add . && git commit -m "fix: corrige un second bug"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git checkout main` : bascule sur la branche `main`
- `git cherry-pick -x $(git log dev --format=%H -1)` : affiche l'historique propre à la branche `dev`
- `git log -1` : limite l'affichage au commit le plus récent uniquement

###  Cas d'usage professionnel
- **Backport vers une version LTS** : un correctif de sécurité fait sur `main` est cherry-pické vers les branches `release/2.x` et `release/3.x` encore maintenues en support.
- **Hotfix pendant un développement en cours** : une faille critique découverte pendant qu'une grosse fonctionnalité est en développement sur `dev` est isolée et cherry-pickée en urgence vers `main`.
- **Reprise partielle après abandon d'une branche** : une branche expérimentale est abandonnée, mais un commit isolé s'avère finalement utile - il est récupéré via cherry-pick plutôt que de fusionner toute la branche.

###  Pièges fréquents
- Le commit créé a un hash différent.

###  Auto-évaluation
1. Cas d'usage professionnel du cherry-pick ?
2. Même hash que l'original ?
3. Commande pour annuler un cherry-pick en conflit ?

###  Lab associé
 [`labs/Lab-20-cherry-pick.md`](labs/Lab-20-cherry-pick.md) ·  [Correction](corrections/Lab-20-cherry-pick-correction.md)

---

## Module 16 · Git Bisect : débogage par dichotomie

###  Introduction
Face à une régression dans un historique de centaines ou milliers de commits, tester un par un serait interminable. `git bisect` automatise une recherche dichotomique redoutablement efficace - une compétence de débogage qui peut littéralement faire gagner des heures, voire des jours, sur un bug insaisissable.

###  Définitions
| Terme | Définition |
|---|---|
| **Bisect** | recherche dichotomique du commit fautif |

### Commandes commentées

**`git bisect start`** - démarre la session.

**`git bisect bad`** / **`git bisect bad <hash>`** - marque cassé.

**`git bisect good`** / **`git bisect good <hash>`** - marque sain.

**`git bisect run ./script.sh`** - mode automatisé (`0`=good, `≠0`=bad).

**`git bisect reset`** - termine et revient à l'état initial.

**`git bisect log`** - affiche l'historique des décisions good/bad de la session en cours, réutilisable avec `git bisect replay`.

###  Exemple pratique 1 - bisect manuel

```bash
cd ~/git-formation
mkdir lab-bisect-demo && cd lab-bisect-demo
git init
for i in $(seq 1 10); do
  echo "version $i" > app.txt
  if [ "$i" -eq 6 ]; then echo "BUG=true" >> app.txt; fi
  git add . && git commit -m "commit $i"
done
git bisect start
git bisect bad HEAD
git bisect good $(git log --oneline | tail -1 | cut -d' ' -f1)
cat app.txt   # good/bad selon présence de BUG=true, répéter
git bisect reset
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-bisect-demo && cd lab-bisect-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `for i in $(seq 1 10); do` : boucle qui répète les commandes suivantes pour chaque élément généré
- `echo "version $i" > app.txt` : écrit (ou affiche) le texte indiqué
- `if [ "$i" -eq 6 ]; then echo "BUG=true" >> app.txt; fi` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "commit $i"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `done` : marque la fin d'une boucle `for`
- `git bisect start` : démarre une nouvelle session de recherche dichotomique
- `git bisect bad HEAD` : marque le commit indiqué (ou courant) comme défectueux
- `git bisect good $(git log --oneline | tail -1 | cut -d' ' -f1)` : affiche l'historique condensé, un commit résumé par ligne
- `cat app.txt   # good/bad selon présence de BUG=true, répéter` : affiche le contenu du fichier indiqué
- `git bisect reset` : termine la session de bisect et restaure l'état initial du dépôt

###  Exemple pratique 2 - bisect automatisé avec script

```bash
cat > test-bug.sh << 'EOF'
#!/bin/bash
grep -q "BUG=true" app.txt && exit 1 || exit 0
EOF
chmod +x test-bug.sh
git bisect start HEAD $(git log --oneline | tail -1 | cut -d' ' -f1)
git bisect run ./test-bug.sh
git bisect reset
```

**Ce que fait ce bloc, ligne par ligne :**
- `cat > test-bug.sh << 'EOF'` : crée (ou écrase) `test-bug.sh` avec le contenu multi-lignes qui suit (jusqu'au marqueur `EOF`)
- `chmod +x test-bug.sh` : rend le script exécutable, condition nécessaire pour qu'un hook Git soit pris en compte
- `git bisect start HEAD $(git log --oneline | tail -1 | cut -d' ' -f1)` : affiche l'historique condensé, un commit résumé par ligne
- `git bisect run ./test-bug.sh` : automatise entièrement la recherche à l'aide d'un script de test
- `git bisect reset` : termine la session de bisect et restaure l'état initial du dépôt

###  Cas d'usage professionnel
- **Régression de performance** : un script `bisect run` peut mesurer un temps d'exécution et retourner `1` si un seuil est dépassé, identifiant automatiquement le commit responsable d'un ralentissement.
- **Bug signalé sur une ancienne version** : un client signale un bug présent depuis plusieurs mois - bisect permet de remonter précisément au commit fautif parmi des centaines, même sans connaître le code en détail.
- **Intégration en CI** : certaines pipelines lancent automatiquement un `bisect run` dès qu'un test de non-régression échoue, pour accélérer le diagnostic avant même l'intervention humaine.

###  Pièges fréquents
- Oublier `git bisect reset` à la fin.

###  Auto-évaluation
1. Pourquoi bisect est-il rapide ?
2. Code de sortie pour un commit « bad » ?
3. À faire impérativement en fin de session ?

###  Lab associé
 [`labs/Lab-21-bisect.md`](labs/Lab-21-bisect.md) ·  [Correction](corrections/Lab-21-bisect-correction.md)

---

## Module 17 · Submodules et Subtrees

###  Introduction
Certains projets doivent inclure le code d'un autre dépôt Git - une bibliothèque interne partagée entre plusieurs applications, par exemple. Ce module présente les deux approches possibles et leurs compromis, pour choisir la bonne selon votre contexte.

###  Définitions
| Terme | Définition |
|---|---|
| **Submodule** | référence vers un commit précis d'un autre dépôt |
| **Subtree** | fusion réelle du code d'un autre dépôt |

### Commandes commentées

**`git submodule add <url> chemin`** - ajoute un submodule.

**`git submodule init`** / **`update`** - initialise / récupère après clone.

**`git submodule update --init --recursive`** - les deux en une commande.

**`git clone --recurse-submodules <url>`** - clone + submodules directement.

**`git submodule update --remote`** - met à jour un submodule vers le dernier commit de sa branche distante.

**`git subtree add --prefix=dossier <url> main --squash`** - alternative subtree.

###  Exemple pratique 1 - ajouter un submodule

```bash
cd ~/git-formation
mkdir librairie-utils && cd librairie-utils
git init && echo "function util(){}" > utils.js && git add . && git commit -m "Initial commit"
cd ~/git-formation
mkdir projet-principal && cd projet-principal
git init && echo "# Projet" > README.md && git add . && git commit -m "Initial commit"
git submodule add ~/git-formation/librairie-utils libs/utils
git add . && git commit -m "feat: ajoute le submodule"
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir librairie-utils && cd librairie-utils` : crée un nouveau dossier
- `git init && echo "function util(){}" > utils.js && git add . && git commit -m "Initial commit"` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir projet-principal && cd projet-principal` : crée un nouveau dossier
- `git init && echo "# Projet" > README.md && git add . && git commit -m "Initial commit"` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `git submodule add ~/git-formation/librairie-utils libs/utils` : ajoute un dépôt externe comme submodule à l'emplacement indiqué
- `git add . && git commit -m "feat: ajoute le submodule"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant

###  Exemple pratique 2 - cloner correctement un projet avec submodules

```bash
cd ~/git-formation
git clone projet-principal projet-clone
cd projet-clone
ls libs/utils                          # vide !
git submodule update --init --recursive
ls libs/utils                          # contenu présent maintenant
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `git clone projet-principal projet-clone` : copie intégralement un dépôt distant (ou local) vers un nouveau dossier
- `cd projet-clone` : se déplace dans le dossier indiqué
- `ls libs/utils                          # vide !` : liste le contenu du dossier ou du fichier indiqué
- `git submodule update --init --recursive` : initialise et récupère le contenu de tous les submodules après un clone
- `ls libs/utils                          # contenu présent maintenant` : liste le contenu du dossier ou du fichier indiqué

###  Cas d'usage professionnel
- **Bibliothèque interne partagée** : plusieurs microservices d'une même entreprise référencent, via submodule, une librairie commune de validation de données, chacun figeant la version qui lui convient.
- **Documentation versionnée séparément** : un projet volumineux garde sa documentation dans un dépôt distinct, inclus en submodule pour ne pas alourdir l'historique principal avec des changements purement rédactionnels.
- **Vendoring de dépendances** : avant la généralisation des gestionnaires de paquets modernes, le subtree était utilisé pour intégrer directement le code source de dépendances tierces dans le dépôt principal.

###  Pièges fréquents
- Cloner sans `--recurse-submodules` laisse des dossiers vides.

###  Auto-évaluation
1. Différence submodule/subtree ?
2. Pourquoi un dossier de submodule peut être vide après clone ?
3. Mise à jour automatique du submodule ?

###  Lab associé
 [`labs/Lab-22-submodules-subtrees.md`](labs/Lab-22-submodules-subtrees.md) ·  [Correction](corrections/Lab-22-submodules-subtrees-correction.md)

---

## Module 18 · Hooks Git : automatiser des actions

###  Introduction
Un hook transforme Git en un outil d'automatisation qualité : bloquer un commit mal formé, lancer des tests avant un push, formater du code automatiquement. Ce module vous montre comment faire respecter des règles d'équipe **avant même** qu'un problème n'atteigne l'historique partagé.

###  Définitions
| Terme | Définition |
|---|---|
| **Hook** | script exécuté automatiquement à un moment du cycle de vie |

### Hooks courants
| Hook | Déclenché | Usage typique |
|---|---|---|
| `pre-commit` | avant le commit | linter, formatage automatique |
| `commit-msg` | après rédaction du message | valider le format (Conventional Commits) |
| `pre-push` | avant l'envoi vers le distant | lancer la suite de tests complète |
| `post-merge` | après un merge réussi | réinstaller les dépendances si nécessaire |

### Commandes commentées

**`chmod +x .git/hooks/pre-commit`** - active un hook.

**`git commit --no-verify`** - force en ignorant les hooks.

**`git push --no-verify`** - équivalent pour ignorer un hook `pre-push`.

###  Exemple pratique 1 - hook `pre-commit` anti-TODO

```bash
cd ~/git-formation
mkdir lab-hooks-demo && cd lab-hooks-demo
git init
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
git diff --cached | grep -E "^\+.*TODO" > /dev/null && exit 1
exit 0
EOF
chmod +x .git/hooks/pre-commit
echo "// TODO" > app.js && git add . && git commit -m "test"
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-hooks-demo && cd lab-hooks-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `cat > .git/hooks/pre-commit << 'EOF'` : crée (ou écrase) `.git/hooks/pre-commit` avec le contenu multi-lignes qui suit (jusqu'au marqueur `EOF`)
- `chmod +x .git/hooks/pre-commit` : rend le script exécutable, condition nécessaire pour qu'un hook Git soit pris en compte
- `echo "// TODO" > app.js && git add . && git commit -m "test"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant

###  Exemple pratique 2 - hook `commit-msg` validant le format

```bash
cat > .git/hooks/commit-msg << 'EOF'
#!/bin/bash
MESSAGE=$(cat "$1")
PATTERN="^(feat|fix|docs|style|refactor|test|chore)(\(.+\))?: .+"
[[ "$MESSAGE" =~ $PATTERN ]] || { echo "Format invalide."; exit 1; }
exit 0
EOF
chmod +x .git/hooks/commit-msg
echo "test" >> app.js && git add . && git commit -m "ajout test"     # refusé
git commit -m "test: ajoute une ligne de test"                        # accepté
```

**Ce que fait ce bloc, ligne par ligne :**
- `cat > .git/hooks/commit-msg << 'EOF'` : crée (ou écrase) `.git/hooks/commit-msg` avec le contenu multi-lignes qui suit (jusqu'au marqueur `EOF`)
- `chmod +x .git/hooks/commit-msg` : rend le script exécutable, condition nécessaire pour qu'un hook Git soit pris en compte
- `echo "test" >> app.js && git add . && git commit -m "ajout test"     # refusé` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git commit -m "test: ajoute une ligne de test"                        # accepté` : crée un commit avec le message indiqué directement

###  Cas d'usage professionnel
- **Qualité de code automatisée** : un hook `pre-commit` lance un linter (ESLint, Black, Rubocop…) et refuse le commit si des erreurs de style sont détectées.
- **Conformité des messages** : un hook `commit-msg` impose le format Conventional Commits, nécessaire aux outils de changelog automatique.
- **Partage en équipe via Husky** : dans les projets Node.js, l'outil Husky installe automatiquement les hooks pour tous les contributeurs dès le premier `npm install`, contournant la limite « hooks non versionnés » de Git.

###  Pièges fréquents
- Hooks jamais partagés via `git clone`.

###  Auto-évaluation
1. Pourquoi les hooks ne sont pas partagés ?
2. Commande pour ignorer les hooks ?
3. Cas d'usage pour `pre-push` ?

###  Lab associé
 [`labs/Lab-23-hooks.md`](labs/Lab-23-hooks.md) ·  [Correction](corrections/Lab-23-hooks-correction.md)

---

## Module 19 · Plumbing et internals : comment Git fonctionne vraiment

###  Introduction
Ce module démystifie complètement Git : sous les commandes conviviales du quotidien (« porcelain ») se cache une mécanique remarquablement simple et élégante, faite de quatre types d'objets identifiés par leur contenu. Comprendre ce fonctionnement interne rend toutes les autres commandes du cours plus intuitives - plus rien n'est « magique ».

###  Définitions
| Terme | Définition |
|---|---|
| **Porcelain / Plumbing** | commandes conviviales / commandes bas niveau |
| **Blob / Tree** | contenu brut d'un fichier / structure de dossier |
| **Stockage adressé par contenu** | hash calculé sur le contenu de l'objet |

### Commandes commentées

**`git hash-object -w fichier.txt`** - calcule et stocke un blob.

**`git cat-file -t <hash>`** - affiche le type de l'objet.

**`git cat-file -p <hash>`** - affiche le contenu de l'objet.

**`git rev-parse HEAD`** - résout une référence en hash complet.

**`git ls-tree HEAD`** - liste le contenu du tree racine d'un commit.

**`git update-index --add --cacheinfo 100644 <hash> nom`** - ajoute manuellement une entrée à l'index sans passer par `git add`.

**`git write-tree`** - construit un objet tree à partir de l'index actuel.

**`git commit-tree <hash-tree>`** - crée un commit pointant vers ce tree.

**`git update-ref refs/heads/main <hash>`** - déplace manuellement une branche vers un commit précis.

###  Exemple pratique 1 - créer un blob et l'inspecter

```bash
cd ~/git-formation
mkdir lab-internals-demo && cd lab-internals-demo
git init
echo "Contenu" > fichier1.txt
HASH=$(git hash-object -w fichier1.txt)
git cat-file -t $HASH
git cat-file -p $HASH
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-internals-demo && cd lab-internals-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "Contenu" > fichier1.txt` : écrit (ou affiche) le texte indiqué
- `HASH=$(git hash-object -w fichier1.txt)` : calcule le hash du contenu du fichier et le stocke comme objet blob
- `git cat-file -t $HASH` : affiche le type de l'objet Git correspondant à ce hash (blob/tree/commit/tag)
- `git cat-file -p $HASH` : affiche le contenu lisible de l'objet Git correspondant à ce hash

###  Exemple pratique 2 - créer un commit entièrement à la main

```bash
git update-index --add --cacheinfo 100644 $HASH fichier1.txt
HASH_TREE=$(git write-tree)
HASH_COMMIT=$(echo "Premier commit créé manuellement" | git commit-tree $HASH_TREE)
git update-ref refs/heads/main $HASH_COMMIT
git log --oneline
cat fichier1.txt
git ls-tree HEAD
```

**Ce que fait ce bloc, ligne par ligne :**
- `git update-index --add --cacheinfo 100644 $HASH fichier1.txt` : ajoute manuellement une entrée à l'index (la Staging Area), sans passer par `add`
- `HASH_TREE=$(git write-tree)` : construit un objet tree à partir du contenu actuel de l'index
- `HASH_COMMIT=$(echo "Premier commit créé manuellement" | git commit-tree $HASH_TREE)` : crée un objet commit pointant vers le tree indiqué
- `git update-ref refs/heads/main $HASH_COMMIT` : déplace manuellement une référence (ex. une branche) vers un commit précis
- `git log --oneline` : affiche l'historique condensé, un commit résumé par ligne
- `cat fichier1.txt` : affiche le contenu du fichier indiqué
- `git ls-tree HEAD` : liste le contenu d'un objet tree (la structure de dossier d'un commit)

###  Cas d'usage professionnel
- **Outils Git personnalisés** : des outils comme les serveurs Git (GitLab, Gitea) ou des scripts de migration s'appuient directement sur les commandes plumbing pour manipuler des dépôts par programmation.
- **Diagnostic de corruption** : comprendre le stockage par objets permet de diagnostiquer et parfois réparer un dépôt corrompu à la main, en dernier recours.
- **Compréhension approfondie pour l'entretien technique** : les entretiens techniques pour des postes DevOps/Platform Engineering incluent fréquemment des questions sur les internals de Git.

###  Pièges fréquents
- Croire que Git stocke des diffs.

###  Auto-évaluation
1. Les 4 types d'objets Git ?
2. Pourquoi 2 fichiers identiques partagent le même hash de blob ?
3. Diffs ou instantanés complets ?

###  Lab associé
 [`labs/Lab-24-internals-plumbing.md`](labs/Lab-24-internals-plumbing.md) ·  [Correction](corrections/Lab-24-internals-plumbing-correction.md)

---

###  Lab de synthèse - Partie 5

 [`labs/Lab-25-capstone-debogage-avance.md`](labs/Lab-25-capstone-debogage-avance.md) ·  [Correction](corrections/Lab-25-capstone-debogage-avance-correction.md)

---

# Partie 6 - Maîtrise professionnelle

## Module 20 · Gérer un historique propre (rewriting avancé, filter-repo)

###  Introduction
Certaines erreurs (un secret committé, un fichier volumineux) exigent une intervention radicale : réécrire l'intégralité de l'historique concerné. Ce module couvre l'outil de référence pour cette tâche délicate, ainsi que la discipline nécessaire pour la réaliser sans casser le travail de toute une équipe.

###  Définitions
| Terme | Définition |
|---|---|
| **filter-repo** | outil recommandé pour réécrire massivement l'historique |

### Commandes commentées

**`git filter-repo --path fichier --invert-paths`** - supprime un fichier de tout l'historique.

**`git filter-repo --path dossier/`** - garde uniquement ce chemin (utile pour extraire un sous-projet).

**`git filter-repo --replace-text remplacements.txt`** - remplace un texte sensible partout dans l'historique.

**`git push --force --all`** (après filter-repo) - republie l'historique réécrit sur le distant - à coordonner avec l'équipe.

###  Exemple pratique 1 - effacer un secret de l'historique

```bash
cd ~/git-formation
mkdir lab-filter-repo-demo && cd lab-filter-repo-demo
git init
echo "# App" > README.md && git add . && git commit -m "Initial commit"
echo "API_KEY=secret" > config.env && git add . && git commit -m "erreur"
pip install git-filter-repo --break-system-packages
git filter-repo --path config.env --invert-paths --force
git log -p -- config.env    # aucun résultat
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-filter-repo-demo && cd lab-filter-repo-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "# App" > README.md && git add . && git commit -m "Initial commit"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `echo "API_KEY=secret" > config.env && git add . && git commit -m "erreur"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `pip install git-filter-repo --break-system-packages` : installe l'outil recommandé pour la réécriture avancée d'historique
- `git filter-repo --path config.env --invert-paths --force` : réécrit tout l'historique en incluant ou excluant ce chemin précis
- `git log -p -- config.env    # aucun résultat` : affiche l'historique avec le patch (diff complet) de chaque commit

###  Exemple pratique 2 - remplacer un texte sensible partout

```bash
cd ~/git-formation
mkdir lab-filter-repo-replace && cd lab-filter-repo-replace
git init
echo "cle_api = 'sk-ancienne-cle-12345'" > config.py
git add . && git commit -m "ajoute la config avec clé en dur"
echo "sk-ancienne-cle-12345==>CLE_SUPPRIMEE" > remplacements.txt
git filter-repo --replace-text remplacements.txt --force
grep -r "sk-ancienne" .git 2>/dev/null || echo "Clé absente de l'historique réécrit"
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-filter-repo-replace && cd lab-filter-repo-replace` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "cle_api = 'sk-ancienne-cle-12345'" > config.py` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "ajoute la config avec clé en dur"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `echo "sk-ancienne-cle-12345==>CLE_SUPPRIMEE" > remplacements.txt` : écrit (ou affiche) le texte indiqué
- `git filter-repo --replace-text remplacements.txt --force` : remplace un texte précis, partout où il apparaît dans l'historique
- `grep -r "sk-ancienne" .git 2>/dev/null || echo "Clé absente de l'historique réécrit"` : recherche récursivement un motif dans les fichiers d'un dossier

###  Cas d'usage professionnel
- **Fuite de secret détectée par un scanner GitHub** : la procédure standard combine révocation immédiate de la clé, puis réécriture d'historique coordonnée avec toute l'équipe.
- **Extraction d'un sous-projet** : `git filter-repo --path dossier/` permet d'extraire un sous-dossier d'un monorepo en un nouveau dépôt indépendant, avec son historique propre préservé.
- **Réduction de la taille d'un dépôt** : filter-repo est utilisé pour retirer d'anciens fichiers binaires volumineux (vidéos, exports de base de données) accumulés par erreur au fil des années.

###  Pièges fréquents
- Ne supprime rien sur le distant sans `push --force`.

###  Auto-évaluation
1. Pourquoi `rm --cached` ne suffit pas ?
2. Action plus importante que la réécriture ?
3. Impact sur les collaborateurs déjà clonés ?

###  Lab associé
 [`labs/Lab-26-filter-repo.md`](labs/Lab-26-filter-repo.md) ·  [Correction](corrections/Lab-26-filter-repo-correction.md)

---

## Module 21 · Git avancé en équipe : CODEOWNERS, branch protection, signing

###  Introduction
Une fois les compétences techniques individuelles acquises, la dernière étape est la **gouvernance** : comment s'assurer, au niveau de toute une organisation, que les bonnes pratiques sont réellement respectées, et pas seulement recommandées. Ce module couvre les mécanismes serveur qui transforment une bonne pratique en règle obligatoire.

###  Définitions
| Terme | Définition |
|---|---|
| **Branch protection rule** | règle serveur limitant les actions sur une branche |
| **CODEOWNERS** | fichier assignant des relecteurs obligatoires |
| **Signature de commit** | preuve cryptographique GPG/SSH de l'auteur d'un commit |

### Commandes commentées

**`git config --global user.signingkey <ID-clé-GPG>`** - configure la clé de signature.

**`git config --global commit.gpgsign true`** - signe automatiquement tous les commits futurs.

**`git commit -S -m "message"`** - signature ponctuelle d'un commit.

**`git log --show-signature -1`** - vérifie la signature d'un commit.

###  Exemple pratique 1 - mettre en place CODEOWNERS

```bash
cd ~/git-formation/mon-clone
mkdir -p .github backend
cat > .github/CODEOWNERS << 'EOF'
*             @votre-nom-github
/backend/     @votre-nom-github
EOF
git add . && git commit -m "chore: ajoute CODEOWNERS"
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation/mon-clone` : se déplace dans le dossier indiqué
- `mkdir -p .github backend` : crée le dossier indiqué, y compris les dossiers parents manquants
- `cat > .github/CODEOWNERS << 'EOF'` : crée (ou écrase) `.github/CODEOWNERS` avec le contenu multi-lignes qui suit (jusqu'au marqueur `EOF`)
- `git add . && git commit -m "chore: ajoute CODEOWNERS"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
Sur GitHub : **Settings → Branches → Add branch protection rule** sur `main`, cocher *Require a pull request before merging* et *Require review from Code Owners*.

###  Exemple pratique 2 - signer un commit (si une clé GPG est disponible)

```bash
git config --global commit.gpgsign true
git config --global user.signingkey <ID-de-votre-clé>
echo "contenu signé" > signe.txt
git add . && git commit -S -m "feat: commit signé"
git log --show-signature -1
```

**Ce que fait ce bloc, ligne par ligne :**
- `git config --global commit.gpgsign true` : active la signature automatique de tous les commits futurs
- `git config --global user.signingkey <ID-de-votre-clé>` : définit la clé GPG utilisée pour signer les commits
- `echo "contenu signé" > signe.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -S -m "feat: commit signé"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git log --show-signature -1` : affiche l'historique en vérifiant la signature cryptographique de chaque commit

###  Cas d'usage professionnel
- **Conformité réglementaire** : les secteurs finance/santé exigent souvent une preuve d'intégrité de l'historique - la signature de commits en fait partie.
- **Propriété claire du code** : CODEOWNERS garantit qu'une modification du dossier `infra/` passe systématiquement devant l'équipe DevOps, même si l'auteur de la PR n'y a pas pensé.
- **Prévention des push accidentels sur `main`** : la protection de branche empêche définitivement tout push direct, même par erreur, forçant le passage systématique par une PR.

###  Pièges fréquents
- CODEOWNERS n'oblige rien sans « Require review from Code Owners ».

###  Auto-évaluation
1. Garantie de « Require a pull request before merging » ?
2. Rôle de CODEOWNERS ?
3. Signification du badge « Verified » ?

###  Lab associé
 [`labs/Lab-27-codeowners-branch-protection.md`](labs/Lab-27-codeowners-branch-protection.md) ·  [Correction](corrections/Lab-27-codeowners-branch-protection-correction.md)

---

## Module 22 · Dépannage et récupération (reflog, fsck)

###  Introduction
Même avec toute l'expérience du monde, une fausse manipulation arrive. Ce dernier filet de sécurité technique vous garantit que, dans l'immense majorité des cas, **rien n'est jamais réellement perdu** en local - à condition de savoir où chercher.

###  Définitions
| Terme | Définition |
|---|---|
| **Reflog** | journal local de tous les mouvements de HEAD |
| **fsck** | diagnostic listant les objets orphelins récupérables |

### Commandes commentées

**`git reflog`** - historique de tous les mouvements de HEAD.

**`git reflog show nom-branche`** - reflog spécifique à une branche.

**`git reset --hard HEAD@{2}`** - restaure un état retrouvé dans le reflog.

**`git fsck --full --unreachable`** - liste les objets orphelins.

**`git fsck --lost-found`** - variante plaçant les objets trouvés dans `.git/lost-found`.

###  Exemple pratique 1 - récupérer un commit après un `reset --hard`

```bash
cd ~/git-formation
mkdir lab-reflog-demo && cd lab-reflog-demo
git init
echo "v1" > app.txt && git add . && git commit -m "commit 1"
echo "v2" > app.txt && git add . && git commit -m "commit 2 important"
git reset --hard HEAD~1
git reflog
git reset --hard HEAD@{1}
git log --oneline
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation` : se déplace dans le dossier indiqué
- `mkdir lab-reflog-demo && cd lab-reflog-demo` : crée un nouveau dossier
- `git init` : transforme le dossier courant en dépôt Git (crée `.git/`)
- `echo "v1" > app.txt && git add . && git commit -m "commit 1"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `echo "v2" > app.txt && git add . && git commit -m "commit 2 important"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git reset --hard HEAD~1` : déplace HEAD vers ce commit, en supprimant tout contenu non commité du disque
- `git reflog` : affiche l'historique complet de tous les mouvements de HEAD sur cette machine
- `git reset --hard HEAD@{1}` : déplace HEAD vers ce commit, en supprimant tout contenu non commité du disque
- `git log --oneline` : affiche l'historique condensé, un commit résumé par ligne

###  Exemple pratique 2 - récupérer une branche supprimée par erreur

```bash
git checkout -b branche-importante
echo "travail crucial" > crucial.txt
git add . && git commit -m "feat: travail crucial"
git checkout main
git branch -D branche-importante
git reflog | grep "travail crucial"
git branch branche-recuperee <hash-trouvé>
git checkout branche-recuperee
cat crucial.txt
```

**Ce que fait ce bloc, ligne par ligne :**
- `git checkout -b branche-importante` : crée une nouvelle branche et bascule dessus immédiatement
- `echo "travail crucial" > crucial.txt` : écrit (ou affiche) le texte indiqué
- `git add . && git commit -m "feat: travail crucial"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git checkout main` : bascule sur la branche `main`
- `git branch -D branche-importante` : supprime une branche locale en forçant, même si elle n'est pas fusionnée
- `git reflog | grep "travail crucial"` : affiche l'historique complet de tous les mouvements de HEAD sur cette machine
- `git branch branche-recuperee <hash-trouvé>` : crée une branche à partir d'un commit précis retrouvé
- `git checkout branche-recuperee` : bascule sur la branche ou le commit indiqué
- `cat crucial.txt` : affiche le contenu du fichier indiqué

###  Cas d'usage professionnel
- **Erreur de manipulation sous pression** : en pleine démonstration client ou en urgence de production, un `reset --hard` malencontreux se corrige en quelques secondes grâce au reflog, sans panique.
- **Formation des nouveaux développeurs** : présenter le reflog dès l'onboarding rassure les débutants sur le fait que Git est un filet de sécurité, pas un piège.
- **Diagnostic de dépôt corrompu** : `git fsck` est le premier réflexe en cas de comportement Git étrange, avant d'envisager un re-clone complet.

###  Pièges fréquents
- Le reflog est local uniquement.

###  Auto-évaluation
1. Pourquoi un commit « supprimé » n'est pas perdu immédiatement ?
2. Le reflog est-il partagé ?
3. Commande pour voir les mouvements récents ?

###  Lab associé
 [`labs/Lab-28-reflog-fsck.md`](labs/Lab-28-reflog-fsck.md) ·  [Correction](corrections/Lab-28-reflog-fsck-correction.md)

---

## Module 23 · Bonnes pratiques et conventions professionnelles

###  Introduction
Ce dernier module ne présente aucune nouvelle commande : il synthétise tout ce que vous avez appris en un ensemble de **conventions** à adopter systématiquement en équipe. La maîtrise technique de Git ne suffit pas sans une discipline collective - c'est cette discipline qui distingue une équipe senior d'une équipe qui subit son propre historique.

### Synthèse
- **Messages** : Conventional Commits, ligne ≤ 50 caractères, impératif, explique le pourquoi.
- **Commits** : atomiques, fréquents en local, nettoyés (rebase -i) avant partage si la convention d'équipe le permet.
- **Branches** : nommage cohérent (`feature/`, `fix/`, `hotfix/`, `release/`), courtes, supprimées après fusion.
- **PR** : taille raisonnable, description claire (quoi/pourquoi/comment tester), toujours reviewées.
- **Sécurité** : jamais de secret en dur, `git status`/`git diff --staged` systématiques avant commit.
- **Workflow** : choisi et documenté dans un `CONTRIBUTING.md`, appuyé par branch protection et CI/CD.

###  Exemple pratique 1 - rédiger un CONTRIBUTING.md

```bash
cd ~/git-formation/mon-clone
cat > CONTRIBUTING.md << 'EOF'
# Guide de contribution

## Workflow : GitHub Flow
1. Branche depuis main : feature/nom-court ou fix/nom-du-bug
2. Commits au format Conventional Commits
3. Pull Request + review avant fusion (Squash and merge)

## Avant d'ouvrir une PR
- [ ] Code testé localement
- [ ] Aucun secret dans le diff
EOF
git add . && git commit -m "docs: ajoute le guide de contribution"
git push
```

**Ce que fait ce bloc, ligne par ligne :**
- `cd ~/git-formation/mon-clone` : se déplace dans le dossier indiqué
- `cat > CONTRIBUTING.md << 'EOF'` : crée (ou écrase) `CONTRIBUTING.md` avec le contenu multi-lignes qui suit (jusqu'au marqueur `EOF`)
- `git add . && git commit -m "docs: ajoute le guide de contribution"` : ajoute tous les fichiers nouveaux ou modifiés du dossier courant
- `git push` : envoie les commits locaux de la branche courante vers son distant de suivi

###  Exemple pratique 2 - checklist personnelle avant chaque commit

```bash
# Réflexe à automatiser mentalement avant tout "git commit" :
git status                 # rien d'inattendu ?
git diff --staged           # le contenu stagé est-il exactement ce que je veux ?
git diff --staged | grep -iE "key|secret|password|token" && echo "⚠️ Vérifiez ce diff avant de committer !"
```

**Ce que fait ce bloc, ligne par ligne :**
- `git status                 # rien d'inattendu ?` : affiche l'état actuel de chaque fichier (untracked/modified/staged)
- `git diff --staged           # le contenu stagé est-il exactement ce que je veux ?` : compare la Staging Area au dernier commit (ce qui sera committé)
- `git diff --staged | grep -iE "key|secret|password|token" && echo " Vérifiez ce diff avant de committer !"` : compare la Staging Area au dernier commit (ce qui sera committé)

###  Cas d'usage professionnel
- **Onboarding accéléré** : un `CONTRIBUTING.md` clair réduit drastiquement le temps nécessaire à un nouveau contributeur pour devenir autonome.
- **Cohérence à grande échelle** : sur un monorepo à 100+ contributeurs, des conventions strictes et documentées sont la seule façon de garder un historique exploitable.
- **Audit de sécurité automatisé** : la checklist « aucun secret dans le diff » est de plus en plus intégrée directement dans les hooks `pre-commit` (Module 18) plutôt que laissée à la seule vigilance humaine.

###  Auto-évaluation
1. Pourquoi documenter le workflow ?
2. Contenu d'un bon message de commit ?
3. Vérifications systématiques avant chaque commit ?

###  Lab associé
 [`labs/Lab-29-bonnes-pratiques-contributing.md`](labs/Lab-29-bonnes-pratiques-contributing.md) ·  [Correction](corrections/Lab-29-bonnes-pratiques-contributing-correction.md)

---

###  Lab final - PROJET COMPLET (Partie 6)

Ce dernier lab combine la quasi-totalité des notions du cours dans un unique scénario réaliste de bout en bout.

 [`labs/Lab-30-projet-final-boulangerie.md`](labs/Lab-30-projet-final-boulangerie.md) ·  [Correction](corrections/Lab-30-projet-final-boulangerie-correction.md)

---

## Annexe A - Glossaire complet

| Terme | Définition |
|---|---|
| **Repository** | ensemble versionné d'un projet, stocké dans `.git` |
| **Working Directory** | fichiers tels qu'ils existent sur le disque |
| **Staging Area / Index** | zone tampon préparant le prochain commit |
| **Commit** | instantané enregistré de façon permanente |
| **Branch** | pointeur mobile vers un commit |
| **HEAD** | pointeur vers le commit/la branche active |
| **Remote / Origin** | copie distante du dépôt / son nom conventionnel |
| **Clone / Fork** | copie locale d'un distant / copie sous son propre compte |
| **Merge / Rebase** | fusion à 2 parents / rejeu réécrivant les hash |
| **Conflict** | fusion automatique impossible |
| **Pull Request** | proposition d'intégration d'une branche |
| **Tag** | pointeur immuable marquant une version |
| **Stash** | mise de côté temporaire |
| **Cherry-pick** | application d'un commit précis sur une autre branche |
| **Bisect** | recherche dichotomique du commit fautif |
| **Hook** | script automatique à un moment du cycle de vie |
| **Submodule** | référence vers un commit d'un autre dépôt |
| **Blob / Tree** | contenu brut / structure de dossier |
| **Reflog** | journal local des mouvements de HEAD |
| **Detached HEAD** | HEAD sur un commit, sans branche |
| **Fast-forward** | fusion sans nouveau commit |
| **Squash** | fusion de plusieurs commits en un |
| **Force push** | envoi forcé pouvant écraser l'historique distant |
| **SemVer** | convention `MAJOR.MINOR.PATCH` |

---

## Annexe B - Aide-mémoire (Cheat Sheet)

```bash
# Espace de travail
mkdir -p ~/git-formation && cd ~/git-formation

# Configuration
git config --global user.name "Nom"
git config --global user.email "email"

# Démarrage
git init
git clone <url>

# Cycle de base
git status
git add <fichier> | git add . | git add -p
git commit -m "message"
git commit --amend

# Historique
git log --oneline --graph --all
git diff | git diff --staged
git show <hash>
git blame <fichier>

# Branches
git switch -c nom-branche
git branch -d nom-branche
git merge nom-branche

# Distant
git remote -v
git fetch origin
git pull
git push -u origin nom-branche

# Annuler
git restore <fichier>
git restore --staged <fichier>
git reset --soft HEAD~1
git reset --hard HEAD~1
git revert <hash>

# Stash
git stash save "message"
git stash list
git stash pop

# Tags
git tag -a v1.0.0 -m "message"
git push origin --tags

# Avancé
git rebase -i HEAD~5
git cherry-pick <hash>
git bisect start
git reflog
```

---

## Annexe C - Ressources complémentaires

**Documentation officielle**
- [git-scm.com/doc](https://git-scm.com/doc)
- [Pro Git Book (FR)](https://git-scm.com/book/fr/v2)

**Pratique interactive**
- [Learn Git Branching](https://learngitbranching.js.org/)
- [GitHub Skills](https://skills.github.com/)

**Plateformes**
- [GitHub](https://github.com) · [GitLab](https://gitlab.com) · [Bitbucket](https://bitbucket.org)

**Outils complémentaires**
- GitHub CLI (`gh`), GitHub Desktop, Husky, `git-filter-repo`, GitKraken / Sourcetree

**Pour aller plus loin**
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)

---

## Conclusion

Ce cours couvre l'intégralité du spectre Git : installation, zones de travail, mécanismes internes, collaboration moderne, techniques de récupération et bonnes pratiques professionnelles, à travers **30 labs pratiques** et plus de 45 exemples guidés.

La maîtrise de Git vient de la **pratique répétée**. Tapez vous-même chaque exemple, faites les 30 labs dans l'ordre, cassez volontairement des choses dans des dépôts de test, et utilisez le reflog comme filet de sécurité pour explorer sans crainte.

Bon courage, et bon code ! 
