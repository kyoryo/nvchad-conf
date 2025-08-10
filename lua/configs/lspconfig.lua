-- for enabling inlay hints see opts here https://github.com/MysticalDevil/inlay-hints.nvim
--
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "buf_ls", "ansiblels" }
local util = require "lspconfig/util"
local configs = require "lspconfig/configs"

-- Add folding capabilities required by ufo.nvim
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- golang
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", "git"),
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
}

-- terraform
lspconfig.terraformls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars" },
}

-- yaml ls
lspconfig.yamlls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  schemas = {
    -- github actions
    ["https://raw.githubusercontent.com/SchemaStore/schemastore/refs/heads/master/src/schemas/json/github-workflow.json"] = "*github/workflows/*",
    -- open api
    ["https://raw.githubusercontent.com/oapi-codegen/oapi-codegen/refs/heads/main/configuration-schema.json"] = "*cfg.{yml,yaml}",
    -- golangci
    ["https://golangci-lint.run/jsonschema/golangci.jsonschema.json"] = ".golangci.{yml,yaml}",
    -- ansible
  },
}

-- golangci linter
if not configs.golangcilsp then
  configs.golangcilsp = {
    default_config = {
      cmd = { "golangci-lint-langserver" },
      root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
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
  }
end
lspconfig.golangci_lint_ls.setup {
  filetypes = { "go", "gomod" },
}

-- sqls language server
-- uncomment to enable sqls completion, require a working connections
-- could be used as complementary to vim-dadbod
-- lspconfig.sqls.setup {
--   on_attach = function(client, bufnr)
--     require("sqls").on_attach(client, bufnr)
--   end,
--   capabilities = capabilities,
--   settings = {
--     sqls = {
--       connections = {
--         {
--           driver = "postgresql",
--           dataSourceName = "postgres://test_user:test_pwd_123@localhost:5432/trx_db_test?sslmode=disable",
--         },
--       },
--     },
--   },
-- }
