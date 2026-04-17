local M = {}

function M.get_nearest_test()
  local line = vim.fn.line "."
  for l = line, 1, -1 do
    local text = vim.fn.getline(l)

    -- Look for a Go test function
    -- Match: func TestXxxx
    local test_name = text:match "^func%s+(Test%w+)"
    if test_name then
      return test_name
    end

    -- Match: func (r *Type) MethodName
    local method_name = text:match "^func%s*%b()%s*(%w+)"
    if method_name then
      return method_name
    end
  end
  return nil
end

return M
