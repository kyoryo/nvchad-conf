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
      pre_save_cmds = {
        -- "NvimTreeClose"
        function()
          local status_ok, api = pcall(require, "nvim-tree.api")
          if not status_ok then
            return
          end
          local ok, view = pcall(require, "nvim-tree.view")
          if not ok then
            return
          end
          if view.is_visible() then
            api.tree.close()
          end
        end,
      },
      post_save_cmds = {
        function()
          local status_ok, api = pcall(require, "nvim-tree.api")
          if not status_ok then
            return
          end
          api.tree.close()
          -- api.tree.toggle { focus = false, find_file = true }
        end,
      },
      post_restore_cmds = {
        function()
          local status_ok, api = pcall(require, "nvim-tree.api")
          if not status_ok then
            return
          end
          local ok, view = pcall(require, "nvim-tree.view")
          if not ok then
            return
          end
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            local name = vim.api.nvim_buf_get_name(buf)
            if name:match "NvimTree*" then
              if not view.is_visible() then
                api.tree.toggle { focus = false, find_file = true }
              end
              break
            end
          end
        end,
      },
    }
  end,
}
