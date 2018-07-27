# dotfiles

## Requirements

### ArchLinux:

Install Zsh:

```
yaourt -S zsh zsh-completions
```

Making Zsh a default shell:

```
chsh -s /bin/zsh
```

Install [anyenv](https://github.com/riywo/anyenv):

```
git clone https://github.com/riywo/anyenv ~/.anyenv
```

```
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
```

Installing additional packages:

```
yaourt -S vim tmux git
yaourt -S powerline
```

### Ubuntu

```
sudo apt install build-essential git tmux zsh powerline
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
