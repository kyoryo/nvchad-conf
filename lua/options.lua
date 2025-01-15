require "nvchad.options"
local colors = require("base46").get_theme_tb "base_30"
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt = "both" -- to enable cursorline!

vim.opt.relativenumber = true -- set default relative number
vim.opt.number = true -- set default absolute number
vim.opt.colorcolumn = "100" -- column marker, comment to disable
vim.opt.wildoptions = "pum,fuzzy" -- :h wildoptions

-- set limit scroll top and bot
vim.o.scrolloff = 8
-- set limit scroll left and right
vim.o.sidescrolloff = 8

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true -- convert tabs to spaces

vim.opt.ignorecase = true -- ignore cases (cmd autocomplete)
-- vim.opt.smartcase = true -- case insensitive if all lowercase, case sensitive otherwise
vim.opt.termguicolors = true -- gui colors

-- Fold options
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,diff:╱]]
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 100 }
  end,
})

local CleanOnSave = vim.api.nvim_create_augroup("CleanOnSave", {})
-- remove trailing whitespace from all lines before saving a file, on specific file type
vim.api.nvim_create_autocmd("FileType", {
  group = CleanOnSave,
  pattern = { "markdown" },
  callback = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = CleanOnSave,
      buffer = 0, -- Ensure this autocmd is specific to the current buffer
      command = [[%s/\s\+$//e]], -- Remove trailing whitespace
    })
  end,
})
-- remove trailing whitespace from all lines before saving a file, and all type of files
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   group = CleanOnSave,
--   pattern = "*",
--   command = [[%s/\s\+$//e]],
-- }) -- all files

-- vim.o.conceallevel = 0
-- set conceal level to 1 for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 1
  end,
})

-- autosession config
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- vim default notify
vim.notify = require "notify"

-- highlight dap lines
vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = colors.red, bg = colors.one_bg1 })
vim.api.nvim_set_hl(0, "DapBreakpointConditional", { ctermbg = 0, fg = colors.blue, bg = colors.one_bg2 })
vim.api.nvim_set_hl(0, "DapBreakpointRejected", { ctermbg = 0, bg = colors.orange })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = colors.green, bg = colors.one_bg3 })
vim.api.nvim_set_hl(0, "DapStoppedLine", { ctermbg = 0, bg = colors.line })

-- dap icons
vim.fn.sign_define("DapBreakpoint", {
  text = "󰙦 ",
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = "DapBreakpoint",
})
vim.fn.sign_define(
  "DapBreakpointCondition",
  { text = "󰙧 ", texthl = "DapBreakpointConditional", linehl = "", numhl = "DapBreakpointConditional" }
)
vim.fn.sign_define(
  "DapBreakpointRejected",
  { text = " ", texthl = "DapBreakpointRejected", linehl = "", numhl = "DapBreakpointRejected" }
)
vim.fn.sign_define(
  "DapStopped",
  { text = "", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "DapStopped" }
)

-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Make :bd and :q behave as usual when tree is visible
vim.api.nvim_create_autocmd({ "BufEnter", "QuitPre" }, {
  nested = false,
  callback = function(e)
    local tree = require("nvim-tree.api").tree

    -- Nothing to do if tree is not opened
    if not tree.is_visible() then
      return
    end

    -- How many focusable windows do we have? (excluding e.g. incline status window)
    local winCount = 0
    for _, winId in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(winId).focusable then
        winCount = winCount + 1
      end
    end

    -- We want to quit and only one window besides tree is left
    if e.event == "QuitPre" and winCount == 2 then
      vim.api.nvim_cmd({ cmd = "qall" }, {})
    end

    -- :bd was probably issued an only tree window is left
    -- Behave as if tree was closed (see `:h :bd`)
    if e.event == "BufEnter" and winCount == 1 then
      -- Required to avoid "Vim:E444: Cannot close last window"
      vim.defer_fn(function()
        -- close nvim-tree: will go to the last buffer used before closing
        tree.toggle { find_file = true, focus = true }
        -- re-open nivm-tree
        tree.toggle { find_file = true, focus = false }
      end, 10)
    end
  end,
})

-- Show line diagnostics automatically in hover window
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
-- vim.o.updatetime = 250
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
--   callback = function()
--     vim.diagnostic.open_float(nil, { focus = false })
--   end,
-- })

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

-- Set wsl-clipboard for vim clipboard if running WSL
-- Check if the current linux kernal is microsoft WSL version
local function is_wsl()
  local version_file = io.open("/proc/version", "rb")
  if version_file ~= nil and string.find(version_file:read "*a", "microsoft") then
    version_file:close()
    return true
  end
  return false
end

-- wsl-clipboard support nvim, tmux and unicode.
-- on wsl we could use xsel but it doesnt support unicode, so better install wsl-clipboard.
-- xclip does't work on wsl, but support unicode.
--
-- If current linux is under WSL then use wclip.exe
-- More info: https://github.com/memoryInject/wsl-clipboard
if is_wsl() then
  vim.g.clipboard = {
    name = "wsl-clipboard",
    copy = {
      ["+"] = "wcopy",
      ["*"] = "wcopy",
    },
    paste = {
      ["+"] = "wpaste",
      ["*"] = "wpaste",
    },
    cache_enabled = true,
  }
end
