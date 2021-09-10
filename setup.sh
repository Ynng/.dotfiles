
OHMYZSH=~/.oh-my-zsh
OHMYZSHBACKUP=~/.oh-my-zsh-bak
if test -d "$OHMYZSH"; then
	echo "$OHMYZSH already exist, backing it up to $OHMYZSHBACKUP"
	mv "$OHMYZSH" "$OHMYZSHBACKUP"
fi
# rm -r /home/wenqi/.oh-my-zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

GITCONFIG=~/.gitconfig
GITCONFIGBACKUP=~/.gitconfig_bak
if test -f "$GITCONFIG"; then
	echo "$GITCONFIG already exist, backing it up to $GITCONFIGBACKUP"
	mv "$GITCONFIG" "$GITCONFIGBACKUP"
fi
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

ZSHRC=~/.zshrc
ZSHRCBACKUP=~/.zshrc_bak
if test -f "$ZSHRC"; then
	echo "$ZSHRC already exist, backing it up to $ZSHRCBACKUP"
	mv "$ZSHRC" "$ZSHRCBACKUP"
fi
ln -s ~/.dotfiles/.zshrc ~/.zshrc

p10k configure

#Git stuff
git config credential.helper store
