# starter
Starter config for NvChad

quick installation

`git clone https://github.com/kyoryo/nvchad-conf.git ~/.config/nvim/`

run these after cloning

`:TSInstall <your language>`
`:MasonInstallAll`

if delve is not installed, you need manually install it via
`:MasonInstall delve` or anything left behind. Ensure delve can be executed via shell by typing `dlv`

## PATH
Make sure that path is set up in your shell
example if using fish

```
fish_add_path -U "/home/<username>/.local/share/nvim/mason/bin/"
```

also make sure $GOPATH is present,
`echo $GOPATH`
if not present, run this command
```
fish_add_path -U "/home/<username>/go/bin"
```
or add this in zshrc
```
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
```

## Git Merge Tools and Diff Tools
in addition of lazy git, we could use nvim as external difftool and mergetool by adding these lines to ~/.gitconfig

```
[merge]
    tool = nvimdiff
[diff]
    tool = nvimdiff
```

## AI Tools
### codeium
run `:Codeium Auth` to login to codeium.

## useful vim command
open mason window
`:Mason`

list keymap
`:Telescope keymaps`

toggle gitblame via gitsign
`:Gitsign toggle_current_line_blame`

to copy text in wsl run this command after using visual block to select desired text in normal mode vim
`:'<,'>w !clip.exe`
