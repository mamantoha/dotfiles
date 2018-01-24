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

Install rbenv:

Clone rbenv into `~/.rbenv`:

```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
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

#### rbenv

```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
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

* [rbenv](https://github.com/rbenv/rbenv)

* [dein.vim](https://github.com/Shougo/dein.vim)

### rbenv plugins:

#### ruby-build

```
git clone https://github.com/rbenv/ruby-build.git $(rbenv root)/plugins/ruby-build
```

#### rbenv-vars

```
git clone https://github.com/rbenv/rbenv-vars.git $(rbenv root)/plugins/rbenv-vars
```

#### rbenv-update

```
git clone https://github.com/rkh/rbenv-update.git $(rbenv root)/plugins/rbenv-update
```

#### rbenv-default-gems

```
git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems
```

Specify gems in `$(rbenv root)/default-gems` by name, one per line

### Other

#### Visual Studio Code

`~/.config/Code/User/settings.json`
