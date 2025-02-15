return {
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {

    "MagicDuck/grug-far.nvim",
    cmd = { "GrugFar" },
    config = function()
      require("grug-far").setup {
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      }
    end,
  },
  {
    "bassamsdata/namu.nvim",
    lazy = false,
    config = function()
      require("namu").setup {
        -- Enable the modules you want
        namu_symbols = {
          enable = true,
          options = {
            AllowKinds = {
              default = {
                "Function",
                "Method",
                "Class",
                "Module",
                "Property",
                "Variable",
              },
              go = {
                "Function",
                "Method",
                -- "Struct",
                -- "Field",
                "Interface",
                "Constant",
                "Property",
              },
              lua = { "Function", "Method", "Table", "Module" },
              python = { "Function", "Class", "Method" },
              yaml = { "Object", "Array" },
              json = { "Module" },
              toml = { "Object" },
              markdown = { "String" },
            },
          }, -- here you can configure namu
        },
        -- Optional: Enable other modules if needed
        colorscheme = {
          enable = false,
          options = {
            -- NOTE: if you activate persist, then please remove any vim.cmd("colorscheme ...") in your config, no needed anymore
            persist = true, -- very efficient mechanism to Remember selected colorscheme
            write_shada = false, -- If you open multiple nvim instances, then probably you need to enable this
          },
        },
        ui_select = { enable = false }, -- vim.ui.select() wrapper
      }
      -- === Suggested Keymaps: ===
      local namu = require "namu.namu_symbols"
      -- local colorscheme = require "namu.colorscheme"
      vim.keymap.set("n", "<leader>nss", namu.show, {
        desc = "Jump to LSP symbol",
        silent = true,
      })
      -- vim.keymap.set("n", "<leader>nth", colorscheme.show, {
      --   desc = "Colorscheme Picker",
      --   silent = true,
      -- })
    end,
  },
}
