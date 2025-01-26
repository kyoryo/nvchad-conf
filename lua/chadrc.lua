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
      -- comment to use default
      lsp = function()
        local clients = vim.lsp.get_clients { bufnr = 0 }
        if next(clients) == nil then
          return ""
        end
        local client_names = {}
        for _, client in pairs(clients) do
          table.insert(client_names, client.name)
        end
        local lsps = table.concat(client_names, ", ")
        if vim.o.columns > 100 and #client_names > 0 then
          return " %#St_lsp#  LSP ~ " .. lsps .. " "
        else
          return " %#St_lsp#  LSP "
        end
      end,
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
    enabled = true,
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
