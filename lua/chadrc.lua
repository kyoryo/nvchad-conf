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
      -- "custom_cursor",
      -- "simple_cursor",
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
          -- return " %#St_lsp#●"
          return " [Modified]"
        end
        return ""
      end,
      custom_cursor = function()
        local config = require("nvconfig").ui.statusline
        local sep_style = config.separator_style
        local utils = require "nvchad.stl.utils"
        sep_style = (sep_style ~= "round" and sep_style ~= "block") and "block" or sep_style

        local sep_icons = utils.separators
        local separators = (type(sep_style) == "table" and sep_style) or sep_icons[sep_style]
        local sep_l = separators["left"]
        local sep_r = "%#St_sep_r#" .. separators["right"] .. " %#ST_EmptySpace#"
        local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
          return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
        end
        return gen_block("", "%l/%v[%p%%] ", "%#St_Pos_sep#", "%#St_Pos_bg#", "%#St_lsp_txt#")
      end,
      simple_cursor = function()
        return " %#StText# Ln %l, Col %v  %p%% "
      end,
    },
  },
  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = true,
    lazyload = true,
    bufwidth = 25,
    order = {
      "treeOffset",
      "buffers",
      "tabs",
      "btns",
    },
    modules = {
      tabOnly = function()
        -- WIP
        local fn = vim.fn
        -- local api = vim.api
        local g = vim.g

        local btn = require("nvchad.tabufline.utils").btn

        local result, tabs = "", fn.tabpagenr "$"

        for nr = 1, tabs, 1 do
          local tab_hl = "TabO" .. (nr == fn.tabpagenr() and "n" or "ff")
          result = result .. btn(" " .. nr .. " ", tab_hl, "GotoTab", nr)
        end

        local new_tabtn = btn(" 󰐕 ", "TabNewBtn", "NewTab")
        local tabstoggleBtn = btn(" TABS ", "TabTitle", "ToggleTabs")
        local small_btn = btn(" 󰅁 ", "TabTitle", "ToggleTabs")

        return g.TbTabsToggled == 1 and small_btn or new_tabtn .. tabstoggleBtn .. result
      end,
    },
  },
  term = {},
}
M.nvdash = {
  load_on_startup = true,
}

return M
