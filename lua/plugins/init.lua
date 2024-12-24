return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "lua-language-server",
        "stylua",
        -- webdev
        "html-lsp",
        "css-lsp",
        "prettier",
        -- golang
        "gopls",
        "gofumpt",
        "goimports-reviser",
        "golines",
        "go-debug-adapter",
        "delve",
        -- protobuf
        "buf-language-server",
        "buf",
        -- rust
        "rust-analyzer",
        "codelldb",
        -- terraform
        "terraform-ls",
        "tflint",
        "tfsec",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- extend sources
      -- remove 1, to remove 1st priority
      table.insert(opts.sources, 1, { name = "vim-dadbod-completion" })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-frecency.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    opts = function(_, opts)
      table.insert(opts.extensions_list, "fzf")
      table.insert(opts.extensions_list, "frecency")
      table.insert(opts.extensions_list, "live_grep_args")
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      local actions = require "telescope.actions"
      local lga_actions = require "telescope-live-grep-args.actions"

      opts.extensions = {
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
              ["<C-t>"] = lga_actions.quote_prompt { postfix = " --type " },
              -- freeze the current list and start a fuzzy search in the frozen list
              ["<C-space>"] = actions.to_fuzzy_refine,
            },
          },
        },
      }

      telescope.setup(opts)
      telescope.load_extension "fzf"
      telescope.load_extension "frecency"
      telescope.load_extension "live_grep_args"
    end,
  },
  {
    -- workoaround of :w !sudo tee %
    "lambdalisue/vim-suda",
    cmd = { "SudaRead", "SudaWrite" },
  },
  -- {
  --   "nanotee/sqls.nvim", --sqls adapter
  -- },
  -- {
  --   "sshelll/gott.nvim",
  --   dependencies = {
  --     "rcarriga/nvim-notify",
  --   },
  --   lazy = false,
  -- },
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   lazy = false,
  -- },
}
