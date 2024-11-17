require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>", { desc = "type jk in insert mode to esc" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- telescope
map(
  "n",
  "<leader>fg",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "telescope live grep args" }
)

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
  harpoon:list():select(4)
end, { desc = "HARPOON select buf 5" })
map("n", "<leader>6", function()
  harpoon:list():select(4)
end, { desc = "HARPOON select buf 6" })
map("n", "<leader>7", function()
  harpoon:list():select(4)
end, { desc = "HARPOON select buf 7" })
map("n", "<leader>8", function()
  harpoon:list():select(4)
end, { desc = "HARPOON select buf 8" })
map("n", "<leader>9", function()
  harpoon:list():select(4)
end, { desc = "HARPOON select buf 9" })
map("n", "<leader>0", function()
  harpoon:list():select(4)
end, { desc = "HARPOON select buf 0" })

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
  hop.hint_words()
end, { remap = true, desc = "HOP word, all lines" })

-- debug keymap
local dap = require "dap"
map("n", "<leader>db", function()
  dap.toggle_breakpoint()
end, { desc = "DEBUG add breakpoint at line" })
map("n", "<leader>dc", function()
  dap.continue()
end, { desc = "DEBUG add breakpoint at line" })
map("n", "<F1>", dap.continue, { desc = "DEBUG continue" })
map("n", "<F2>", dap.step_into, { desc = "DEBUG step into" })
map("n", "<F3>", dap.step_over, { desc = "DEBUG step over" })
map("n", "<F4>", dap.step_back, { desc = "DEBUG step back" })
map("n", "<F5>", dap.restart, { desc = "DEBUG restart" })

local dapui = require "dapui"
-- map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Debug, add breakpoint at line" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "DEBUG open sidebar" })
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
-- map("n", "<leader>d[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Diagnostic prev" })
-- map("n", "<leader>d]", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Diagnostic next" })
-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
map("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostic Show" })
-- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
