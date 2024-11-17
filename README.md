# starter
Starter config for NvChad

quick installation
`git clone https://github.com/kyoryo/nvchad-conf.git ~/.config/nvim/`

run these after cloning
`:TSInstall <your language>`
`:MasonInstallAll`

if delve is not installed, you need manually install it via
`:MasonInstall delve` or anything left behind. Ensure delve can be executed via shell by typing `dlv`

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

# useful vim command
open mason window
`:Mason`

list keymap
`:Telescope keymap`

toggle gitblame via gitsign
`:Gitsign toggle_current_line_blame`
