local M = {}

function M.setup(opts)
  opts = opts or {}
  opts.log_marker = "🌳 "
  opts.log_templates = {
    go = [[fmt.Printf("%log_target: %v\n", %log_target)]],
  }
  require("timber").setup(opts)
end

return M
