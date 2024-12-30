local harpoon = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = {
      save_on_toggle = true,
      save_on_change = true,
    },
  },
}
return harpoon
