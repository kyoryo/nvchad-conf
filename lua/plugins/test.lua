return {
  {
    "nvim-neotest/neotest",
    ft = { "go", "gomod" },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      { "fredrikaverpil/neotest-golang", version = "*" },
    },
    config = function()
      local go_config = {
        runner = "gotestsum",
        gotestsum_args = {
          "--format=testname",
        },
        go_test_args = {
          "-v",
          "-race",
        },
        testify_enabled = true,
        log_level = vim.log.levels.TRACE,
      }
      require("neotest").setup {
        adapters = {
          require "neotest-golang"(go_config),
        },
      }
    end,
  },
}
