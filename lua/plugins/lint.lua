return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePre", "BufNewFile" },
    config = function()
      require "configs.nvimlint"
    end,
  },
}
