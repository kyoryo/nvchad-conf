return {
  {
    -- this include diffView and mergeView
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup()
    end,
  },

  {
    -- to copy git link on a line
    "juacker/git-link.nvim",
    -- lazy = false,
  },
}
