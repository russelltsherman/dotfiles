# Vim native third-party package loading

Vim 8, released on 12th September, added a new feature of being able to load third party packages natively.

## Directory layout

Directory layout for packages is given as the following.

```txt
.vim/pack/shapeshed/start/foobar/plugin/foo.vim       " always loaded, defines commands
.vim/pack/shapeshed/start/foobar/plugin/bar.vim       " always loaded, defines commands
.vim/pack/shapeshed/start/foobar/autoload/foo.vim     " loaded when foo command used
.vim/pack/shapeshed/start/foobar/doc/foo.txt          " help for foo.vim
.vim/pack/shapeshed/start/foobar/doc/tags             " help tags
.vim/pack/shapeshed/opt/fooextra/plugin/extra.vim     " optional plugin, defines commands
.vim/pack/shapeshed/opt/fooextra/autoload/extra.vim   " loaded when extra command used
.vim/pack/shapeshed/opt/fooextra/doc/extra.txt        " help for extra.vim
.vim/pack/shapeshed/opt/fooextra/doc/tags             " help tags
```

where foobar and fooextra are names of plugins.

## Managing packages

The new functionality in vim does not add anything for managing plugins; it just loads them. How you manage plugins is up to you.

Managing packages is directly equivalent to using Pathogen so moving a plugin folder into place, cloning a git repository or using git submodules to move packages into the start folder are all options. Whilst I am not a huge fan of git submodules my ~/.vim folder is part of my dotfiles and I find that that git submodules work for me.

In the simplest form you can just move a plugin into the start folder and it will be loaded automatically. It is up to you how you manage it.

## Adding a package

Here is an example of how to add a package using Vim’s native approach to packages and git subtree.

```sh
git subtree add \
  --prefix dotfiles/.vim/pack/VundleVim/start/vundle \
  https://github.com/VundleVim/Vundle.vim.git v0.10 \
  --squash
```

## Updating packages

To update packages is also just a case of updating git subtree.

```sh
git subtree pull \
  --prefix dotfiles/.vim/pack/VundleVim/start/vundle \
  https://github.com/VundleVim/Vundle.vim.git v0.10.1 \
  --squash
```

## Removing a package

Removing a package is just a case of removing the git submodule.

```sh
git submodule deinit vim/pack/shapeshed/start/vim-airline
git rm vim/pack/shapeshed/start/vim-airline
rm -Rf .git/modules/vim/pack/shapeshed/start/vim-airline
git commit
```

update subtree reference to different tag on remove repo

```sh
git subtree pull \
  --prefix dotfiles/.vim/bundle/Vundle.vim \
  https://github.com/VundleVim/Vundle.vim.git v0.10.1 \
  --squash
```
