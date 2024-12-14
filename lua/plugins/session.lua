return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    require("auto-session").setup {
      -- create session if only on git directory
      auto_create = function()
        local cmd = "git rev-parse --is-inside-work-tree"
        return vim.fn.system(cmd) == "true\n"
      end,
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/", "~/git" },
      -- log_level = "error",
      pre_save_cmds = { "NvimTreeClose" },
      post_restore_cmds = {
        function()
          -- Restore nvim-tree after a session is restored
          local nvim_tree_api = require "nvim-tree.api"
          nvim_tree_api.tree.open()
          nvim_tree_api.tree.change_root(vim.fn.getcwd())
          nvim_tree_api.tree.reload()
        end,
      },
    }
  end,
}
