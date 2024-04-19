require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
local harpoon = require "harpoon"

-- REQUIRED
harpoon:setup()
-- REQUIRED

map("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "add file to harpoon" })
map("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "open harpoon menu" })

map("n", "<C-1>", function()
  harpoon:list():select(1)
end, { desc = "harpoon list, select buf 1" })
map("n", "<C-2>", function()
  harpoon:list():select(2)
end, { desc = "harpoon list, select buf 2" })
map("n", "<C-3>", function()
  harpoon:list():select(3)
end, { desc = "harpoon list, select buf 3" })
map("n", "<C-4>", function()
  harpoon:list():select(4)
end, { desc = "harpoon list, select buf 4" })

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function()
  harpoon:list():prev()
end, { desc = "harpoon list, next buff" })
map("n", "<C-S-N>", function()
  harpoon:list():next()
end, { desc = "harpoon list, prev buff" })
