#! /bin/bash

# Verion : 1.1.0

###################################################################################################
# ENV #############################################################################################
###################################################################################################
LIGHTBLUE='\e[1;34m'    # Light Blue Bold
GREEN='\e[1;32m'        # Green Bold
GRAY='\e[3;90m'         # Gray Italic
NC='\e[0m'              # No Color

###################################################################################################
# FUNCTIONS #######################################################################################
###################################################################################################
# Function to print titles
print_title() {
    echo -e "\n${LIGHTBLUE}$1${NC}\n"
}

# Function to print commands
print_command() {
    echo -e "+ ${GRAY}$1${NC}\n"
}

# Function to print validation
print_validation() {
    echo -e "${GREEN}$1${NC}\n\n"
}

###################################################################################################
# SCRIPT ##########################################################################################
###################################################################################################
print_title "Setting up the terminal"

# Update the system ###############################################################################
print_title "Updating the system"
print_command "sudo apt update -qq"
sudo apt update -qq
print_validation "System updated!"

# Install dependencies ############################################################################
print_title "Installing dependencies"
print_command "sudo apt install -q -y unzip wget curl git"
sudo apt install -q -y unzip wget curl git
print_validation "Dependencies installed!"

# Install zsh #####################################################################################
print_title "Installing zsh"
print_command "sudo apt install -q -y zsh"
sudo apt install -q -y zsh
print_command "chsh -s \$(which zsh)"
chsh -s $(which zsh)
print_validation "Zsh installed and set as default shell!"

# Install Oh My Zsh ###############################################################################
print_title "Installing Oh My Zsh"
print_command "sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\" \"\" --unattended"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
print_validation "OhMyZsh installed!"

# Install Nerd Fonts Jetbrains Mono
print_title "Installing Nerd Fonts Jetbrains Mono"
print_command "curl -fsSL -o /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"
curl -fsSL -o /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
print_command "sudo unzip -q /tmp/JetBrainsMono.zip -d /usr/share/fonts"
sudo unzip -q /tmp/JetBrainsMono.zip -d /usr/share/fonts
print_command "sudo rm /usr/share/fonts/README.md"
sudo rm /usr/share/fonts/README.md
print_command "sudo rm /usr/share/fonts/OFL.txt"
sudo rm /usr/share/fonts/OFL.txt
print_command "rm /tmp/JetBrainsMono.zip"
rm /tmp/JetBrainsMono.zip
print_command "fc-cache -f -v"
fc-cache -f -v
print_validation "Font JetBrainsMono installed!"

# Install Starship ################################################################################
print_title "Installing Starship"
print_command "curl -fsSL -o /tmp/install.sh https://starship.rs/install.sh"
curl -fsSL -o /tmp/install.sh https://starship.rs/install.sh
print_command "sh install.sh -y"
sh /tmp/install.sh -y
print_command "rm install.sh"
rm /tmp/install.sh
print_validation "Starship installed! (not config yet)"

# Install usefull tools from apt
print_title "Installing usefull tools from apt"
print_command "sudo apt install -y bat btop lazygit lsd ncdu neofetch yazi zoxide"
sudo apt install -y \
    bat \
    btop \
    lsd \
    ncdu \
    neofetch \
    tmux \
    zoxide
print_validation "Usefull tools installed! (from apt)"

# Install usefull tools from github ###############################################################
print_title "Installing usefull tools from github"

# Fzf
print_command "git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
print_command "~/.fzf/install --all"
~/.fzf/install --all
print_validation "FZF installed! (from git)"

# Lazygit
print_command "LAZYGIT_VERSION=\$(curl -s \"https://api.github.com/repos/jesseduffield/lazygit/releases/latest\" | grep -Po '\"tag_name\": *\"v\\K[^\"]*')"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
print_command "curl -Lo /tmp/lazygit.tar.gz \"https://github.com/jesseduffield/lazygit/releases/download/v\${LAZYGIT_VERSION}/lazygit_\${LAZYGIT_VERSION}_Linux_x86_64.tar.gz\""
curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
print_command "tar -xf /tmp/lazygit.tar.gz -C /tmp lazygit"
tar -xf /tmp/lazygit.tar.gz -C /tmp lazygit
print_command "sudo install /tmp/lazygit -D -t /usr/local/bin/"
sudo install /tmp/lazygit -D -t /usr/local/bin/
print_command "rm /tmp/lazygit /tmp/lazygit.tar.gz"
rm /tmp/lazygit /tmp/lazygit.tar.gz
print_validation "Lazygit installed! (from git)"

# Install Zsh plugins #############################################################################
print_title "Installing Zsh plugins"

# Zsh-autosuggestions
print_command "git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Zsh-syntax-highlighting
print_command "git clone https://github.com/zsh-users/zsh-syntax-highlighting \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Zsh Bat
print_command "git clone https://github.com/fdellwing/zsh-bat \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat"
git clone https://github.com/fdellwing/zsh-bat ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat

# YouShouldUse
print_command "git clone https://github.com/MichaelAquilina/zsh-you-should-use.git \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

print_validation "Zsh plugins installed! (from git)"

# Get personnal Dotfile repo ######################################################################
print_title "Get configuration from dotfile repo"
git clone https://github.com/Remag29/dotfiles.git $HOME/dotfiles
bash $HOME/dotfiles/scripts/symlink/symlink.sh --backup
print_validation "Dotfiles imported!"

###################################################################################################
# END #############################################################################################
###################################################################################################
print_validation "Finished setting up the terminal!"
print_validation "Please restart your terminal to apply the changes."
 