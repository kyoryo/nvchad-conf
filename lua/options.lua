require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- set default relative number
vim.opt.relativenumber = true
-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- ignore cases (cmd autocomplete)
vim.opt.ignorecase = true
-- gui colors
vim.opt.termguicolors = true

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 100 }
  end,
})

-- autosession config
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- highlight dap lines
vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })
-- dap icons
vim.fn.sign_define(
  "DapBreakpoint",
  -- { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
  { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)

-- vim.fn.sign_define(
--   "DapBreakpointCondition",
--   { text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )
-- vim.fn.sign_define(
--   "DapBreakpointRejected",
--   { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )
-- vim.fn.sign_define(
--   "DapLogPoint",
--   { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }

-- wsl clipboard specific
-- disable this in other os (??? need testing)
-- vim.g.clipboard = {
--   name = "WslClipboard",
--   copy = {
--     ["+"] = "clip.exe",
--     ["*"] = "clip.exe",
--   },
--   paste = {
--     ["+"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     ["*"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   },
--   cache_enabled = 0,
-- }
