local golang = {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup {
      tag_transform = "camelcase", -- set to e.g. 'snakecase' to transform to snake_case
      -- verbose = true, -- enable for debug
      -- log_path = vim.fn.expand "$HOME" .. "/tmp/gonvim.log", -- this put lots at ~/tmp/gonvim.log
    }
  end,
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
return golang
