# dotfiles

## Requirements

### Ubuntu

```console
sudo apt install build-essential git tmux zsh powerline
```

### Oh My Zsh

```console
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### fzf

```console
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```

* `Ctrl+T` to search for files
* `Ctrl+R` to search for commands in a history

#### Vim

```
mkdir -p .vim/bundles
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundles
```

Open vim and install dein

```
:call dein#install()
```

#### Neovim

```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.config/nvim/bundles
```

#### Powerline

http://powerline.readthedocs.io/en/latest/installation/linux.html?highlight=fonts#fonts-installation

```
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
```

Restarting X for the changes to take effect.

## Additional Packages:

* [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [dein.vim](https://github.com/Shougo/dein.vim)

### Other

#### Visual Studio Code

`~/.config/Code/User/settings.json`
