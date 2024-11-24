return {
  {
    -- this include diffView and mergeView
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup()
    end,
  },
}
