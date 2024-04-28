local golang = {
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function(_, opts)
      require("configs.gopher").setup(opts)
      -- require("core.utils").load_mappings "gopher"
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}
return golang
