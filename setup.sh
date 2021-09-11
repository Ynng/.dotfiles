#Git stuff
GITCONFIG=~/.gitconfig
GITCONFIGBACKUP=~/.gitconfig_bak
if test -f "$GITCONFIG"; then
	echo "$GITCONFIG already exist, backing it up to $GITCONFIGBACKUP"
	mv "$GITCONFIG" "$GITCONFIGBACKUP"
fi
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
git config credential.helper store

#P10K
P10K=~/.p10k.zsh
P10KBACKUP=~/.p10k.zsh-bak
if test -f "$P10K"; then
	echo "$P10K already exist, backing it up to $P10KBACKUP"
	mv "$P10K" "$P10KBACKUP"
fi
ln -s ~/.dotfiles/.p10k.zsh ~/.p10k.zsh

#ZSHRC
ZSHRC=~/.zshrc
ZSHRCBACKUP=~/.zshrc_bak
if test -f "$ZSHRC"; then
	echo "$ZSHRC already exist, backing it up to $ZSHRCBACKUP"
	mv "$ZSHRC" "$ZSHRCBACKUP"
fi
ln -s ~/.dotfiles/.zshrc ~/.zshrc

#OHMYZSH
OHMYZSH=~/.oh-my-zsh
OHMYZSHBACKUP=~/.oh-my-zsh-bak
if test -d "$OHMYZSH"; then
	echo "$OHMYZSH already exist, backing it up to $OHMYZSHBACKUP"
	mv "$OHMYZSH" "$OHMYZSHBACKUP"
fi
# rm -r /home/wenqi/.oh-my-zsh

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

