return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
    },
  },
  {
    -- to copy git link on a line
    "juacker/git-link.nvim",
    -- lazy = false,
  },
  {
    "otavioschwanck/github-pr-reviewer.nvim",
    opts = {
      -- options here
      show_inline_diff = false,
    },
    keys = {
      { "<leader>gr", "<cmd>PRReviewMenu<cr>", desc = "PR Review Menu" },
      { "<leader>gr", ":<C-u>'<,'>PRSuggestChange<CR>", desc = "Suggest change", mode = "v" },
    },
  },
}
