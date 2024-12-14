local lint = require "lint"

lint.linters_by_ft = {
  tf = { "tflint", "tfsec" },
  json = { "jsonlint" },
  go = { "golangcilint" },
}

local lint_group = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_group,
  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set("n", "<leader>li", function()
  lint.try_lint()
end, { desc = "Trigger linting for current file" })

vim.api.nvim_create_user_command("LintInfo", function()
  local filetype = vim.bo.filetype
  local linters = require("lint").linters_by_ft[filetype]

  if linters then
    print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
  else
    print("No linters configured for filetype: " .. filetype)
  end
end, {})
