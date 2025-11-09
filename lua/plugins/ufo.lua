---@type NvPluginSpec
return {
  {
    "kevinhwang91/nvim-ufo",
    event = "BufRead",
    dependencies = {
      { "kevinhwang91/promise-async" },
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            -- foldfunc = "builtin",
            -- setopt = true,
            relculright = true,
            bt_ignore = {
              "nofile",
              "prompt",
              "terminal",
              "packer",
            },
            ft_ignore = {
              "NvimTree",
              "dashboard",
              "nvcheatsheet",
              "help",
              "vim",
              "alpha",
              "dashboard",
              "neo-tree",
              "Trouble",
              "noice",
              "lazy",
              "toggleterm",
              "ui",
            },
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { " " } }, -- separator
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          }
        end,
      },
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require("lspconfig")[ls].setup {
          capabilities = capabilities,
          -- you can add other fields for setting up lsp server in this table
        }
      end

      -- disable ufo on these filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "grug-far",
          "json.kulala_ui",
          "kulala_ui",
          "checkhealth",
          "dap-repl",
          "dapui_watches",
          "dapui_console",
          "dapui_stacks",
          "dapui_breakpoints",
          "dapui_scopes",
          "dap-repl",
          "dbui",
        },
        callback = function()
          require("ufo").detach()
          vim.opt_local.foldenable = false
          vim.opt_local.foldcolumn = "0"
        end,
      })
      require("ufo").setup()
    end,
  },
}
