-- this section containing any eye candy plugins
return {
  {
    {
      "Bekaboo/dropbar.nvim",
      -- optional, but required for fuzzy finder support
      dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      event = "BufEnter *.*",
      config = function()
        require "configs.dropbar"
      end,
    },
  },
  {
    -- preview for lsp code actions
    "aznhe21/actions-preview.nvim",
    keys = { "<leader>ga" },
  },
  {
    "karb94/neoscroll.nvim",
    -- event = { "BufEnter" },
    keys = { "zt", "zz", "zb" },
    config = function()
      require("neoscroll").setup {
        mappings = { -- Keys to be mapped to their corresponding default scrolling animation
          -- "<C-u>",
          -- "<C-d>",
          -- "<C-b>",
          -- "<C-f>",
          -- "<C-y>",
          -- "<C-e>",
          "zt",
          "zz",
          "zb",
        },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing = "sine", -- Default easing function
        duration_multiplier = 1.0, -- Global duration multiplier
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
        ignored_events = { -- Events ignored while scrolling
          "WinScrolled",
          "CursorMoved",
        },
      }
    end,
  },
  -- Lua
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup {
        window = { width = 0.74 },
        plugins = {
          twilight = { enabled = false },
        },
        options = {
          -- foldcolumn = "9", -- disable fold column
        },
        on_open = function()
          -- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
          vim.o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:,diff:/"
        end,
      }
    end,
  },
  -- Lua
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    -- for terminal that do not have graphical capabilities (like kitty)
    "sphamba/smear-cursor.nvim",
    enabled = not vim.g.neovide,
    event = { "BufEnter" },
    opts = {
      stiffness = 0.98,
      trailing_stiffness = 0.7,
      distance_stop_animating = 0.7,
      hide_target_hack = false,
      damping = 0.67,
      matrix_pixel_treshold = 0.5,

      -- Smear cursor color. Defaults to Cursor GUI color if not set.
      -- Set to "none" to match the text color at the target cursor position.
      -- cursor_color = "#d3cdc3",
      -- Background color. Defaults to Normal GUI background color if not set.
      -- normal_bg = "#282828",
      -- Smear cursor when switching buffers or windows.
      smear_between_buffers = true,
      -- Smear cursor when moving within line or to neighbor lines.
      smear_between_neighbor_lines = true,
      -- Draw the smear in buffer space instead of screen space when scrolling
      scroll_buffer_space = true,
      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears will blend better on all backgrounds.
      legacy_computing_symbols_support = true,
      transparent_bg_fallback_color = "#303030",
      smear_insert_mode = false,
    },
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    -- event = { "BufEnter" },
    config = function()
      require("lsp_lines").setup()
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    -- lazy = false,
    ft = "markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "VeryLazy" },

    -- test color
    -- TODO: def: green
    -- NOTE: def: purp
    -- PERF: def: red
    -- HACK: def: yellow
    -- FIX: def: red
    -- WARNING: def: yellow
    -- TEST: def: red

    config = function()
      local color = require("base46").get_theme_tb "base_30"

      -- default one is nice but inconsistant on some lang/device, idk why
      -- delete opts to use default one
      local opts = {
        keywords = {
          FIX = { color = "error" },
          TODO = { color = color.cyan },
          HACK = { color = color.orange },
          WARN = { color = color.yellow },
          PERF = { color = color.dark_purple },
          NOTE = { color = color.purple },
          TEST = { color = color.white },
        },
      }
      require("todo-comments").setup(opts)
    end,
  },
  {
    "nanozuki/tabby.nvim",
    lazy = false,
    config = function()
      -- configs...
      local theme = {
        -- this is carbonfox theme
        fill = "TabLineFill",
        head = { fg = "#75beff", bg = "#1c1e26", style = "italic" },
        current_tab = { fg = "#1c1e26", bg = "#75beff", style = "italic" },
        tab = { fg = "#c5cdd9", bg = "#1c1e26", style = "italic" },
        win = { fg = "#1c1e26", bg = "#75beff", style = "italic" },
        tail = { fg = "#75beff", bg = "#1c1e26", style = "italic" },
      }

      require("tabby.tabline").set(function(line)
        return {
          {
            { "  ", hl = theme.head },
            line.sep("", theme.head, theme.fill),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab

            -- remove count of wins in tab with [n+] included in tab.name()
            local name = tab.name()
            local index = string.find(name, "%[%d")
            local tab_name = index and string.sub(name, 1, index - 1) or name

            -- indicate if any of buffers in tab have unsaved changes
            local modified = false
            local win_ids = require("tabby.module.api").get_tab_wins(tab.id)
            for _, win_id in ipairs(win_ids) do
              if pcall(vim.api.nvim_win_get_buf, win_id) then
                local bufid = vim.api.nvim_win_get_buf(win_id)
                if vim.api.nvim_buf_get_option(bufid, "modified") then
                  modified = true
                  break
                end
              end
            end

            return {
              line.sep("", hl, theme.fill),
              tab_name,
              modified and "",
              line.sep("", hl, theme.fill),
              hl = hl,
              margin = " ",
            }
          end),
          line.spacer(),
          {
            line.sep("", theme.tail, theme.fill),
            { "  ", hl = theme.tail },
          },
          hl = theme.fill,
        }
      end)
    end,
  },
}
