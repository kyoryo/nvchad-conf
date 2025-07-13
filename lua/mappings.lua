require "nvchad.mappings"
--nvchad default mapping https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
--
-- disable nvchad default mappings
local nomap = vim.keymap.del

-- disabled this so tab mapping doesn't interfere with ctrl-i
-- moreover read here https://nvchad.com/docs/faq/#mapping_ctrl_+_o_/_i_keys
nomap("n", "<tab>")
nomap("n", "<C-n>")
nomap("n", "<leader>x")
nomap("n", "<leader>rn")
nomap("n", "<leader>n")
nomap("n", "<C-s>")
nomap("n", "<leader>h")
nomap("n", "<leader>v")

-- comment
nomap("n", "<leader>/")
nomap("v", "<leader>/")

-- add yours here

local map = vim.keymap.set

-- ////////////////////////////////////////////
-- START local leader (conditional command mapping)
-- ////////////////////////////////////////////
--
map("n", "<localleader>ttt", ":echo 'hello' <cr>") -- test

-- go
map("n", "<localleader>tf", ":GoTestFunc -Fv<cr>", { desc = "Go Test Func" })
map("n", "<localleader>tF", ":GoTestFile -Fv<cr>", { desc = "Go Test File" })

-- dap go
map("n", "<localleader>dgt", function()
  require("dap-go").debug_test()
end, { desc = "DEBUG debug go test" })
map("n", "<localleader>dgl", function()
  require("dap-go").debug_last_test()
end, { desc = "DEBUG debug last go test" })
-- ////////////////////////////////////////////
-- END local leader (conditional command mapping)
-- ////////////////////////////////////////////

map("n", "<C-f>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<C-Left>", "<C-w>h", { desc = "Pane move left" })
map("n", "<C-Right>", "<C-w>l", { desc = "Pane move right" })
map("n", "<C-Up>", "<C-w>k", { desc = "Pane move up" })
map("n", "<C-Down>", "<C-w>j", { desc = "Pane move down" })

-- enable this if tabuffline is disabled
map("n", "<leader>x", "<cmd>bp | bd #<CR>", { desc = "Buffer close" })
map("n", "<leader><leader>x", ":%bd|e#|bd#<cr>|'\"<CR>", { desc = "Buffer close except current" }) --https://stackoverflow.com/a/60948057
map("n", "<leader><leader>X", ":%bd!|e#|bd#<cr>|'\"<CR>", { desc = "Buffer FORCE close except current" })

map("n", "<leader>ux", function()
  if vim.g.latest_deleted_buffer then
    vim.cmd("e " .. vim.fn.fnameescape(vim.g.latest_deleted_buffer))
  else
    print "No recently deleted buffer recorded."
  end
end, { noremap = true, silent = true, desc = "Undo delete buffer" })

map("n", "<C-n>", "<cmd>cnext<CR>", { desc = "Quickfix next" })
map("n", "<C-p>", "<cmd>cprevious<CR>", { desc = "Quickfix prev" })

map("n", "]b", ":bn<CR>", { desc = "Buffer next" })
map("n", "[b", ":bp<CR>", { desc = "Buffer prev" })

map("n", "gb", ":bn<CR>", { desc = "Buffer next" })
map("n", "gB", ":bp<CR>", { desc = "Buffer prev" })
-- map("i", "jk", "<ESC>", { desc = "type jk in insert mode to esc" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- <C-_> is same as <C-/>
map("n", "<C-_>", "gcc", { desc = "toggle comment", remap = true })
map("v", "<C-_>", "gc", { desc = "toggle comment", remap = true })

-- telescope
map("n", "<leader>fr", ":Telescope resume<CR>", { silent = true, desc = "Telescope resume last window" })
map(
  "n",
  "<leader>fg",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "telescope live grep args" }
)
map("n", "<leader>fc", ":Telescope commands<CR>", { desc = "Telescope find command" })
map(
  "n",
  "<leader>fu",
  ":Telescope frecency workspace=CWD path_display={'shorten'}<CR>",
  { desc = "Telescope most used files (frecency)" }
)

-- fzf
-- map("n", "<leader>fzf", ":lua require('fzf-lua').files()<CR>", { desc = "FZF find files" })
-- map("n", "<C-p>", require("fzf-lua").files, { desc = "FZF find files" })
map("n", "<leader>pp", require("fzf-lua").files, { desc = "FZF find files" })
-- map("n", "<leader>pf", require("fzf-lua").live_grep, { desc = "FZF Grep" })
map(
  "n",
  "<leader>pw",
  ":lua require'fzf-lua'.live_grep({ cmd = 'git grep --line-number --column --color=always' })<CR>",
  { silent = true, desc = "FZF live grep" }
)

map("n", "<leader>pgd", require("fzf-lua").lsp_definitions, { desc = "Jump to Definition" })
map(
  "n",
  "<leader>pcs",
  ":lua require'fzf-lua'.lsp_document_symbols({winopts = {preview={wrap='wrap'}}})<cr>",
  { desc = "Document Symbols" }
)
map("n", "<leader>pgr", require("fzf-lua").lsp_references, { desc = "LSP References" })
map("n", "<leader>pd", require("fzf-lua").lsp_workspace_diagnostics, { desc = "LSP Workspace Diagnostics" })
map("n", "<leader>pr", require("fzf-lua").resume, { desc = "FZF Resume" })
-- map("n", "<leader>pre", require("fzf-lua").registers, { desc = "Registers" })
map("n", "<leader>pm", require("fzf-lua").marks, { desc = "Marks" })
-- map("n", "<leader>pk", require("fzf-lua").keymaps, { desc = "Keymaps" })
-- map("n", "<leader>pb", require("fzf-lua").buffers, { desc = "FZF Buffers" })
-- map("v", "<leader>8", require("fzf-lua").grep_visual, { desc = "FZF Selection" })
-- map("n", "<leader>7", require("fzf-lua").grep_cword, { desc = "FZF Word" })
-- map("n", "<leader>pj", require("fzf-lua").helptags, { desc = "Help Tags" })
map("n", "<leader>pgc", require("fzf-lua").git_bcommits, { desc = "Browse File Commits" })
map("n", "<leader>pgh", require("fzf-lua").git_commits, { desc = "Browse Commit history" })
map("n", "<leader>pgs", require("fzf-lua").git_status, { desc = "Git Status" })
-- map("n", "<leader>ps", require("fzf-lua").spell_suggest, { desc = "Spelling Suggestions" })
-- map( "n", "<leader>pcd", ":lua require'fzf-lua'.diagnostics_document({fzf_opts = { ['--wrap'] = true }})<cr>", { desc = "Document Diagnostics" })
-- map( "n", "<leader>pca", ":lua require'fzf-lua'.lsp_code_actions({ winopts = {relative='cursor',row=1.01, col=0, height=0.2, width=0.4} })<cr>", { desc = "Code Actions" })

-- harpoon section
-- require("harpoon"):setup() -- REQUIRED

map("n", "<leader>a", function()
  require("harpoon"):list():add()
end, { desc = "HARPOON add file" })
map("n", "<C-e>", function()
  require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "HARPOON open menu" })

map("n", "<leader>1", function()
  require("harpoon"):list():select(1)
end, { desc = "HARPOON select buf 1" })
map("n", "<leader>2", function()
  require("harpoon"):list():select(2)
end, { desc = "HARPOON select buf 2" })
map("n", "<leader>3", function()
  require("harpoon"):list():select(3)
end, { desc = "HARPOON select buf 3" })
map("n", "<leader>4", function()
  require("harpoon"):list():select(4)
end, { desc = "HARPOON select buf 4" })
map("n", "<leader>5", function()
  require("harpoon"):list():select(5)
end, { desc = "HARPOON select buf 5" })
map("n", "<leader>6", function()
  require("harpoon"):list():select(6)
end, { desc = "HARPOON select buf 6" })
map("n", "<leader>7", function()
  require("harpoon"):list():select(7)
end, { desc = "HARPOON select buf 7" })
map("n", "<leader>8", function()
  require("harpoon"):list():select(8)
end, { desc = "HARPOON select buf 8" })
map("n", "<leader>9", function()
  require("harpoon"):list():select(9)
end, { desc = "HARPOON select buf 9" })
map("n", "<leader>0", function()
  require("harpoon"):list():select(0)
end, { desc = "HARPOON select buf 0" })

-- harpoon shortcut with alt
map("n", "<M-q>", function()
  require("harpoon"):list():select(1)
end, { desc = "HARPOON select buf 1" })
map("n", "<M-w>", function()
  require("harpoon"):list():select(2)
end, { desc = "HARPOON select buf 2" })
map("n", "<M-f>", function()
  require("harpoon"):list():select(3)
end, { desc = "HARPOON select buf 3" })
map("n", "<M-p>", function()
  require("harpoon"):list():select(4)
end, { desc = "HARPOON select buf 4" })
map("n", "<M-b>", function()
  require("harpoon"):list():select(5)
end, { desc = "HARPOON select buf 5" })

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function()
  require("harpoon"):list():prev()
end, { desc = "HARPOON next buff" })
map("n", "<C-S-N>", function()
  require("harpoon"):list():next()
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
-- replacing builtin vim f and t function
-- map("", "f", function()
--   hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
-- end, { remap = true, desc = "HOP find, current line after cursor" })
-- map("", "F", function()
--   hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
-- end, { remap = true, desc = "HOP find, current line before cursor" })
-- map("", "t", function()
--   hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
-- end, { remap = true, desc = "HOP till, current line after cursor" })
-- map("", "T", function()
--   hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
-- end, { remap = true, desc = "HOP till, current line before cursor" })

-- hop word
map("n", "<leader><leader>w", function()
  require("hop").hint_words { direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = false }
end, { remap = true, desc = "HOP word, after cursor" })
map("n", "<leader><leader>b", function()
  require("hop").hint_words { direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = false }
end, { remap = true, desc = "HOP word, before cursor" })
map("n", "<leader><leader>e", function()
  require("hop").hint_words {
    direction = require("hop.hint").HintDirection.AFTER_CURSOR,
    current_line_only = false,
    position = require("hop.hint").HintPosition.END,
  }
end, { remap = true, desc = "HOP end word, after cursor" })
map("n", "<leader><leader>ge", function()
  require("hop").hint_words {
    direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
    current_line_only = false,
    position = require("hop.hint").HintPosition.END,
  }
end, { remap = true, desc = "HOP end word, before cursor" })

-- hop camel case
map("n", "<leader><leader>c", ":HopCamelCaseCurrentLineAC<cr>", { silent = true, desc = "HOP camel, after cursor" })
map("n", "<leader><leader>C", ":HopCamelCaseCurrentLineBC<cr>", { silent = true, desc = "HOP camel, before cursor" })

-- hop line
map("n", "<leader><leader>j", function()
  require("hop").hint_lines_skip_whitespace { direction = require("hop.hint").HintDirection.AFTER_CURSOR }
end, { remap = true, desc = "HOP line, after cursor" })
map("n", "<leader><leader>k", function()
  require("hop").hint_lines_skip_whitespace { direction = require("hop.hint").HintDirection.BEFORE_CURSOR }
end, { remap = true, desc = "HOP line, before cursor" })
map("n", "<leader><leader>h", "") -- disable dulu
-- map("n", "<leader><leader>h", function()
--   hop.hint_words { direction = directions.BEFORE_CURSOR, current_line_only = false }
-- end, { remap = true, desc = "HOP word, all lines" })

--:lua require'hop'.hint_words({ })

-- debug keymap
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "DEBUG add breakpoint at line" })
map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "DEBUG continue" })

map("n", "<F1>", function()
  require("dap").continue()
end, { desc = "DEBUG continue" })
map("n", "<F2>", function()
  require("dap").step_into()
end, { desc = "DEBUG step into" })
map("n", "<F3>", function()
  require("dap").step_over()
end, { desc = "DEBUG step over" })
map("n", "<F4>", function()
  require("dap").step_back()
end, { desc = "DEBUG step back" })
map("n", "<F5>", function()
  require("dap").restart()
end, { desc = "DEBUG restart" })

map("n", "<leader>dut", function()
  require("dapui").toggle()
end, { desc = "DEBUG toggle ui" })
map("n", "<leader>duo", function()
  require("dapui").open()
end, { desc = "DEBUG open ui" })
map("n", "<leader>duc", function()
  require("dapui").close()
end, { desc = "DEBUG close ui" })
map("n", "<leader>due", function()
  require("dapui").eval()
end, { desc = "DEBUG open eval" })

map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "DEBUG open sidebar" })
map("n", "<space>dh", function()
  require("dapui").eval(nil, { enter = true })
end, { desc = "DEBUG eval var under cursor" })

-- code action preview ui
map("n", "ga", "<cmd>lua require('actions-preview').code_actions()<CR>", { desc = "LSP Code Action preview" })
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
map("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostic Open (Builtin)" })
map("n", "<leader><leader>p", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Diagnostic prev" })
map("n", "<leader><leader>n", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Diagnostic next" })
-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Telescope Diagnostic Show" })
-- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
vim.api.nvim_set_keymap(
  "n",
  "<leader>dd",
  "<cmd>lua vim.diagnostic.setloclist()<CR>",
  { noremap = true, silent = true }
)

-- trouble
map("n", "<leader>tr", "", { desc = "Trouble" })
map("n", "<leader>trd", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Trouble Diagnostics" })
map("n", "<leader>trb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Trouble Buffer Diagnostics" })
map("n", "<leader>trs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Trouble Symbols" })
map(
  "n",
  "<leader>trr",
  "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  { desc = "Trouble LSP Definitions / references / ... " }
)
map("n", "<leader>trl", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble Location List" })
map("n", "<leader>trq", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble Quickfix List" })
map("n", "<leader>trn", "<cmd>Trouble next<cr>", { desc = "Trouble Next" })
map("n", "<leader>trp", "<cmd>Trouble prev<cr>", { desc = "Trouble Prev" })

-- AI generation (codeium)
map("i", "<C-y>", function()
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
map("n", "<leader>zz", '<cmd>lua require("zen-mode").toggle()<CR>', { desc = "Zen toggle" })
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

-- nvim lint
map("n", "<leader>li", function()
  require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

-- timber
map("n", "glc", function()
  require("timber.actions").clear_log_statements { global = false }
end, { desc = "clear log in current buffer" })
map("n", "glC", function()
  require("timber.actions").clear_log_statements { global = true }
end, { desc = "clear log in projects" })
map("n", "glf", function()
  require("timber.actions").search_log_statements()
end, { desc = "find log statements" })
map("n", "gls", function()
  require("timber.summary").open { focus = true }
end, { desc = "summary log statements" })
map("n", "glh", function()
  require("timber.buffers").open_float()
end, { desc = "hover log statements" })

-- obsidian
map("n", "<leader>obn", ":lua require('obsidian')<CR>:ObsidianNew<CR>", { desc = "Obsidian new note" })
map("n", "<leader>obs", ":lua require('obsidian')<CR>:ObsidianSearch<CR>", { desc = "Obsidian search" })
map("n", "<leader>obt", ":lua require('obsidian')<CR>:ObsidianToday<CR>", { desc = "Obsidian today note" })
map("n", "<leader>obx", ":lua require('obsidian')<CR>:ObsidianExtractNote<CR>", { desc = "Obsidian today note" })
map("n", "<leader>ob#", ":lua require('obsidian')<CR>:ObsidianTags<CR>", { desc = "Obsidian tags" })

map("n", "<leader>ta", function()
  require("neotest").run.attach()
end, { desc = "[t]est [a]ttach" })
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "[t]est run [f]ile" })
map("n", "<leader>tA", function()
  require("neotest").run.run(vim.uv.cwd())
end, { desc = "[t]est [A]ll files" })
map("n", "<leader>tS", function()
  require("neotest").run.run { suite = true }
end, { desc = "[t]est [S]uite" })
map("n", "<leader>tn", function()
  require("neotest").run.run()
end, { desc = "[t]est [n]earest" })
map("n", "<leader>tl", function()
  require("neotest").run.run_last()
end, { desc = "[t]est [l]ast" })
map("n", "<leader>tsu", function()
  require("neotest").summary.toggle()
end, { desc = "[t]est [s]ummary" })
map("n", "<leader>to", function()
  require("neotest").output.open { enter = true, auto_close = true }
end, { desc = "[t]est [o]utput" })
map("n", "<leader>tO", function()
  require("neotest").output_panel.toggle()
end, { desc = "[t]est [O]utput panel" })
map("n", "<leader>tt", function()
  require("neotest").run.stop()
end, { desc = "[t]est [t]erminate" })
-- map("n", "<leader>td", function() require("neotest").run.run({ suite = false, strategy = "dap" }) end, {desc = "Debug nearest test" })
-- map("n", "<leader>tD", function() require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end, {desc = "Debug current file" })
--
--

-- monorepo
vim.keymap.set("n", "<leader>mo", function()
  require("telescope").extensions.monorepo.monorepo()
end, { desc = "Monorepo List" })
vim.keymap.set("n", "<leader>mt", function()
  require("monorepo").toggle_project()
end, { desc = "Monorepo Toggle" })
