-- for enabling inlay hints see opts here https://github.com/MysticalDevil/inlay-hints.nvim

local servers = {
  { true, "html" },
  { true, "cssls" },
  { true, "buf_ls" },
  { true, "ansiblels" },
  { true, "ts_ls" },
  {
    true,
    "gopls",
    {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_marker = { "go.work", "go.mod", "git" },
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
            unreachable = true,
            unusedwrite = true,
            unusedvariable = true,
          },
          verboseOutput = false, -- debugging purposes
          -- hints = { -- inlay hints
          --   rangeVariableTypes = true,
          --   parameterNames = true,
          --   constantValues = true,
          --   assignVariableTypes = true,
          --   compositeLiteralFields = true,
          --   compositeLiteralTypes = true,
          --   functionTypeParameters = true,
          -- },
        },
      },
    },
  },
  {
    true,
    "terraformls",
    {
      -- on_attach = on_attach,
      -- on_init = on_init,
      -- capabilities = capabilities,
      cmd = { "terraform-ls", "serve" },
      filetypes = { "terraform", "terraform-vars" },
    },
  },
  {
    true,
    "yamlls",
    {
      -- on_attach = on_attach,
      -- on_init = on_init,
      -- capabilities = capabilities,
      schemas = {
        -- github actions
        ["https://raw.githubusercontent.com/SchemaStore/schemastore/refs/heads/master/src/schemas/json/github-workflow.json"] = "*github/workflows/*",
        -- open api
        ["https://raw.githubusercontent.com/oapi-codegen/oapi-codegen/refs/heads/main/configuration-schema.json"] = "*cfg.{yml,yaml}",
        -- golangci
        ["https://golangci-lint.run/jsonschema/golangci.jsonschema.json"] = ".golangci.{yml,yaml}",
      },
    },
  },
  { true, "golangci_lint_ls", {
    filetypes = { "go", "gomod" },
  } },
  {
    false,
    "golangcilsp",
    {

      cmd = { "golangci-lint-langserver" },
      root_marker = { "go.work", "go.mod", "git" },
      init_options = {
        command = {
          "golangci-lint",
          "run",
          "--output.json.path",
          "stdout",
          "--show-stats=false",
          "--issues-exit-code=1",
        },
      },
    },
  },
  -- sqls language server
  -- uncomment to enable sqls completion, require a working connections
  -- could be used as complementary to vim-dadbod
  {
    false,
    "sqls",
    {
      settings = {
        sqls = {
          connections = {
            {
              driver = "postgresql",
              dataSourceName = "postgres://test_user:test_pwd_123@localhost:5432/trx_db_test?sslmode=disable",
            },
          },
        },
      },
    },
  },
}

-- v0.11
for _, lsp in pairs(servers) do
  local enabled, name, config = lsp[1], lsp[2], lsp[3]
  if enabled then
    if config then
      vim.lsp.config(name, config)
    end
    vim.lsp.enable(name)
  end
end
