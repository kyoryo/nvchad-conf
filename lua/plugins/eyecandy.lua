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
      event = "BufEnter",
      config = function()
        require "configs.dropbar"
      end,
    },
  },
  {
    -- preview for lsp code actions
    "aznhe21/actions-preview.nvim",
  },
  {
    "karb94/neoscroll.nvim",
    event = { "BufEnter" },
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
          vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
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
    event = { "BufEnter" },
    opts = {
      stiffness = 0.98,
      trailing_stiffness = 0.7,
      distance_stop_animating = 0.7,
      hide_target_hack = false,
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
    lazy = false,
    -- ft = "markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufEnter" },
  },
}
