local map = require("core.utils").map

-- ──────────────────────────────────────────────────────────────────────────────
-- (TEMPLATES)
-- ──────────────────────────────────────────────────────────────────────────────

local templates = {
	{ "m", "main.c", "[m]ain" },
}

local templates_location = "~/.config/nvim/templates/c/"

-- NOTE: a bit tedious, but done that way in order to mimic my obsdian keymap
require("which-key").add({ { "<leader>i", group = "[i]nsert…", icon = "" } })
require("which-key").add({ { "<leader>it", group = "[t]emplates…", icon = "" } })

for _, value in pairs(templates) do
	local key, filetitle, label = unpack(value)
	map("n", "<leader>it" .. key, "<cmd>read " .. templates_location .. filetitle .. "<cr>", { desc = label })
end
