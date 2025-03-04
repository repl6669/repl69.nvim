local palette = require("repl69.palette")
local config = require("repl69.config")

local bg_base = palette.black
if config.options.styles.transparency then
	bg_base = "NONE"
end

return {
	normal = {
		a = { bg = palette.gray100, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray750, fg = palette.gray250 },
		c = { bg = bg_base, fg = palette.gray50 },
	},
	insert = {
		a = { bg = palette.green, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray750, fg = palette.gray250 },
		c = { bg = bg_base, fg = palette.gray50 },
	},
	visual = {
		a = { bg = palette.cyan, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray750, fg = palette.gray250 },
		c = { bg = bg_base, fg = palette.gray50 },
	},
	replace = {
		a = { bg = palette.blue, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray750, fg = palette.gray250 },
		c = { bg = bg_base, fg = palette.gray50 },
	},
	command = {
		a = { bg = palette.orange, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray750, fg = palette.gray250 },
		c = { bg = bg_base, fg = palette.gray50 },
	},
	inactive = {
		a = { bg = bg_base, fg = palette.gray850, gui = "bold" },
		b = { bg = bg_base, fg = palette.gray850 },
		c = { bg = bg_base, fg = palette.gray850 },
	},
}
