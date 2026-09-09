<#
.SYNOPSIS
    Git Trainer - Apprentissage interactif de Git en PowerShell - 
.DESCRIPTION
    Script pédagogique : présente des modules Git, demande à l'utilisateur de taper
    les bonnes commandes, corrige les erreurs, donne des indices/solutions et calcule
    un score par module (sauvegardé entre les sessions).
.NOTES
    Lancer avec : .\git-trainer.ps1
#>

# ============================================================
#  CONFIGURATION & PERSISTANCE
# ============================================================

$ProgressPath = Join-Path $env:USERPROFILE "git-trainer-progress.json"

function Load-Progress {
    if (Test-Path $ProgressPath) {
        try {
            $raw = Get-Content $ProgressPath -Raw | ConvertFrom-Json
            $ht = @{}
            foreach ($p in $raw.PSObject.Properties) {
                $ht[$p.Name] = @{
                    Score   = $p.Value.Score
                    Max     = $p.Value.Max
                    Percent = $p.Value.Percent
                    Date    = $p.Value.Date
                }
            }
            return $ht
        } catch {
            return @{}
        }
    }
    return @{}
}

function Save-Progress($progress) {
    $progress | ConvertTo-Json -Depth 5 | Set-Content -Path $ProgressPath -Encoding UTF8
}

$Global:Progress = Load-Progress

# ============================================================
#  DEFINITION DES MODULES
#  Chaque exercice :
#    Prompt      : consigne affichée
#    Answers     : liste de réponses exactes acceptées (normalisées)
#    Pattern     : (optionnel) regex si la réponse peut varier (ex: message libre)
#    Solution    : réponse de référence affichée en cas de "solution"
#    Hint        : indice affiché en cas de "aide"
#    Explanation : petite explication affichée une fois la bonne réponse trouvée
# ============================================================

$Modules = @(

    @{
        Id = 0
        Name = "Module 0 - Preparer son environnement"
        Theory = "Avant de committer, il faut identifier l'auteur des commits via git config."
        Exercises = @(
            @{
                Prompt = "Affichez la version de Git installee sur la machine."
                Answers = @("git --version")
                Solution = "git --version"
                Hint = "Une seule option, --version"
                Explanation = "git --version confirme que Git est installe et donne son numero de version."
            },
            @{
                Prompt = 'Configurez votre nom global Git avec la valeur "Jean Dupont".'
                Pattern = '^git config --global user\.name ".+"$'
                Solution = 'git config --global user.name "Jean Dupont"'
                Hint = "git config --global user.name suivi du nom entre guillemets"
                Explanation = "Ce parametre est stocke dans ~/.gitconfig et s'applique a tous vos depots."
            },
            @{
                Prompt = "Affichez toute la configuration Git actuellement active."
                Answers = @("git config --list")
                Solution = "git config --list"
                Hint = "Option --list"
                Explanation = "Utile pour verifier que user.name et user.email sont bien definis."
            }
        )
    },

    @{
        Id = 1
        Name = "Module 1 - Comprendre ce qu'est Git"
        Theory = "Git organise le travail en 3 zones : Working Directory, Staging Area, Repository (.git)."
        Exercises = @(
            @{
                Prompt = "Initialisez un nouveau depot Git dans le dossier courant."
                Answers = @("git init")
                Solution = "git init"
                Hint = "Une commande de 2 mots, sans option"
                Explanation = "git init cree le dossier .git qui contient tout l'historique futur."
            },
            @{
                Prompt = "Affichez l'etat actuel du depot (fichiers suivis, modifies, non suivis)."
                Answers = @("git status")
                Solution = "git status"
                Hint = "LA commande la plus utilisee au quotidien"
                Explanation = "git status doit devenir un reflexe avant chaque action Git."
            },
            @{
                Prompt = "Affichez le contenu du fichier .git/HEAD pour voir vers quelle reference il pointe."
                Answers = @("cat .git/HEAD", "Get-Content .git/HEAD", "get-content .git/HEAD")
                Solution = "Get-Content .git/HEAD"
                Hint = "En PowerShell : Get-Content (alias cat)"
                Explanation = "HEAD pointe generalement vers 'ref: refs/heads/main', la branche active."
            }
        )
    },

    @{
        Id = 2
        Name = "Module 2 - Le depot local : init, add, commit"
        Theory = "Cycle de vie d'un fichier : Untracked -> Staged (git add) -> Committed (git commit)."
        Exercises = @(
            @{
                Prompt = "Ajoutez le fichier README.md a la zone de staging (index)."
                Answers = @("git add README.md")
                Solution = "git add README.md"
                Hint = "git add suivi du nom exact du fichier"
                Explanation = "Le fichier passe de Untracked/Modified a Staged."
            },
            @{
                Prompt = "Ajoutez TOUS les fichiers modifies/nouveaux du dossier courant au staging."
                Answers = @("git add .")
                Solution = "git add ."
                Hint = "Le point represente le dossier courant"
                Explanation = "Toujours verifier avec git status avant de committer apres un git add ."
            },
            @{
                Prompt = 'Committez avec le message "Initial commit: ajoute le README".'
                Pattern = '^git commit -m ".+"$'
                Solution = 'git commit -m "Initial commit: ajoute le README"'
                Hint = "git commit -m suivi du message entre guillemets"
                Explanation = "Chaque commit est un instantane identifie par un hash SHA."
            }
        )
    },

    @{
        Id = 3
        Name = "Module 3 - L'historique : log, diff, show"
        Theory = "git log explore la chaine de commits ; git diff compare les versions."
        Exercises = @(
            @{
                Prompt = "Affichez l'historique en une ligne par commit, avec le graphe et toutes les branches."
                Answers = @("git log --oneline --graph --all")
                Solution = "git log --oneline --graph --all"
                Hint = "3 options combinees a git log"
                Explanation = "C'est la commande la plus utile pour visualiser rapidement l'historique."
            },
            @{
                Prompt = "Affichez les differences STAGEES (index vs dernier commit), pas les non-stagees."
                Answers = @("git diff --staged", "git diff --cached")
                Solution = "git diff --staged"
                Hint = "Option --staged (ou --cached)"
                Explanation = "git diff seul montre les differences NON stagees, --staged montre ce qui est pret a committer."
            },
            @{
                Prompt = "Affichez les details complets du commit precedent (2 positions avant HEAD)."
                Answers = @("git show HEAD~2")
                Solution = "git show HEAD~2"
                Hint = "git show suivi de HEAD~2"
                Explanation = "HEAD~N remonte de N commits en suivant les parents directs."
            }
        )
    },

    @{
        Id = 4
        Name = "Module 4 - Branches : creer, naviguer, fusionner"
        Theory = "Une branche est un simple pointeur mobile vers un commit."
        Exercises = @(
            @{
                Prompt = "Creez une branche 'feature-contact' ET basculez dessus, en une seule commande."
                Answers = @("git checkout -b feature-contact", "git switch -c feature-contact")
                Solution = "git switch -c feature-contact"
                Hint = "checkout -b OU switch -c"
                Explanation = "switch -c est l'equivalent moderne (Git 2.23+) de checkout -b."
            },
            @{
                Prompt = "Revenez sur la branche 'main'."
                Answers = @("git checkout main", "git switch main")
                Solution = "git switch main"
                Hint = "switch suivi du nom de branche"
                Explanation = "Le working directory change instantanement pour refleter la branche active."
            },
            @{
                Prompt = "Fusionnez la branche 'feature-footer' dans la branche courante."
                Answers = @("git merge feature-footer")
                Solution = "git merge feature-footer"
                Hint = "git merge suivi du nom de la branche a fusionner"
                Explanation = "Si les branches ont diverge, un commit de merge (2 parents) est cree."
            }
        )
    },

    @{
        Id = 5
        Name = "Module 5 - Les conflits de fusion"
        Theory = "Un conflit survient quand la meme zone d'un fichier a change differemment sur 2 branches."
        Exercises = @(
            @{
                Prompt = "Un conflit est en cours. Annulez completement la fusion pour revenir a l'etat d'avant."
                Answers = @("git merge --abort")
                Solution = "git merge --abort"
                Hint = "Option --abort de git merge"
                Explanation = "C'est le filet de securite : aucune perte, retour exact a l'etat pre-merge."
            },
            @{
                Prompt = "Apres avoir resolu manuellement le conflit dans accueil.txt, marquez-le comme resolu."
                Answers = @("git add accueil.txt")
                Solution = "git add accueil.txt"
                Hint = "git add sur le fichier resolu"
                Explanation = "git add signale a Git que le conflit sur ce fichier est resolu."
            },
            @{
                Prompt = "Finalisez le merge apres resolution de tous les conflits (le message est pre-rempli)."
                Answers = @("git commit")
                Solution = "git commit"
                Hint = "git commit sans -m, l'editeur s'ouvre avec un message pre-rempli"
                Explanation = "Sans -m, Git ouvre l'editeur avec le message de merge par defaut."
            }
        )
    },

    @{
        Id = 6
        Name = "Module 6 - Rebase et historique lineaire"
        Theory = "Rebase rejoue vos commits sur une nouvelle base, au lieu de creer un commit de fusion."
        Exercises = @(
            @{
                Prompt = "Depuis la branche feature-x, rejouez ses commits par-dessus 'main'."
                Answers = @("git rebase main")
                Solution = "git rebase main"
                Hint = "git rebase suivi du nom de la branche cible"
                Explanation = "Regle d'or : ne jamais rebaser une branche deja partagee avec d'autres."
            },
            @{
                Prompt = "Un conflit survient pendant le rebase. Apres l'avoir resolu et fait 'git add', continuez le rebase."
                Answers = @("git rebase --continue")
                Solution = "git rebase --continue"
                Hint = "Option --continue"
                Explanation = "Un rebase peut generer plusieurs conflits successifs, un par commit rejoue."
            },
            @{
                Prompt = "Vous ne voulez plus continuer ce rebase complique : annulez-le completement."
                Answers = @("git rebase --abort")
                Solution = "git rebase --abort"
                Hint = "Option --abort"
                Explanation = "Retour exact a l'etat avant le debut du rebase."
            }
        )
    },

    @{
        Id = 7
        Name = "Module 7 - Depots distants : clone, push, pull, fetch"
        Theory = "fetch telecharge sans toucher au working dir ; pull = fetch + merge (ou rebase)."
        Exercises = @(
            @{
                Prompt = "Telechargez les nouveautes du distant 'origin' SANS fusionner."
                Answers = @("git fetch origin", "git fetch")
                Solution = "git fetch origin"
                Hint = "git fetch, operation 100% sure"
                Explanation = "Met a jour origin/main sans modifier votre branche locale ni votre working dir."
            },
            @{
                Prompt = "Envoyez vos commits locaux ET liez la branche locale 'main' a origin (premier push)."
                Answers = @("git push -u origin main")
                Solution = "git push -u origin main"
                Hint = "Option -u pour lier (upstream)"
                Explanation = "Apres ce premier push avec -u, 'git push' seul suffira ensuite."
            },
            @{
                Prompt = "Recuperez les changements distants ET fusionnez-les automatiquement dans votre branche."
                Answers = @("git pull origin main", "git pull")
                Solution = "git pull origin main"
                Hint = "git pull = fetch + merge en une commande"
                Explanation = "Contrairement a fetch, pull modifie directement votre working directory."
            }
        )
    },

    @{
        Id = 8
        Name = "Module 8 - GitHub : Pull Requests et code review"
        Theory = "Une PR propose d'integrer une branche dans une autre, avec discussion et review avant fusion."
        Exercises = @(
            @{
                Prompt = "Creez une branche 'feature/recette-soupe' ET basculez dessus."
                Answers = @("git checkout -b feature/recette-soupe", "git switch -c feature/recette-soupe")
                Solution = "git switch -c feature/recette-soupe"
                Hint = "switch -c ou checkout -b"
                Explanation = "Convention courante : prefixer les branches de fonctionnalite par feature/."
            },
            @{
                Prompt = "Poussez cette branche pour la premiere fois en la liant au distant."
                Answers = @("git push -u origin feature/recette-soupe")
                Solution = "git push -u origin feature/recette-soupe"
                Hint = "git push -u origin <nom-de-branche>"
                Explanation = "Cela rend la branche visible sur GitHub pour y ouvrir une Pull Request."
            },
            @{
                Prompt = "Une fois la PR mergee et supprimee sur GitHub, supprimez la branche locale correspondante."
                Answers = @("git branch -d feature/recette-soupe")
                Solution = "git branch -d feature/recette-soupe"
                Hint = "git branch -d (suppression sure)"
                Explanation = "-d refuse de supprimer une branche non fusionnee ; -D forcerait la suppression."
            }
        )
    },

    @{
        Id = 9
        Name = "Module 9 - Workflows d'equipe"
        Theory = "GitHub Flow : une branche main toujours stable, des branches courtes par fonctionnalite."
        Exercises = @(
            @{
                Prompt = "Avant de fusionner votre branche, mettez-la a jour avec les derniers changements de origin/main (via merge)."
                Answers = @("git merge origin/main")
                Solution = "git merge origin/main"
                Hint = "git merge origin/main depuis votre branche de feature"
                Explanation = "Cela evite les conflits tardifs au moment de la fusion finale."
            },
            @{
                Prompt = "Listez toutes les branches locales ET distantes connues."
                Answers = @("git branch -a")
                Solution = "git branch -a"
                Hint = "Option -a"
                Explanation = "Utile pour verifier l'etat global du depot avant de choisir un workflow."
            },
            @{
                Prompt = "Supprimez la branche distante 'feature/recette-tarte-citron' sur origin."
                Answers = @("git push origin --delete feature/recette-tarte-citron")
                Solution = "git push origin --delete feature/recette-tarte-citron"
                Hint = "git push origin --delete <branche>"
                Explanation = "GitHub propose souvent ce nettoyage automatiquement apres le merge d'une PR."
            }
        )
    },

    @{
        Id = 10
        Name = "Module 10 - Annuler et corriger : reset, revert, restore"
        Theory = "restore corrige des fichiers ; reset deplace la branche (reecrit l'historique local) ; revert cree un commit d'annulation (sur sans reecriture)."
        Exercises = @(
            @{
                Prompt = "Annulez les modifications NON stagees d'un fichier nomme fichier.txt."
                Answers = @("git restore fichier.txt")
                Solution = "git restore fichier.txt"
                Hint = "git restore suivi du nom de fichier"
                Explanation = "Le fichier revient exactement a l'etat du dernier commit."
            },
            @{
                Prompt = "Annulez le dernier commit en gardant tous les changements STAGES (mode soft)."
                Answers = @("git reset --soft HEAD~1")
                Solution = "git reset --soft HEAD~1"
                Hint = "reset --soft HEAD~1"
                Explanation = "Le commit disparait de l'historique mais rien n'est perdu, tout reste stage."
            },
            @{
                Prompt = "Annulez un commit deja pousse et partage (hash abc123) SANS reecrire l'historique."
                Answers = @("git revert abc123")
                Solution = "git revert abc123"
                Hint = "git revert suivi du hash"
                Explanation = "revert cree un nouveau commit qui annule les changements, sans jamais reecrire l'existant."
            }
        )
    },

    @{
        Id = 11
        Name = "Module 11 - Stash et travail temporaire"
        Theory = "git stash met de cote les modifications non commitees pour retrouver un working dir propre."
        Exercises = @(
            @{
                Prompt = 'Mettez de cote votre travail en cours avec le message "WIP: travail en cours".'
                Pattern = '^git stash (save )?".+"$'
                Solution = 'git stash save "WIP: travail en cours"'
                Hint = "git stash save suivi d'un message entre guillemets"
                Explanation = "Le working directory redevient propre, comme juste apres le dernier commit."
            },
            @{
                Prompt = "Listez tous les stash actuellement en attente."
                Answers = @("git stash list")
                Solution = "git stash list"
                Hint = "git stash list"
                Explanation = "Chaque stash est identifie par stash@{0}, stash@{1}, etc."
            },
            @{
                Prompt = "Reappliquez le dernier stash ET retirez-le de la pile."
                Answers = @("git stash pop")
                Solution = "git stash pop"
                Hint = "git stash pop (par opposition a apply, qui garde le stash)"
                Explanation = "apply garde le stash dans la pile, pop le retire apres application."
            }
        )
    },

    @{
        Id = 12
        Name = "Module 12 - Tags et versions"
        Theory = "Un tag est un pointeur immuable, souvent utilise pour marquer une version livree (SemVer)."
        Exercises = @(
            @{
                Prompt = 'Creez un tag ANNOTE "v1.0.0" avec le message "Premiere version stable".'
                Pattern = '^git tag -a v1\.0\.0 -m ".+"$'
                Solution = 'git tag -a v1.0.0 -m "Premiere version stable"'
                Hint = "git tag -a <nom> -m <message>"
                Explanation = "Un tag annote contient auteur, date et message ; un tag leger non."
            },
            @{
                Prompt = "Affichez les details complets du tag v1.0.0."
                Answers = @("git show v1.0.0")
                Solution = "git show v1.0.0"
                Hint = "git show suivi du nom du tag"
                Explanation = "Utile pour verifier le message et le commit exact vise par le tag."
            },
            @{
                Prompt = "Poussez TOUS vos tags locaux vers le distant origin."
                Answers = @("git push origin --tags")
                Solution = "git push origin --tags"
                Hint = "Option --tags"
                Explanation = "Par defaut, git push ne pousse jamais les tags : il faut le faire explicitement."
            }
        )
    }
)

# ============================================================
#  THEME & COMPOSANTS D'INTERFACE
# ============================================================

$Theme = @{
    Title   = "Cyan"
    Border  = "DarkCyan"
    Text    = "White"
    Muted   = "DarkGray"
    Success = "Green"
    Warning = "Yellow"
    Error   = "Red"
    Accent  = "Magenta"
    Prompt  = "Green"
}

function Get-ConsoleWidth {
    try {
        $w = $Host.UI.RawUI.WindowSize.Width
        if ($w -lt 60) { return 78 }
        return [Math]::Min($w - 1, 100)
    } catch {
        return 78
    }
}

function Write-Divider {
    param([string]$Char = '-', [string]$Color = $Theme.Border)
    Write-Host ($Char * (Get-ConsoleWidth)) -ForegroundColor $Color
}

function Write-Centered {
    param([string]$Text, [string]$Color = $Theme.Title)
    $w = Get-ConsoleWidth
    $pad = [Math]::Max(0, [Math]::Floor(($w - $Text.Length) / 2))
    Write-Host ((" " * $pad) + $Text) -ForegroundColor $Color
}

function Get-ProgressBar {
    param([int]$Percent, [int]$Width = 22)
    if ($Percent -lt 0) { $Percent = 0 }
    if ($Percent -gt 100) { $Percent = 100 }
    $filled = [Math]::Round($Width * ($Percent / 100))
    $empty  = $Width - $filled
    return ("#" * $filled) + ("." * $empty)
}

function Get-ScoreColor {
    param([int]$Percent)
    if ($Percent -ge 80) { return $Theme.Success }
    elseif ($Percent -ge 50) { return $Theme.Warning }
    else { return $Theme.Error }
}

function Show-Banner {
    Write-Divider -Char '=' -Color $Theme.Border
    Write-Host ""
    Write-Centered -Text "G I T   T R A I N E R" -Color $Theme.Title
    Write-Centered -Text "Apprentissage interactif de Git en PowerShell" -Color $Theme.Muted
    Write-Host ""
    Write-Divider -Char '=' -Color $Theme.Border
}

# ============================================================
#  MOTEUR DU QUIZ
# ============================================================

function Test-Answer {
    param($UserInput, $Exercise)
    $normalized = ($UserInput.Trim() -replace '\s+', ' ')
    if ($Exercise.Pattern) {
        return $normalized -imatch $Exercise.Pattern
    } else {
        foreach ($a in $Exercise.Answers) {
            $an = ($a.Trim() -replace '\s+', ' ')
            if ($normalized -ieq $an) { return $true }
        }
        return $false
    }
}

function Invoke-Exercise {
    param($Exercise, [int]$Index, [int]$Total)

    $miniBar = Get-ProgressBar -Percent ([Math]::Round(100 * $Index / $Total)) -Width 16

    Write-Host ""
    Write-Divider -Char '-' -Color $Theme.Muted
    Write-Host ("  Exercice $Index/$Total   [$miniBar]") -ForegroundColor $Theme.Border
    Write-Host ""
    Write-Host ("  " + $Exercise.Prompt) -ForegroundColor $Theme.Text
    Write-Host ""
    Write-Host "  aide = indice   |   solution = reponse + explication   |   passer = exercice suivant" -ForegroundColor $Theme.Muted
    Write-Host ""

    $hintUsed = $false

    while ($true) {
        Write-Host -NoNewline "  > " -ForegroundColor $Theme.Prompt
        $userInput = Read-Host

        switch ($userInput.Trim().ToLower()) {
            'aide' {
                Write-Host ("  > Indice : " + $Exercise.Hint) -ForegroundColor $Theme.Warning
                $hintUsed = $true
                continue
            }
            'solution' {
                Write-Host ("  > Reponse attendue : " + $Exercise.Solution) -ForegroundColor $Theme.Accent
                if ($Exercise.Explanation) { Write-Host ("    " + $Exercise.Explanation) -ForegroundColor $Theme.Muted }
                return 2
            }
            'passer' {
                Write-Host "  > Exercice passe." -ForegroundColor $Theme.Warning
                return 0
            }
            default {
                if (Test-Answer -UserInput $userInput -Exercise $Exercise) {
                    Write-Host "  > Correct !" -ForegroundColor $Theme.Success
                    if ($Exercise.Explanation) { Write-Host ("    " + $Exercise.Explanation) -ForegroundColor $Theme.Muted }
                    if ($hintUsed) { return 6 } else { return 10 }
                } else {
                    Write-Host "  > Incorrect. Reessayez, ou tapez 'aide' / 'solution' / 'passer'." -ForegroundColor $Theme.Error
                }
            }
        }
    }
}

function Show-ModuleHeader {
    param($Module)
    Clear-Host
    Write-Divider -Char '=' -Color $Theme.Title
    Write-Host ("  " + $Module.Name) -ForegroundColor $Theme.Title
    Write-Divider -Char '=' -Color $Theme.Title
    if ($Module.Theory) {
        Write-Host ""
        Write-Host ("  " + $Module.Theory) -ForegroundColor $Theme.Muted
    }
}

function Run-Module {
    param($Module)

    Show-ModuleHeader -Module $Module

    $total = $Module.Exercises.Count
    $score = 0
    $maxScore = $total * 10
    $i = 0

    foreach ($ex in $Module.Exercises) {
        $i++
        $score += Invoke-Exercise -Exercise $ex -Index $i -Total $total
    }

    $percent = [Math]::Round(($score / $maxScore) * 100)
    $color = Get-ScoreColor -Percent $percent
    $bar = Get-ProgressBar -Percent $percent -Width 30

    Write-Host ""
    Write-Divider -Char '=' -Color $Theme.Title
    Write-Host "  RESULTAT DU MODULE" -ForegroundColor $Theme.Title
    Write-Divider -Char '=' -Color $Theme.Title
    Write-Host ""
    Write-Host ("  Score  : $score / $maxScore points") -ForegroundColor $color
    Write-Host ("  [$bar] $percent%") -ForegroundColor $color
    Write-Host ""

    if ($percent -ge 80) {
        Write-Host "  >> Excellent travail !" -ForegroundColor $Theme.Success
    } elseif ($percent -ge 50) {
        Write-Host "  >> Pas mal, revisez les points manques." -ForegroundColor $Theme.Warning
    } else {
        Write-Host "  >> Ce module merite d'etre refait." -ForegroundColor $Theme.Error
    }

    $key = "Module$($Module.Id)"
    $Global:Progress[$key] = @{
        Score   = $score
        Max     = $maxScore
        Percent = $percent
        Date    = (Get-Date).ToString("yyyy-MM-dd HH:mm")
    }
    Save-Progress $Global:Progress

    Write-Host ""
    Write-Divider -Char '-' -Color $Theme.Muted
    Read-Host "  Appuyez sur Entree pour revenir au menu"
}

function Show-ModuleRow {
    param([int]$Number, $Module)

    $key = "Module$($Module.Id)"
    $label = "{0,2}." -f $Number
    $name  = $Module.Name

    Write-Host ("   $label ") -ForegroundColor $Theme.Border -NoNewline
    Write-Host ("{0,-46}" -f $name) -ForegroundColor $Theme.Text -NoNewline

    if ($Global:Progress.ContainsKey($key)) {
        $p = $Global:Progress[$key]
        $color = Get-ScoreColor -Percent $p.Percent
        $bar = Get-ProgressBar -Percent $p.Percent -Width 18
        Write-Host (" [$bar] ") -ForegroundColor $color -NoNewline
        Write-Host ("{0,3}%" -f $p.Percent) -ForegroundColor $color
    } else {
        Write-Host (" [{0}] " -f ('.' * 18)) -ForegroundColor $Theme.Muted -NoNewline
        Write-Host ("  --") -ForegroundColor $Theme.Muted
    }
}

function Show-MainMenu {
    while ($true) {
        Clear-Host
        Show-Banner
        Write-Host ""
        Write-Host "   MODULES" -ForegroundColor $Theme.Border
        Write-Divider -Char '-' -Color $Theme.Muted

        for ($n = 0; $n -lt $Modules.Count; $n++) {
            Show-ModuleRow -Number ($n + 1) -Module $Modules[$n]
        }

        Write-Divider -Char '-' -Color $Theme.Muted
        Write-Host ""
        Write-Host "   [S] Score global      [R] Reinitialiser      [Q] Quitter" -ForegroundColor $Theme.Border
        Write-Host ""
        Write-Host -NoNewline "   Votre choix > " -ForegroundColor $Theme.Prompt
        $choice = Read-Host

        switch -Regex ($choice.Trim().ToUpper()) {
            '^Q$' { Save-Progress $Global:Progress; return }
            '^S$' { Show-GlobalScore }
            '^R$' { Reset-Progress }
            '^\d+$' {
                $idx = [int]$choice - 1
                if ($idx -ge 0 -and $idx -lt $Modules.Count) {
                    Run-Module -Module $Modules[$idx]
                } else {
                    Write-Host "   Numero de module invalide." -ForegroundColor $Theme.Error
                    Start-Sleep -Seconds 1
                }
            }
            default {
                Write-Host "   Choix non reconnu." -ForegroundColor $Theme.Error
                Start-Sleep -Seconds 1
            }
        }
    }
}

function Show-GlobalScore {
    Clear-Host
    Write-Divider -Char '=' -Color $Theme.Title
    Write-Centered -Text "SCORE GLOBAL" -Color $Theme.Title
    Write-Divider -Char '=' -Color $Theme.Title
    Write-Host ""

    $totalScore = 0
    $totalMax = 0
    for ($n = 0; $n -lt $Modules.Count; $n++) {
        $m = $Modules[$n]
        $key = "Module$($m.Id)"
        Show-ModuleRow -Number ($n + 1) -Module $m
        if ($Global:Progress.ContainsKey($key)) {
            $totalScore += $Global:Progress[$key].Score
            $totalMax   += $Global:Progress[$key].Max
        }
    }

    Write-Host ""
    Write-Divider -Char '-' -Color $Theme.Muted

    if ($totalMax -gt 0) {
        $globalPercent = [Math]::Round(($totalScore / $totalMax) * 100)
        $color = Get-ScoreColor -Percent $globalPercent
        $bar = Get-ProgressBar -Percent $globalPercent -Width 30
        Write-Host ""
        Write-Host ("   TOTAL : $totalScore / $totalMax points") -ForegroundColor $color
        Write-Host ("   [$bar] $globalPercent%") -ForegroundColor $color
    } else {
        Write-Host ""
        Write-Host "   Aucun module termine pour l'instant." -ForegroundColor $Theme.Muted
    }

    Write-Host ""
    Write-Divider -Char '-' -Color $Theme.Muted
    Read-Host "  Appuyez sur Entree pour revenir au menu"
}

function Reset-Progress {
    Write-Host ""
    Write-Host -NoNewline "   Confirmer la reinitialisation de TOUTE la progression ? (oui/non) > " -ForegroundColor $Theme.Warning
    $confirm = Read-Host
    if ($confirm.Trim().ToLower() -eq "oui") {
        $Global:Progress = @{}
        Save-Progress $Global:Progress
        Write-Host "   Progression reinitialisee." -ForegroundColor $Theme.Success
    } else {
        Write-Host "   Annule." -ForegroundColor $Theme.Muted
    }
    Start-Sleep -Seconds 1
}

# ============================================================
#  POINT D'ENTREE
# ============================================================

Show-MainMenu
Write-Host ""
Write-Divider -Char '=' -Color $Theme.Border
Write-Centered -Text "A bientot !" -Color $Theme.Title
Write-Centered -Text "Progression sauvegardee dans : $ProgressPath" -Color $Theme.Muted
Write-Divider -Char '=' -Color $Theme.Border
Write-Host ""