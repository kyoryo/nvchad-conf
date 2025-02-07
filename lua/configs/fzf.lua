local options = {
  {
    -- fzf profile and fallbacks
    "telescope",
    -- "fzf-native",
  },
  fzf_opts = { ["--layout"] = "reverse" },
  winopts = {},
  defaults = {
    git_icon = false,
    file_icon = false,
    color_icon = false,
  },

  -- uncomment to use custom
  -- files = {
  --   actions = {
  --     -- true, -- uncomment to inherit all default config in custom config
  --     -- "+accept" isn't required since `accept` is implied with actions
  --     ["ctrl-q"] = { fn = require("fzf-lua").actions.file_sel_to_qf, prefix = "select-all" },
  --   },
  -- },
  -- grep = {
  --   actions = {
  --     -- true, -- uncomment to inherit all default config in custom config
  --     -- "+accept" isn't required since `accept` is implied with actions
  --     ["ctrl-q"] = { fn = require("fzf-lua").actions.file_sel_to_qf, prefix = "select-all" },
  --   },
  -- },
}

require("fzf-lua").setup(options)
