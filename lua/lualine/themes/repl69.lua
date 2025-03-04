local palette = require("repl69.palette")
local config = require("repl69.config")

local bg_base = palette.black
if config.options.styles.transparency then
	bg_base = "NONE"
end

return {
	normal = {
		a = { bg = palette.gray76, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray24, fg = palette.gray64 },
		c = { bg = bg_base, fg = palette.gray84 },
	},
	insert = {
		a = { bg = palette.green, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray24, fg = palette.gray64 },
		c = { bg = bg_base, fg = palette.gray84 },
	},
	visual = {
		a = { bg = palette.cyan, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray24, fg = palette.gray64 },
		c = { bg = bg_base, fg = palette.gray84 },
	},
	replace = {
		a = { bg = palette.blue, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray24, fg = palette.gray64 },
		c = { bg = bg_base, fg = palette.gray84 },
	},
	command = {
		a = { bg = palette.orange, fg = palette.black, gui = "bold" },
		b = { bg = palette.gray24, fg = palette.gray64 },
		c = { bg = bg_base, fg = palette.gray84 },
	},
	inactive = {
		a = { bg = bg_base, fg = palette.gray16, gui = "bold" },
		b = { bg = bg_base, fg = palette.gray16 },
		c = { bg = bg_base, fg = palette.gray16 },
	},
}
