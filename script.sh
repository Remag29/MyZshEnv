#! /bin/bash

# Difine colors
LIGHTBLUE='\033[1;34m'
NC='\033[0m' # No Color

echo "${LIGHTBLUE}Starting installation of the environment !${NC}"

# Update the system
sudo apt update -q

# Install the necessary packages
echo "${LIGHTBLUE}Installing the necessary packages${NC}"
sudo apt install -q -y unzip wget curl git

# Install zsh
echo "${LIGHTBLUE}Installing zsh${NC}"
sudo apt install -q -y zsh
echo "Setting zsh as the default shell"
chsh -s $(which zsh)

# Install Oh My Zsh
echo "${LIGHTBLUE}Installing Oh My Zsh${NC}"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install Nerd Fonts Jetbrains Mono
echo "${LIGHTBLUE}Installing Nerd Fonts Jetbrains Mono${NC}"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip -q
sudo unzip JetBrainsMono.zip -d /usr/share/fonts
sudo rm /usr/share/fonts/readme.md
sudo rm /usr/share/fonts/OFL.txt
rm JetBrainsMono.zip
fc-cache -f -v

# Install Starship
echo "${LIGHTBLUE}Installing Starship${NC}"
curl -fsSL -o install.sh https://starship.rs/install.sh
sh install.sh -y
rm install.sh

# Copy Starship configuration file
echo "${LIGHTBLUE}Copying Starship configuration file${NC}"
mkdir -p ~/.config
cp starship.toml ~/.config/starship.toml

# Edit the .zshrc file
echo "${LIGHTBLUE}Editing the .zshrc file${NC}"
echo "eval $(starship init zsh)" >> ~/.zshrc

# Install lsdeluxe
echo "${LIGHTBLUE}Installing lsdeluxe${NC}"
sudo apt install -y lsd

# Install Zsh plugins
echo "${LIGHTBLUE}Installing Zsh plugins${NC}"
# Zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Zsh Bat
git clone https://github.com/fdellwing/zsh-bat ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat

# Edit the .zshrc file
echo "${LIGHTBLUE}Editing the .zshrc file${NC}"
plugins="plugins=(git zsh-autosuggestions zsh-syntax-highlighting sudo docker docker-compose z colored-man-pages)"
sed -i.bak '/^plugins=(/c\'"$plugins" ~/.zshrc

# Copy aliases file
echo "${LIGHTBLUE}Copying aliases file${NC}"
cp .aliases ~/.aliases
echo "" >> ~/.zshrc
echo "# Load aliases" >> ~/.zshrc
echo "source ~/.aliases" >> ~/.zshrc
