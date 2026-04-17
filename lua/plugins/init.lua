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
    "neovim/nvim-lspconfig", -- this plugin is only acting as default configuration
    config = function()
      require("nvchad.configs.lspconfig").defaults() -- default config is lua_ls
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
    -- commit = "90cd658", -- pre nvim v0.12
    branch = "main",
    main = "nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      local highlight = function(bufnr, lang)
        -------------------[ treesitter highlights ]-------------------------------
        if not vim.treesitter.language.add(lang) then
          return vim.notify(
            string.format("Treesitter cannot load parser for language: %s", lang),
            vim.log.levels.INFO,
            { title = "Treesitter" }
          )
        end
        vim.treesitter.start(bufnr)
      end

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = vim.bo.filetype
          local bt = vim.bo.buftype
          local buf = args.buf

          if bt ~= "" then
            return
          end -- don't run further.

          local ok, treesitter = pcall(require, "nvim-treesitter")
          if not ok then
            return
          end

          --------------------[ treesitter folds ]-------------------------------

          if ft == "javascriptreact" or ft == "typescriptreact" then
            vim.opt_local.foldmethod = "indent"
          else
            vim.opt_local.foldmethod = "expr"
            vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end

          vim.schedule(function()
            -- Only run normal if we're not in terminal mode
            if vim.fn.mode() ~= "t" then
              vim.cmd "silent! normal! zx"
            end
          end)

          ---------------------[ treesitter indent ]-------------------------------

          if not vim.tbl_contains({ "python", "html", "yaml", "markdown" }, ft) then
            vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
          end

          --------------------[ treesitter parsers ]-------------------------------
          if vim.fn.executable "tree-sitter" ~= 1 then
            vim.api.nvim_echo({
              {
                "tree-sitter CLI not found. Parsers cannot be installed.",
                "ErrorMsg",
              },
            }, true, {})
            return false
          end

          if not vim.treesitter.language.get_lang(ft) then
            return
          end

          if vim.list_contains(treesitter.get_installed(), ft) then
            highlight(buf, ft)
          elseif vim.list_contains(treesitter.get_available(), ft) then
            treesitter.install(ft):await(function()
              highlight(buf, ft)
            end)
          end
        end,
      })
    end,
    opts = {
      install = {
        "css",
        "comment",
        "markdown",
        "markdown_inline",
        "regex",
        "vimdoc",
        "go",
        "lua",
        "sql",
        "yaml",
        "json",
        "html",
        "bash",
        "terraform",
        "rust",
      },
    },
    config = function(_, opts)
      local treesitter = require "nvim-treesitter"
      treesitter.setup(opts)
      if vim.fn.executable "tree-sitter" ~= 1 then
        vim.api.nvim_echo({
          {
            "tree-sitter CLI not found. Parsers cannot be installed.",
            "ErrorMsg",
          },
        }, true, {})
        return false
      end
      treesitter.install(opts.install)
    end,
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
      local mappings = require "telescope_mappings"

      opts.defaults = opts.defaults or {}
      opts.defaults.mappings = opts.defaults.mappings or {}
      opts.defaults.mappings.i = opts.defaults.mappings.i or {}

      opts.defaults.mappings.i["<C-k>"] = actions.cycle_history_prev
      opts.defaults.mappings.i["<C-j>"] = actions.cycle_history_next

      opts.extensions = {
        ui_select = {},
        live_grep_args = {
          attach_mappings = mappings.live_grep_mappings,
          auto_quoting = true,
          -- mappings = {
          --   i = {
          --     ["<C-k>"] = lga_actions.quote_prompt(),
          --     ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
          --     ["<C-t>"] = lga_actions.quote_prompt { postfix = " --type " },
          --     -- freeze the current list and start a fuzzy search in the frozen list
          --     ["<C-space>"] = actions.to_fuzzy_refine,
          --   },
          -- },
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
  {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {}, -- tree-sitter CLI must be installed system-wide
    lazy = false,
    config = function()
      require("tree-sitter-manager").setup {
        -- Default Options
        -- ensure_installed = {}, -- list of parsers to install at the start of a neovim session
        -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
        -- auto_install = false, -- if enabled, install missing parsers when editing a new file
        -- highlight = true, -- treesitter highlighting is enabled by default
        -- languages = {}, -- override or add new parser sources
        -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
        -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
      }
    end,
  },
}
