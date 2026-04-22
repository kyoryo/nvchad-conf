local debugger = {
  {
    "mfussenegger/nvim-dap",
    -- keys = { "<leader>db" },
    -- cmd = { "DapToggleBreakpoint" },
    dependencies = {
      { "nvim-neotest/nvim-nio" },
      { "rcarriga/nvim-dap-ui" },
      { "theHamsta/nvim-dap-virtual-text" },
    },
    config = function(_, opts)
      -- vim.notify(vim.inspect(opts))
      require("configs.debugger").setup(opts)
    end,
  },
  {
    "leoluz/nvim-dap-go",
    -- ft = { "go" },
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "Weissle/persistent-breakpoints.nvim",
    opts = {
      load_breakpoints_event = { "BufReadPost" },
    },
    config = function(_, opts)
      require("persistent-breakpoints").setup(opts)
    end,
  },
  {
    "Goose97/timber.nvim",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    keys = { "gl" },
    commit = "5791b348f0f1dd9a52a387c2518f0799e3ba8a43", -- delete this if the commit is merged
    config = function(_, opts)
      require("configs.timber").setup(opts)
    end,
  },
}
return debugger
