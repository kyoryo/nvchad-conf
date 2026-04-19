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
      show_inline_diff = false,
    },
    keys = {
      { "<leader>gr", "<cmd>PRReviewMenu<cr>", desc = "PR Review Menu" },
      { "<leader>gr", ":<C-u>'<,'>PRSuggestChange<CR>", desc = "Suggest change", mode = "v" },
    },
    config = function(_, opts)
      require("github-pr-reviewer").setup(opts)

      vim.keymap.del("n", "<C-e>")
      vim.keymap.set("n", "<C-e>", function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end, { desc = "HARPOON open menu" })
    end,
  },
}
