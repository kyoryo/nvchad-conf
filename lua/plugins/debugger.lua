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
    "Goose97/timber.nvim",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    keys = { "gl" },
    config = function(_, opts)
      require("configs.timber").setup(opts)
    end,
  },
}
return debugger
