#! /bin/bash

echo "Starting installation of the environment !"

# Update the system
sudo apt update -q

# Install the necessary packages
echo "Installing the necessary packages"
sudo apt install -q -y unzip wget curl git

# Install zsh
echo "Installing zsh"
sudo apt install -q -y zsh
echo "Setting zsh as the default shell"
chsh -s $(which zsh)

# Install Oh My Zsh
echo "Installing Oh My Zsh"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install Nerd Fonts Jetbrains Mono
echo "Installing Nerd Fonts Jetbrains Mono"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip -q
sudo unzip JetBrainsMono.zip -d /usr/share/fonts
sudo rm /usr/share/fonts/readme.md
sudo rm /usr/share/fonts/OFL.txt
rm JetBrainsMono.zip
fc-cache -f -v

# Install Starship
echo "Installing Starship"
curl -fsSL -o install.sh https://starship.rs/install.sh
sh install.sh -y

# Copy Starship configuration file
echo "Copying Starship configuration file"
mkdir -p ~/.config
cp starship.toml ~/.config/starship.toml

# Edit the .zshrc file
echo "Editing the .zshrc file"
echo "eval $(starship init zsh)" >> ~/.zshrc

# Install lsdeluxe
echo "Installing lsdeluxe"
sudo apt install -y lsd

# Install Zsh plugins
echo "Installing Zsh plugins"
# Zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Zsh Bat
git clone https://github.com/fdellwing/zsh-bat ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat

# Edit the .zshrc file
echo "Editing the .zshrc file"
plugins="plugins=(git zsh-autosuggestions zsh-syntax-highlighting sudo docker docker-compose z colored-man-pages)"
sed -i.bak '/^plugins=(/c\'"$plugins" ~/.zshrc

# Copy aliases file
echo "Copying aliases file"
cp .aliases ~/.aliases
echo "" >> ~/.zshrc
echo "# Load aliases" >> ~/.zshrc
echo "source ~/.aliases" >> ~/.zshrc
