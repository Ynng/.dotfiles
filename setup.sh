#!/usr/bin/env bash

echo "Setting up..."

HOMEDIR=$HOME
CURRENTDIR=$(pwd)

# asks if user wants to install software
echo "Do you want to install software? (y/n)"
read -r answer

#####################################
#  _____          _        _ _     
# |_   _|        | |      | | |    
#   | | _ __  ___| |_ __ _| | |___ 
#   | || '_ \/ __| __/ _` | | / __|
#  _| || | | \__ \ || (_| | | \__ \
#  \___/_| |_|___/\__\__,_|_|_|___/
#####################################

# Only do this if we have apt-get and user agrees
if [ -x "$(command -v apt-get)" ] && [ "$answer" == "y" ]; then
    # installs software
    echo "Installing software from pacakges.txt..."
    sudo apt-get update
    xargs sudo apt-get install < $CURRENTDIR/packages.txt
fi

#####################################
#  _   _      _                     
# | | | |    | |                    
# | |_| | ___| |_ __   ___ _ __ ___ 
# |  _  |/ _ \ | '_ \ / _ \ '__/ __|
# | | | |  __/ | |_) |  __/ |  \__ \
# \_| |_/\___|_| .__/ \___|_|  |___/
#              | |                  
#              |_|                  
#####################################

# backs up a file with time stamp
backup() {
    if [ -f $1 ]; then
        echo "$1 already exists, backing up..."
        mv $1 $1.bak.$(date +%s)
    fi
}

# backs up a directory with time stamp
backup_dir() {
    if [ -d $1 ]; then
        echo "$1 already exists, backing up..."
        mv $1 $1.bak.$(date +%s)
    fi
}

# symlinks a file and backs up the original
symlink_and_backup() {
    backup $1
    ln -s $2 $1
    echo "Symlinked $1 to $2"
}

#####################################
#  _     _       _        
# | |   (_)     | |       
# | |    _ _ __ | | _____ 
# | |   | | '_ \| |/ / __|
# | |___| | | | |   <\__ \
# \_____/_|_| |_|_|\_\___/
#####################################

#Git stuff
echo "linking git config..."
symlink_and_backup $HOMEDIR/.gitconfig $CURRENTDIR/.gitconfig

#VIM
echo "linking vimrc..."
symlink_and_backup $HOMEDIR/.vimrc $CURRENTDIR/.vimrc

#P10K
echo "linking p10k.zsh..."
symlink_and_backup $HOMEDIR/.p10k.zsh $CURRENTDIR/.p10k.zsh

#ZSHRC
echo "linking zshrc..."
symlink_and_backup $HOMEDIR/.zshrc $CURRENTDIR/.zshrc

#OHMYZSH
echo "backing up oh-my-zsh directory..."
backup_dir $HOMEDIR/.oh-my-zsh

#####################################
#          _     
#         | |    
#  _______| |__  
# |_  / __| '_ \ 
#  / /\__ \ | | |
# /___|___/_| |_|
#####################################

#Download and installing oh-my-zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
RUNZSH='no' KEEP_ZSHRC='yes' sh install.sh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Downloading themes and plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Setting up p10k
# p10k configure

#####################################
# ___  ____          
# |  \/  (_)         
# | .  . |_ ___  ___ 
# | |\/| | / __|/ __|
# | |  | | \__ \ (__ 
# \_|  |_/_|___/\___|
#####################################

# Installs nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash