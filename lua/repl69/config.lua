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
		border = "gray16",
		link = "gray60",
		panel = "gray12",

		error = "red500",
		hint = "green500",
		info = "cyan500",
		ok = "green500",
		warn = "orange500",
		note = "blue500",
		todo = "cyan500",

		git_add = "gray44",
		git_change = "gray76",
		git_delete = "gray36",
		git_dirty = "gray76",
		git_ignore = "gray16",
		git_merge = "gray60",
		git_rename = "gray44",
		git_stage = "gray60",
		git_text = "gray76",
		git_untracked = "gray44",

		---@type string | PaletteColor
		h1 = "gray60",
		h2 = "gray68",
		h3 = "gray76",
		h4 = "gray52",
		h5 = "gray44",
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
