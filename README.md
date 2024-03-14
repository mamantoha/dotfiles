# dotfiles

## Requirements

### Ubuntu

```sh
sudo apt install build-essential git tmux zsh powerline vim-gtk3 silversearcher-ag neovim ripgrep
chsh -s $(which zsh)
```

### macOS

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install tmux anyenv python the_silver_searcher neovim ripgrep
pip3 install --user powerline-status
```

### Fonts

- <https://www.nerdfonts.com>
- <https://github.com/ryanoasis/nerd-fonts>

Make sure the nerd font doesnt end with `Mono` to prevent small icons.
Example: `JetbrainsMono Nerd Font` and not `JetbrainsMono Nerd Font Mono`

```sh
echo -e "\e[1mbold\e[0m"
echo -e "\e[3mitalic\e[0m"
echo -e "\e[4munderline\e[0m"
echo -e "\e[9mstrikethrough\e[0m"
```

### Oh My Zsh

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### Powerlevel10k theme

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Type `p10k configure` to access the builtin configuration wizard.

### fzf

```console
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```

* `Ctrl+T` to search for files
* `Ctrl+R` to search for commands in a history

### tmux

```console
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

* `prefix` + `r` - reload config
* `prefix` + `I` - install plugins
* `prefix` + `U` - update plugins

### Neovim

- <https://nvchad.com/>
- <https://nvchad.com/docs/quickstart/install>

```sh

# Optional
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

# Install NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

ls -s ~/dotfiles/nvim ~/.config/nvim
```
