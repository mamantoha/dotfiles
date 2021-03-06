# dotfiles

## Requirements

### Ubuntu

```console
sudo apt install build-essential git tmux zsh powerline vim-gtk3 silversearcher-ag
chsh -s $(which zsh)
```

### macOS

```console
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install tmux anyenv python the_silver_searcher
pip3 install --user powerline-status
```

### Oh My Zsh

```console
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### Dracula theme

```
git clone https://github.com/dracula/zsh.git
cp zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/
cp -r zsh/lib ~/.oh-my-zsh/themes/
```

### fzf

```console
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```

* `Ctrl+T` to search for files
* `Ctrl+R` to search for commands in a history

#### tmux

```console
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

* `prefix` + `r` - reload config
* `prefix` + `I` - install plugins
* `prefix` + `U` - update plugins

#### Vim

```
mkdir -p ~/.vim/bundles
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundles
```

#### Neovim

```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.config/nvim/bundles
```

#### Fonts

```
echo -e "\e[1mbold\e[0m"
echo -e "\e[3mitalic\e[0m"
echo -e "\e[4munderline\e[0m"
echo -e "\e[9mstrikethrough\e[0m"
```

## Additional Packages:

* [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [dein.vim](https://github.com/Shougo/dein.vim)
