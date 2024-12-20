-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "buf_ls" }
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
      },
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
-- lspconfig.yamlls.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
--   schemas = {
--     ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/refs/heads/main/schemas/v3.1/schema.yaml"] = "~/git/Ojire/be/api/*",
--   },
-- }

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
