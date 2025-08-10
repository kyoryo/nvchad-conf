return {
  {
    -- this is possibly to be archived because nvim has built-in workspace diagnostics
    "artemave/workspace-diagnostics.nvim",
    event = "BufRead",
    config = function()
      require("workspace-diagnostics").setup()
    end,
  },
}
