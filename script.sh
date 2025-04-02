#! /bin/bash

###################################################################################################
# ENV #############################################################################################
#################################################################################################### Difine colors
LIGHTBLUE='\e[1;34m'    # Light Blue Bold
GREEN='\e[1;32m'        # Green Bold
GRAY='\e[3;90m'         # Gray Italic
NC='\e[0m'              # No Color

###################################################################################################
# FUNCTIONS #######################################################################################
###################################################################################################
# Function to print titles
print_title() {
    echo "\n${LIGHTBLUE}$1${NC}\n"
}

# Function to print commands
print_command() {
    echo "+ ${GRAY}$1${NC}\n"
}

# Function to print validation
print_validation() {
    echo "${GREEN}$1${NC}\n\n"
}

###################################################################################################
# SCRIPT ##########################################################################################
###################################################################################################
print_title "Setting up the terminal"

# Update the system ###############################################################################
print_title "Updating the system"
print_command "sudo apt update -qq"
sudo apt update -qq
print_validation "Done"

# Install dependencies ############################################################################
print_title "Installing dependencies"
print_command "sudo apt install -q -y unzip wget curl git"
sudo apt install -q -y unzip wget curl git
print_validation "Done"

# Install zsh #####################################################################################
print_title "Installing zsh"
print_command "sudo apt install -q -y zsh"
sudo apt install -q -y zsh
print_command "chsh -s $(which zsh)"
chsh -s $(which zsh)
print_validation "Done"

# Install Oh My Zsh ###############################################################################
print_title "Installing Oh My Zsh"
print_command "sh -c \"\$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)\""
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
print_validation "Done"

# Install Nerd Fonts Jetbrains Mono
print_title "Installing Nerd Fonts Jetbrains Mono"
print_command "wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip -q"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip -q
print_command "sudo unzip -q JetBrainsMono.zip -d /usr/share/fonts"
sudo unzip -q JetBrainsMono.zip -d /usr/share/fonts
print_command "sudo rm /usr/share/fonts/README.md"
sudo rm /usr/share/fonts/README.md
print_command "sudo rm /usr/share/fonts/OFL.txt"
sudo rm /usr/share/fonts/OFL.txt
print_command "rm JetBrainsMono.zip"
rm JetBrainsMono.zip
print_command "fc-cache -f -v"
fc-cache -f -v
print_validation "Done"

# Install Starship ################################################################################
print_title "Installing Starship"
print_command "curl -fsSL -o install.sh https://starship.rs/install.sh"
curl -fsSL -o install.sh https://starship.rs/install.sh
print_command "sh install.sh -y"
sh install.sh -y
print_command "rm install.sh"
rm install.sh
print_validation "Done"

# Copy Starship configuration file
# TODO: Adapt with dotfiles repo
print_title "Setting up Starship configuration file"
print_command "mkdir -p ~/.config"
mkdir -p ~/.config
print_command "cp starship.toml ~/.config/starship.toml"
cp starship.toml ~/.config/starship.toml
print_command "echo \"eval \$(starship init zsh)\" >> ~/.zshrc"
echo "eval \$(starship init zsh)" >> ~/.zshrc
print_validation "Done"

# Install usefull tools from apt
print_title "Installing usefull tools from apt"
print_command "sudo apt install -y bat btop lazygit lsd ncdu neofetch yazi zoxide"
sudo apt install -y \
    bat \
    btop \
    lazygit \
    lsd \
    ncdu \
    neofetch \
    yazi \
    zoxide
print_validation "Done"

# Install usefull tools from github ###############################################################
print_title "Installing usefull tools from github"
# Fzf
print_command "git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
print_command "~/.fzf/install --all"
~/.fzf/install --all
print_validation "Done"

# Install Zsh plugins #############################################################################
print_title "Installing Zsh plugins"
# Zsh-autosuggestions
print_command "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Zsh-syntax-highlighting
print_command "git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Zsh Bat
print_command "git clone https://github.com/fdellwing/zsh-bat ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat"
git clone https://github.com/fdellwing/zsh-bat ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat

# Edit the .zshrc file
# TODO: Adapt with dotfiles repo
print_title "Editing the .zshrc file"
plugins="plugins=(git zsh-autosuggestions zsh-syntax-highlighting sudo docker docker-compose z colored-man-pages zsh-bat)"
sed -i.bak '/^plugins=(/c\'"$plugins" ~/.zshrc
print_validation "Done"

# Copy aliases file
# TODO: Adapt with dotfiles repo
print_title "Copying aliases file"
cp .aliases ~/.aliases
echo "" >> ~/.zshrc
echo "# Load aliases" >> ~/.zshrc
echo "source ~/.aliases" >> ~/.zshrc
print_validation "Done"

###################################################################################################
# END ###############################################################################################
###################################################################################################
print_validation "Finished setting up the terminal ! \n\n"
print_validation "Please restart your terminal to apply the changes."
 