return {
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    enable = false,
    config = function()
      require("telescope").load_extension "yaml_schema"
    end,
  },
}
