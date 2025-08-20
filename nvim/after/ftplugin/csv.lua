local map = require("nvim.lua.core.utils").map

map("n", "<localleader>v", "<cmd>CsvViewToggle<cr>", { desc = "toggle CSV View" })
