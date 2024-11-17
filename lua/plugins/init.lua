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
    "aznhe21/actions-preview.nvim",
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  {
    "juacker/git-link.nvim",
  },
  {
    "sshelll/gott.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
    },
  },
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   lazy = false,
  -- },
}
