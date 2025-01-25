local options = {
  defaults = {
    git_icon = false,
    file_icon = false,
    color_icon = false,
  },
  files = {
    actions = {
      -- "+accept" isn't required since `accept` is implied with actions
      ["ctrl-q"] = { fn = require("fzf-lua").actions.file_sel_to_qf, prefix = "select-all" },
    },
  },
  grep = {
    actions = {
      -- "+accept" isn't required since `accept` is implied with actions
      ["ctrl-q"] = { fn = require("fzf-lua").actions.file_sel_to_qf, prefix = "select-all" },
    },
  },
}

require("fzf-lua").setup(options)
