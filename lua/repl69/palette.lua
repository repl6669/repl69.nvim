local options = require("repl69.config").options
local hsl = require("repl69.utils.hsl").hslToHex

local variants = {
	main = {
		black = hsl(0, 0, 0),
		gray04 = hsl(0, 0, 4),
		gray08 = hsl(0, 0, 8),
		gray12 = hsl(0, 0, 12),
		gray16 = hsl(0, 0, 16),
		gray20 = hsl(0, 0, 20),
		gray24 = hsl(0, 0, 24),
		gray28 = hsl(0, 0, 28),
		gray32 = hsl(0, 0, 32),
		gray36 = hsl(0, 0, 36),
		gray40 = hsl(0, 0, 40),
		gray44 = hsl(0, 0, 44),
		gray48 = hsl(0, 0, 48),
		gray52 = hsl(0, 0, 52),
		gray56 = hsl(0, 0, 56),
		gray60 = hsl(0, 0, 60),
		gray64 = hsl(0, 0, 64),
		gray68 = hsl(0, 0, 68),
		gray72 = hsl(0, 0, 72),
		gray76 = hsl(0, 0, 76),
		gray80 = hsl(0, 0, 80),
		gray84 = hsl(0, 0, 84),
		white = hsl(0, 0, 88),

		background = hsl(0, 0, 0),
		foreground = hsl(0, 0, 88),

		cyan = hsl(180, 90, 24),
		cyan100 = hsl(180, 90, 80),
		cyan300 = hsl(180, 90, 50),
		cyan500 = hsl(180, 90, 35),
		cyan700 = hsl(180, 90, 20),
		cyan900 = hsl(180, 90, 10),

		green = hsl(158, 90, 42),
		green100 = hsl(158, 90, 80),
		green300 = hsl(158, 90, 50),
		green500 = hsl(158, 90, 35),
		green700 = hsl(158, 90, 20),
		green900 = hsl(158, 90, 10),

		blue = hsl(240, 90, 42),
		blue100 = hsl(240, 90, 80),
		blue300 = hsl(240, 90, 50),
		blue500 = hsl(240, 90, 35),
		blue700 = hsl(240, 90, 20),
		blue900 = hsl(240, 90, 10),

		purple = hsl(282, 90, 40),
		purple100 = hsl(282, 90, 80),
		purple300 = hsl(282, 90, 50),
		purple500 = hsl(282, 90, 35),
		purple700 = hsl(282, 90, 20),
		purple900 = hsl(282, 90, 10),

		orange = hsl(25, 100, 40),
		orange100 = hsl(25, 100, 80),
		orange300 = hsl(25, 100, 50),
		orange500 = hsl(25, 100, 35),
		orange700 = hsl(25, 100, 20),
		orange900 = hsl(25, 100, 10),

		red = hsl(0, 100, 60),
		red100 = hsl(0, 100, 80),
		red300 = hsl(0, 100, 50),
		red500 = hsl(0, 100, 35),
		red700 = hsl(0, 100, 20),
		red900 = hsl(0, 100, 10),

		yellow = hsl(60, 100, 75),
		yellow100 = hsl(60, 100, 80),
		yellow300 = hsl(60, 100, 50),
		yellow500 = hsl(60, 100, 35),
		yellow700 = hsl(60, 100, 20),
		yellow900 = hsl(60, 100, 10),

		none = "NONE",
	},
}

if options.palette ~= nil and next(options.palette) then
	-- handle variant specific overrides
	for variant_name, override_palette in pairs(options.palette) do
		if variants[variant_name] then
			variants[variant_name] = vim.tbl_extend("force", variants[variant_name], override_palette or {})
		end
	end
end

if variants[options.variant] ~= nil then
	return variants[options.variant]
end

return vim.o.background == "light" and variants.light or variants[options.dark_variant or "main"]
