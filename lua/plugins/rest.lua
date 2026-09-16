return {
  {
    -- POSTMAN/INSOMNIA REST CLIENT
    "mistweaverco/kulala.nvim",
    commit = "6656c9d332735ca6a27725e0fb45a1715c4372d9", -- old vanilla kulala
    -- commit = "a9e17ae0236e886371671a7a9f01f070201a9cc1",
    keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
    },
    ft = { "http", "rest" },
    opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<leader>R",
      kulala_keymaps_prefix = "",
    },
  },
}
