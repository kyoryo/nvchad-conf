local M = {}

function M.live_grep_mappings(_, map)
  local actions = require "telescope.actions"
  local lga_actions = require "telescope-live-grep-args.actions"

  map("i", "<C-k>", lga_actions.quote_prompt(), { desc = "Quote prompt asrtrast" })
  map("i", "<C-space>", actions.to_fuzzy_refine, { desc = "Fuzzy refine results" })
  -- map("i", "<C-i>", lga_actions.quote_prompt { postfix = " --iglob " }, { desc = "Quote + iglob" })
  map("i", "<C-i>", lga_actions.quote_prompt { postfix = " --iglob " }, { desc = "Quote + iglob" })
  map("i", "<C-t><C-t>", lga_actions.quote_prompt { postfix = " --type " }, { desc = "Quote + type" })
  return true
end

return M
