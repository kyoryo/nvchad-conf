local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    json = { "prettier", "prettierd" },
    yaml = { "prettier", "prettierd" },
    html = { "prettierd" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    buf = { "buf" },
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
      args = { "-m", "120" }, -- Pass the `-m 128` argument
      stdin = true, -- Indicates that the formatter accepts input via stdin
    },
  },
}

require("conform").setup(options)
