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
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
    config = function()
      require("mason-tool-installer").setup {
        auto_update = false,
        run_on_start = false,
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
          -- yaml
          "yamlfix",
          "yamlfmt",
          "yamllint",
          "yaml-language-server",
          -- ansible
          "ansible-language-server",
          "ansible-lint",
          -- sql
          "sqlfmt",
          "sqls",
        },
        -- run_on_start = true,
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "go",
        "vim",
        "vimdoc",
        "html",
        "css",
        "bash",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "terraform",
        "rust",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
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
      { "nvim-telescope/telescope-ui-select.nvim" },
      -- {
      --   "isak102/telescope-git-file-history.nvim",
      --   dependencies = {
      --     "nvim-lua/plenary.nvim",
      --     "tpope/vim-fugitive",
      --   },
      -- },
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
        ui_select = {},
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
      -- telescope.load_extension "git_file_history"
      telescope.load_extension "ui-select"
    end,
  },
  {
    -- workaround of :w !sudo tee %
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
