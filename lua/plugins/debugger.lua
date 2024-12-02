local debugger = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "leoluz/nvim-dap-go",
  },
  config = function(_, opts)
    -- vim.notify(vim.inspect(opts))
    require("configs.debugger").setup(opts)
  end,
}
return debugger
