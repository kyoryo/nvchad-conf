# starter
Starter config for NvChad

### quick installation


`git clone https://github.com/kyoryo/nvchad-conf.git ~/.config/nvim/`

### remove previous installation:
If you have previous nvim config better remove previous installation first:
```bash
# linux/mac
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Windows PowerShell
rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data

```

### run these after cloning
To install mason tools, listed in config
```vim
:MasonToolsInstall
```

To install treesitter parsers
```vim
:TSInstall <your language>
```

If some mason pkg is not installed, you need manually install it via `:MasonInstall <name>`.
For example:
`:MasonInstall delve` to install delve.
Also ensure delve can be executed via shell by typing `dlv`

## PATH
Make sure that path is set up in your shell
example if using fish

```bash
fish_add_path -U "/home/<username>/.local/share/nvim/mason/bin/"
```

also make sure $GOPATH is present, `echo $GOPATH`.
if not present, run this command
```bash
fish_add_path -U "/home/<username>/go/bin"
```
or add this in zshrc/bashrc:
```bash
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

### WSL
#### clipboard
To copy text in wsl run this command after using visual block to select desired text in normal mode vim:
`:'<,'>w !clip.exe`
That options is not using any external installation.
For best result, install:
 [wsl-clipboard](https://github.com/memoryInject/wsl-clipboard)

#### open link
To fix wsl `gx` install [wsl-open](https://github.com/4U6U57/wsl-open)

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


## Telescope Useful Commands
Sending all search result to quickfix list
1. Search something
2. `Ctrl + q` to send all result to quickfix list

Sending some result to quickfix list

## FZF lua useful Commands

Sending all search result to quickfix list
1. Search something
2. `Ctrl + q` to send all result to quickfix list

Sending some result to quickfix list
1. `tab` to select
2. `Enter` to send selection to quickfix list
