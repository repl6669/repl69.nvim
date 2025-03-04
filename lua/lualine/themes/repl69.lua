local palette = require("repl69.palette")
local config = require("repl69.config")

local bg_base = palette.black
if config.options.styles.transparency then
	bg_base = "NONE"
end

return {
	normal = {
		a = { bg = palette.gray19, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray06, fg = palette.gray16 },
		c = { bg = bg_base, fg = palette.gray21 },
	},
	insert = {
		a = { bg = palette.green, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray06, fg = palette.gray16 },
		c = { bg = bg_base, fg = palette.gray21 },
	},
	visual = {
		a = { bg = palette.cyan, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray06, fg = palette.gray16 },
		c = { bg = bg_base, fg = palette.gray21 },
	},
	replace = {
		a = { bg = palette.blue, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray06, fg = palette.gray16 },
		c = { bg = bg_base, fg = palette.gray21 },
	},
	command = {
		a = { bg = palette.orange, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray06, fg = palette.gray16 },
		c = { bg = bg_base, fg = palette.gray21 },
	},
	inactive = {
		a = { bg = bg_base, fg = palette.gray04, gui = "bold" },
		b = { bg = bg_base, fg = palette.gray04 },
		c = { bg = bg_base, fg = palette.gray04 },
	},
}
