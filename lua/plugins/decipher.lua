return {
  {
    "MisanthropicBit/decipher.nvim",
    lazy = false,
    config = function()
      require("decipher").setup {
        float = { -- Floating window options
          border = { -- Floating window border
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
          },
          mappings = {
            -- Close the floating window
            close = "q",
            -- Apply the encoding/decoding in the preview to the original buffer
            apply = "<leader>a",
            -- Update the original buffer with changes made in the encoded/decoded preview
            -- keeping the text encoded/decoded
            update = "<leader>u",
            -- Prettily format contents as json if possible
            json = "<leader>j",
            -- Toggle help
            help = "g?",
          },
          -- Display a title with the codec name
          title = true,
          -- Position of the title
          title_pos = "left",
          -- Autoclose floating window if insert mode is activated or the cursor
          -- is moved
          autoclose = true,
          -- Automatically open the json view if the contents is valid json
          autojson = false,
          -- Automatically enter the floating window if opened
          enter = false,
          -- Options to apply to the floating window contents
          win_options = {},
          -- Z-index of the floating preview
          zindex = 50,
        },
      }
    end,
  },
}
