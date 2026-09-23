require("folder-rules"):setup()
require("full-border"):setup()
require("starship"):setup()

-- show symlink in status bar
-- credits : https://yazi-rs.github.io/docs/tips/
Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

require("mactag"):setup({
	keys = {
		r = "Red",
		o = "Orange",
		y = "Yellow",
		g = "Green",
		b = "Blue",
		p = "Purple",
	},
	-- Colors used to display tags, from https://catppuccin.com/palette/
	colors = {
		Red = "#f38ba8",
		Orange = "#fab387", -- peach
		Yellow = "#f9e2af",
		Green = "#a6e3a1",
		Blue = "#89b4fa",
		Purple = "#cba6f7", -- mauve
	},
	-- Order of the color circle showing in the line mode
	order = 500,
})
