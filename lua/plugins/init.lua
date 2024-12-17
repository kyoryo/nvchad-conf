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
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        {
          "nvim-telescope/telescope-frecency.nvim",
        },
      },
    },
    opts = function(_, opts)
      table.insert(opts.extensions_list, "fzf")
      table.insert(opts.extensions_list, "frecency")
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension "fzf"
      require("telescope").load_extension "frecency"
    end,
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
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
