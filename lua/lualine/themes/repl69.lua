local colors = require("repl69.colors").setup()
local config = require("repl69.config").extend()

local bg_base = colors.black
if config.transparent then
	bg_base = "NONE"
end

return {
	normal = {
		a = { bg = colors.gray100, fg = colors.black, gui = "bold" },
		b = { bg = colors.gray750, fg = colors.gray250 },
		c = { bg = bg_base, fg = colors.gray50 },
	},
	insert = {
		a = { bg = colors.green, fg = colors.black, gui = "bold" },
		b = { bg = colors.gray750, fg = colors.gray250 },
		c = { bg = bg_base, fg = colors.gray50 },
	},
	visual = {
		a = { bg = colors.cyan, fg = colors.black, gui = "bold" },
		b = { bg = colors.gray750, fg = colors.gray250 },
		c = { bg = bg_base, fg = colors.gray50 },
	},
	replace = {
		a = { bg = colors.blue, fg = colors.black, gui = "bold" },
		b = { bg = colors.gray750, fg = colors.gray250 },
		c = { bg = bg_base, fg = colors.gray50 },
	},
	command = {
		a = { bg = colors.orange, fg = colors.black, gui = "bold" },
		b = { bg = colors.gray750, fg = colors.gray250 },
		c = { bg = bg_base, fg = colors.gray50 },
	},
	inactive = {
		a = { bg = bg_base, fg = colors.gray850, gui = "bold" },
		b = { bg = bg_base, fg = colors.gray850 },
		c = { bg = bg_base, fg = colors.gray850 },
	},
}
