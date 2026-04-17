local M = {}

function M.live_grep_mappings(_, map)
  local actions = require "telescope.actions"
  local lga_actions = require "telescope-live-grep-args.actions"

  map("i", "<C-a>", lga_actions.quote_prompt(), { desc = "Quote prompt" })
  map("i", "<C-g>", lga_actions.quote_prompt { postfix = " --iglob " }, { desc = "Quote + iglob" })
  map("i", "<C-t>", lga_actions { postfix = " --type " }, { desc = "Quote + type" })
  map("i", "<C-space>", actions.to_fuzzy_refine, { desc = "Fuzzy refine results" })
  map("i", "<C-k>", actions.cycle_history_prev, { desc = "Cycle history prev" })
  map("i", "<C-j>", actions.cycle_history_next, { desc = "Cycle history next" })

  return true
end

return M
