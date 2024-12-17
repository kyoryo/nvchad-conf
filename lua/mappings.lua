require "nvchad.mappings"
--nvchad default mapping https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
--
-- disable nvchad default mappings
local nomap = vim.keymap.del

-- disabled this so tab mapping doesn't interfere with ctrl-i
-- moreover read here https://nvchad.com/docs/faq/#mapping_ctrl_+_o_/_i_keys
nomap("n", "<tab>")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-Left>", "<C-w>h", { desc = "Pane move left" })
map("n", "<C-Right>", "<C-w>l", { desc = "Pane move right" })
map("n", "<C-Up>", "<C-w>k", { desc = "Pane move up" })
map("n", "<C-Down>", "<C-w>j", { desc = "Pane move down" })
map("n", "<leader><leader>x", ":%bd|e#|bd#<cr>|'\"<CR>", { desc = "Buffer close except current" }) --https://stackoverflow.com/a/60948057
map("n", "]q", ":cn<CR>", { desc = "Quickfix next" })
map("n", "[q", ":cp<CR>", { desc = "Quickfix prev" })
map("n", "]b", ":bn<CR>", { desc = "Buffer next" })
map("n", "[b", ":bp<CR>", { desc = "Buffer prev" })
-- map("i", "jk", "<ESC>", { desc = "type jk in insert mode to esc" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- telescope
map(
  "n",
  "<leader>fg",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "telescope live grep args" }
)
-- fzf
-- map("n", "<leader>fzf", ":lua require('fzf-lua').files()<CR>", { desc = "FZF find files" })
local fzflua = require "fzf-lua"
-- map("n", "<C-p>", fzflua.files, { desc = "FZF find files" })
map("n", "<leader>pp", fzflua.files, { desc = "FZF find files" })
-- map("n", "<leader>pf", fzflua.live_grep, { desc = "FZF Grep" })
map(
  "n",
  "<leader>pw",
  ":lua require'fzf-lua'.live_grep({ cmd = 'git grep --line-number --column --color=always' })<CR>",
  { desc = "FZF live grep" }
)

map("n", "<leader>pgd", fzflua.lsp_definitions, { desc = "Jump to Definition" })
map(
  "n",
  "<leader>pcs",
  ":lua require'fzf-lua'.lsp_document_symbols({winopts = {preview={wrap='wrap'}}})<cr>",
  { desc = "Document Symbols" }
)
map("n", "<leader>pgr", fzflua.lsp_references, { desc = "LSP References" })
map("n", "<leader>pd", fzflua.lsp_workspace_diagnostics, { desc = "LSP Workspace Diagnostics" })
map("n", "<leader>pr", fzflua.resume, { desc = "FZF Resume" })
-- map("n", "<leader>pre", fzflua.registers, { desc = "Registers" })
-- map("n", "<leader>pm", fzflua.marks, { desc = "Marks" })
-- map("n", "<leader>pk", fzflua.keymaps, { desc = "Keymaps" })
-- map("n", "<leader>pb", fzflua.buffers, { desc = "FZF Buffers" })
-- map("v", "<leader>8", fzflua.grep_visual, { desc = "FZF Selection" })
-- map("n", "<leader>7", fzflua.grep_cword, { desc = "FZF Word" })
-- map("n", "<leader>pj", fzflua.helptags, { desc = "Help Tags" })
-- map("n", "<leader>pgc", fzflua.git_bcommits, { desc = "Browse File Commits" })
-- map("n", "<leader>pgs", fzflua.git_status, { desc = "Git Status" })
-- map("n", "<leader>ps", fzflua.spell_suggest, { desc = "Spelling Suggestions" })
-- map( "n", "<leader>pcd", ":lua require'fzf-lua'.diagnostics_document({fzf_opts = { ['--wrap'] = true }})<cr>", { desc = "Document Diagnostics" })
-- map( "n", "<leader>pca", ":lua require'fzf-lua'.lsp_code_actions({ winopts = {relative='cursor',row=1.01, col=0, height=0.2, width=0.4} })<cr>", { desc = "Code Actions" })

-- harpoon section
local harpoon = require "harpoon"
harpoon:setup() -- REQUIRED

map("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "HARPOON add file" })
map("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "HARPOON open menu" })

map("n", "<leader>1", function()
  harpoon:list():select(1)
end, { desc = "HARPOON select buf 1" })
map("n", "<leader>2", function()
  harpoon:list():select(2)
end, { desc = "HARPOON select buf 2" })
map("n", "<leader>3", function()
  harpoon:list():select(3)
end, { desc = "HARPOON select buf 3" })
map("n", "<leader>4", function()
  harpoon:list():select(4)
end, { desc = "HARPOON select buf 4" })
map("n", "<leader>5", function()
  harpoon:list():select(5)
end, { desc = "HARPOON select buf 5" })
map("n", "<leader>6", function()
  harpoon:list():select(6)
end, { desc = "HARPOON select buf 6" })
map("n", "<leader>7", function()
  harpoon:list():select(7)
end, { desc = "HARPOON select buf 7" })
map("n", "<leader>8", function()
  harpoon:list():select(8)
end, { desc = "HARPOON select buf 8" })
map("n", "<leader>9", function()
  harpoon:list():select(9)
end, { desc = "HARPOON select buf 9" })
map("n", "<leader>0", function()
  harpoon:list():select(0)
end, { desc = "HARPOON select buf 0" })

-- harpoon shortcut with alt
map("n", "<M-q>", function()
  harpoon:list():select(1)
end, { desc = "HARPOON select buf 1" })
map("n", "<M-w>", function()
  harpoon:list():select(2)
end, { desc = "HARPOON select buf 2" })
map("n", "<M-f>", function()
  harpoon:list():select(3)
end, { desc = "HARPOON select buf 3" })
map("n", "<M-p>", function()
  harpoon:list():select(4)
end, { desc = "HARPOON select buf 4" })
map("n", "<M-b>", function()
  harpoon:list():select(5)
end, { desc = "HARPOON select buf 5" })

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function()
  harpoon:list():prev()
end, { desc = "HARPOON next buff" })
map("n", "<C-S-N>", function()
  harpoon:list():next()
end, { desc = "HARPOON prev buff" })

-- Spectre
map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "SPECTRE Toggle",
})
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "SPECTRE Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "SPECTRE Search current word",
})
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "SPECTRE Search on current file",
})

-- hop
local hop = require "hop"
local directions = require("hop.hint").HintDirection
-- replacing builtin vim f and t function
map("", "f", function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
end, { remap = true, desc = "HOP find, current line after cursor" })
map("", "F", function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
end, { remap = true, desc = "HOP find, current line before cursor" })
map("", "t", function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
end, { remap = true, desc = "HOP till, current line after cursor" })
map("", "T", function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
end, { remap = true, desc = "HOP till, current line before cursor" })
-- hop word
map("n", "<leader><leader>w", function()
  -- hop.hint_words()
  hop.hint_words { directions = directions.AFTER_CURSOR, current_line_only = false }
end, { remap = true, desc = "HOP word, all lines" })
map("n", "<leader><leader>h", function()
  hop.hint_words { directions = directions.BEFORE_CURSOR, current_line_only = false }
end, { remap = true, desc = "HOP word, all lines" })

-- debug keymap
local dap = require "dap"
map("n", "<leader>db", function()
  dap.toggle_breakpoint()
end, { desc = "DEBUG add breakpoint at line" })
map("n", "<leader>dc", function()
  dap.continue()
end, { desc = "DEBUG continue" })
map("n", "<F1>", dap.continue, { desc = "DEBUG continue" })
map("n", "<F2>", dap.step_into, { desc = "DEBUG step into" })
map("n", "<F3>", dap.step_over, { desc = "DEBUG step over" })
map("n", "<F4>", dap.step_back, { desc = "DEBUG step back" })
map("n", "<F5>", dap.restart, { desc = "DEBUG restart" })

local dapui = require "dapui"
map("n", "<leader>dut", dapui.toggle, { desc = "DEBUG toggle ui" })
map("n", "<leader>duo", dapui.open, { desc = "DEBUG open ui" })
map("n", "<leader>duc", dapui.close, { desc = "DEBUG close ui" })
map("n", "<leader>due", dapui.eval, { desc = "DEBUG open eval" })

map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "DEBUG open sidebar" })
map("n", "<space>dh", function()
  require("dapui").eval(nil, { enter = true })
end, { desc = "DEBUG eval var under cursor" })

-- dap go
map("n", "<leader>dgt", function()
  require("dap-go").debug_test()
end, { desc = "DEBUG debug go test" })
map("n", "<leader>dgl", function()
  require("dap-go").debug_last_test()
end, { desc = "DEBUG debug last go test" })

-- code action preview ui
local actprev = require "actions-preview"
map("n", "ga", actprev.code_actions, { desc = "LSP Code Action preview" })
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "LSP hover" })

-- copy external line link
map("n", "yu", function()
  require("git-link.main").copy_line_url()
end, { desc = "URL copy code line to clipboard" })
map("n", "<leader>go", function()
  require("git-link.main").open_line_url()
end, { desc = "URL open code line to clipboard" })

-- show diagnostic
-- map("n", "<leader>sd", ":lua vim.diagnostic.setqflist()<CR>", { desc = "Diagnostic add to quick fix list" })
map("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostic Open" })
map("n", "<leader><leader>p", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Diagnostic prev" })
map("n", "<leader><leader>n", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Diagnostic next" })
-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
map("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostic Show" })
-- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- trouble
map("n", "<leader>tdt", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>tdb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>tst", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map(
  "n",
  "<leader>tst",
  "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  { desc = "LSP Definitions / references / ... (Trouble)" }
)
map("n", "<leader>tlt", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>tqt", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- AI generation (codeium)
map("i", "<C-g>", function()
  local accepted = vim.fn["codeium#Accept"]()
  -- exit insert mode after accept codeium completion
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  return accepted
end, { expr = true, silent = true, desc = "AI accept suggestion" })
map("i", "<C-]>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true, desc = "AI cycle suggestions next" })
map("i", "<C-}>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true, desc = "AI cycle suggestions prev" })
map("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true, desc = "AI clear suggestion" })

-- zen mode
map(
  "n",
  "<leader>zz",
  '<cmd>lua require("zen-mode").toggle({ window = { width = 0.74 } })<CR>',
  { desc = "Zen toggle" }
)
map("n", "<leader>zt", '<cmd>lua require("twilight").toggle()<CR>', { desc = "Twilight Toggle" })

-- treesj
map({ "n", "x" }, "<leader>st", "<cmd>lua require('treesj').toggle()<CR>", { desc = "Treesj Toggle" })
map({ "n", "x" }, "<leader>sj", "<cmd>lua require('treesj').join()<CR>", { desc = "Treesj Join Lines" })
map({ "n", "x" }, "<leader>ss", "<cmd>lua require('treesj').split()<CR>", { desc = "Treesj Split Lines" })
map({ "n", "x" }, "<leader>sT", function()
  require("treesj").toggle { split = { recursive = true } }
end, { desc = "Treesj Toggle Lines recursive" })
map({ "n", "x" }, "<leader>sJ", function()
  require("treesj").join { split = { recursive = true } }
end, { desc = "Treesj Join Lines recursive" })
map({ "n", "x" }, "<leader>sS", function()
  require("treesj").split { split = { recursive = true } }
end, { desc = "Treesj Split Lines recursive" })

-- lsp lines
map("n", "<leader>lt", function()
  require "lsp_lines"
  vim.diagnostic.config {
    virtual_text = not vim.diagnostic.config().virtual_text,
    virtual_lines = vim.diagnostic.config().virtual_text,
  }
end, { desc = "Toggle LSP error lines" })
