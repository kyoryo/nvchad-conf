local M = {}

function M.setup(opts)
  -- opts.log_marker = "✅"
  -- opts.log_marker = "🪵"
  opts.log_templates = {
    default = {
      go = [[fmt.Printf("%watcher_marker_start %log_target: %v\n%watcher_marker_end", %log_target)]],
      lua = [[vim.notify(vim.inspect(%log_target))]],
    },
  }
  opts.log_watcher = {
    enabled = true,
    sources = {
      log_file = {
        type = "filesystem",
        name = "Log File",
        path = "/tmp/timber_debug.log",
      },
      -- see docs to use neotest
    },
  }
  require("timber").setup(opts)
end

return M
