return {
  {
    -- mini.files
    "echasnovski/mini.files",
    version = "*",
    keys = { "<leader>mf" },
    config = function(_, opts)
      require("mini.files").setup(opts)
    end,
  },
}
