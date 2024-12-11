local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    buf = { "buf" },
    tf = { "tflint", "tfsec" },
    sql = { "sqlfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {
    golines = {
      -- Specify the binary name or path to the formatter
      cmd = "golines",
      args = { "-m", "100" }, -- Pass the `-m 128` argument
      stdin = true, -- Indicates that the formatter accepts input via stdin
    },
  },
}

require("conform").setup(options)
