# Git subtree: the alternative to Git submodule

The Internet is full of articles on why you shouldn’t use Git submodules. While submodules are useful for a few use cases, they do have several drawbacks.

Git subtree lets you nest one repository inside another as a sub-directory.

add a subtree reference to a specifig tag on remote repo

```sh
git subtree add \
  --prefix dotfiles/.vim/bundle/Vundle.vim \
  https://github.com/VundleVim/Vundle.vim.git v0.10 \
  --squash
```

update subtree reference to different tag on remove repo

```sh
git subtree pull \
  --prefix dotfiles/.vim/bundle/Vundle.vim \
  https://github.com/VundleVim/Vundle.vim.git v0.10.1 \
  --squash
```
