#! /bin/bash

# Difine colors
LIGHTBLUE='\033[1;34m'
NC='\033[0m' # No Color

# Function to print titles
print_title() {
    echo "\n\n${LIGHTBLUE}$1${NC}"
}

print_title "Setting up the terminal"

# Update the system
print_title "Updating the system"
sudo apt update -qq

# Install the necessary packages
print_title "Installing the necessary packages"
sudo apt install -q -y unzip wget curl git

# Install zsh
print_title "Installing zsh"
sudo apt install -q -y zsh
chsh -s $(which zsh)

# Install Oh My Zsh
print_title "Installing Oh My Zsh"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install Nerd Fonts Jetbrains Mono
print_title "Installing Nerd Fonts Jetbrains Mono"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip -q
sudo unzip -q JetBrainsMono.zip -d /usr/share/fonts
sudo rm /usr/share/fonts/README.md
sudo rm /usr/share/fonts/OFL.txt
rm JetBrainsMono.zip
fc-cache -f -v

# Install Starship
print_title "Installing Starship"
curl -fsSL -o install.sh https://starship.rs/install.sh
sh install.sh -y
rm install.sh

# Copy Starship configuration file
mkdir -p ~/.config
cp starship.toml ~/.config/starship.toml

# Edit the .zshrc file
print_title "Editing the .zshrc file"
echo "eval $(starship init zsh)" >> ~/.zshrc

# Install lsdeluxe
print_title "Installing lsdeluxe"
sudo apt install -y lsd

# Install batcat
print_title "Installing batcat"
sudo apt install -y bat

# Install ncdu
print_title "Installing ncdu"
sudo apt install -y ncdu

# Install Zsh plugins
print_title "Installing Zsh plugins"
# Zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Zsh Bat
git clone https://github.com/fdellwing/zsh-bat ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat

# Edit the .zshrc file
print_title "Editing the .zshrc file"
plugins="plugins=(git zsh-autosuggestions zsh-syntax-highlighting sudo docker docker-compose z colored-man-pages zsh-bat)"
sed -i.bak '/^plugins=(/c\'"$plugins" ~/.zshrc

# Copy aliases file
print_title "Copying aliases file"
cp .aliases ~/.aliases
echo "" >> ~/.zshrc
echo "# Load aliases" >> ~/.zshrc
echo "source ~/.aliases" >> ~/.zshrc

# Usefull apps
print_title "Installing usefull apps"
sudo apt install -y btop neofetch zoxide

# END
print_title "Finished setting up the terminal"
 