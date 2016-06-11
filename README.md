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


Installing additional packages:

```
yaourt -S vim tmux git
yaourt -S powerline
```

## Additional Packages:

* [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)

* [rbenv](https://github.com/rbenv/rbenv)

* [neobundle.vim](https://github.com/Shougo/neobundle.vim)

### rbenv plugins:

ruby-build

```
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

rbenv-vars

```
git clone https://github.com/rbenv/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars
```

rbenv-update

```
git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
```
