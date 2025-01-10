local options = {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    keys = {
      "<leader>p",
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.fzf"
    end,
  },
}
return options
