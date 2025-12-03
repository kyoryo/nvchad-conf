local M = {}

function M.get_nearest_test()
  local line = vim.fn.line "."
  for l = line, 1, -1 do
    local text = vim.fn.getline(l)
    -- Look for a Go test function
    local name = text:match "^func%s+(Test%w+)"
    if name then
      return name
    end
  end
  return nil
end

return M
