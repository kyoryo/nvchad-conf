-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}
M.ui = {
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    order = {
      "mode",
      "file",
      "git",
      "modified",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "cwd",
      "cursor",
    },
    modules = {
      modified = function()
        if vim.bo.modified then
          -- return " ●"
          return " [Modified]"
        end
        return ""
      end,
    },
  },
  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = false,
    -- lazyload = true,
    -- order = {
    --   "treeOffset",
    --   "buffers",
    --   "tabs",
    --   "btns",
    -- },
    -- modules = nil,
  },
  term = {},
}
M.nvdash = {
  load_on_startup = true,
}

return M
