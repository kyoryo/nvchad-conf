local options = {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    key = {
      "<leader>p",
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "configs.fzf"
    end,
  },
}
return options
