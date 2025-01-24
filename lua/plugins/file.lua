return {
  {
    "stevearc/oil.nvim",
    opts = {},
    event = "VeryLazy",
    cmd = "Oil",
    keys = {
      {
        "<leader>fl",
        function()
          require("oil").open()
        end,
        desc = "Open parent directory",
      },
    },
  },
}
