---@alias Variant "main"
---@alias Palette table<string, string>
---@alias PaletteColor string
---@alias Highlight { link: string, inherit: boolean } | { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean, inherit: boolean }

local M = {}

---@class Options
M.options = {
	---Set the desired variant: "auto" will follow the vim background,
	---@type "auto" | Variant
	variant = "auto",

	---Set the desired dark variant when `options.variant` is set to "auto".
	---@type Variant
	dark_variant = "main",

	enable = {
		terminal = true,
	},

	styles = {
		bold = true,
		italic = true,
		transparency = false,
	},

	---@type table<string, table<string, string>>
	palette = {},

	---@type table<string, string | PaletteColor>
	groups = {
		base = "black",
		border = "gray04",
		link = "gray15",
		panel = "black",

		error = "red",
		hint = "cyan",
		info = "cyan",
		ok = "green",
		warn = "orange",
		note = "blue",
		todo = "cyan",

		git_add = "gray11",
		git_change = "gray19",
		git_delete = "gray09",
		git_dirty = "gray19",
		git_ignore = "gray04",
		git_merge = "gray15",
		git_rename = "gray11",
		git_stage = "gray15",
		git_text = "gray19",
		git_untracked = "gray11",

		---@type string | PaletteColor
		h1 = "gray15",
		h2 = "gray17",
		h3 = "gray19",
		h4 = "gray13",
		h5 = "gray11",
		h6 = "green",
	},

	---@type table<string, Highlight>
	highlight_groups = {},

	---Called before each highlight group, before setting the highlight.
	---@param group string
	---@param highlight Highlight
	---@param palette Palette
	---@diagnostic disable-next-line: unused-local
	before_highlight = function(group, highlight, palette) end,
}

---@param options Options | nil
function M.extend_options(options)
	M.options = vim.tbl_deep_extend("force", M.options, options or {})
end

return M
