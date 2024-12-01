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

### mapping

There are several ctl+key that has same function as other key. Be mindful if you use these key in your mapping.

| **Key Combination** | **ASCII Code** | **Same As**                  | **Meaning**                                  |
|----------------------|----------------|------------------------------|----------------------------------------------|
| Ctrl + A            | 0x01           | Start of Heading (SOH)       | Often used to move to the start of the line. |
| Ctrl + B            | 0x02           | Start of Text (STX)          | Used for moving the cursor left in some apps.|
| Ctrl + C            | 0x03           | End of Text (ETX)            | Interrupt signal in terminals.              |
| Ctrl + D            | 0x04           | End of Transmission (EOT)    | Signals end of input (e.g., EOF in `cat`).  |
| Ctrl + E            | 0x05           | Enquiry (ENQ)                | Used to move to the end of the line.        |
| Ctrl + H            | 0x08           | Backspace                    | Deletes one character to the left.          |
| Ctrl + I            | 0x09           | Tab                          | Horizontal tab.                             |
| Ctrl + J            | 0x0A           | Line Feed (LF)               | Acts as Enter in some cases.                |
| Ctrl + M            | 0x0D           | Carriage Return (CR)         | Acts as Enter (similar to Ctrl + J).        |
| Ctrl + [            | 0x1B           | Escape (ESC)                 | Used to enter command mode in some editors. |
| Ctrl + \            | 0x1C           | File Separator               | Triggers quit or force quit in some shells. |
| Ctrl + ]            | 0x1D           | Group Separator              | Often used for certain terminal commands.   |
| Ctrl + ^            | 0x1E           | Record Separator             | Rarely used directly.                       |
| Ctrl + _            | 0x1F           | Unit Separator               | Rarely used directly.                       |
| Ctrl + Space        | 0x00           | Null (NUL)                   | Represents a null character.                |

