local lint = require "lint"

lint.linters_by_ft = {
  tf = { "tflint", "tfsec" },
  json = { "jasonlint" },
  go = { "golangcilint" },
}

local lint_group = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_group,
  callback = function()
    lint.try_lint()
  end,
})
