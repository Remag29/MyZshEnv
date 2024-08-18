# MyZshEnv

Configure automatiquement mon environnement Linux.

## Installation Script

Ce script installe et configure un environnement de développement avec les outils nécessaires.

### Contenu du script

Le script effectue les actions suivantes :

1. Met à jour le système.
2. Installe les paquets nécessaires : `unzip`, `wget`, `curl`, `git`.
3. Installe `zsh` et le configure comme shell par défaut.
4. Installe Oh My Zsh.
5. Installe les polices Nerd Fonts JetBrains Mono.
6. Installe Starship.
7. Copie le fichier de configuration de Starship.

### Prérequis

- Un système basé sur Debian (par exemple, Ubuntu).
- Les privilèges sudo.

### Utilisation

1. Clonez le dépôt ou téléchargez le script.

    ```bash
    git clone https://github.com/Remag29/MyZshEnv.git
    cd MyZshEnv
    ```

2. Rendez le script exécutable.

    ```bash
    chmod +x script.sh
    ```

3. Exécutez le script.

    ```bash
    ./script.sh
    ```
