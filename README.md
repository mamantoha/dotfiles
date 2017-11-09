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
