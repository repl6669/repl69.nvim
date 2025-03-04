local options = require("repl69.config").options
local hsl = require("repl69.utils.hsl").hslToHex

local variants = {
	main = {
		black = hsl(0, 0, 0),
		gray01 = hsl(0, 0, 4),
		gray02 = hsl(0, 0, 8),
		gray03 = hsl(0, 0, 12),
		gray04 = hsl(0, 0, 16),
		gray05 = hsl(0, 0, 20),
		gray06 = hsl(0, 0, 24),
		gray07 = hsl(0, 0, 28),
		gray08 = hsl(0, 0, 32),
		gray09 = hsl(0, 0, 36),
		gray10 = hsl(0, 0, 40),
		gray11 = hsl(0, 0, 44),
		gray12 = hsl(0, 0, 48),
		gray13 = hsl(0, 0, 52),
		gray14 = hsl(0, 0, 56),
		gray15 = hsl(0, 0, 60),
		gray16 = hsl(0, 0, 64),
		gray17 = hsl(0, 0, 68),
		gray18 = hsl(0, 0, 72),
		gray19 = hsl(0, 0, 76),
		gray20 = hsl(0, 0, 80),
		gray21 = hsl(0, 0, 84),
		white = hsl(0, 0, 88),

		background = hsl(0, 0, 0),
		foreground = hsl(0, 0, 88),

		cyan = hsl(180, 90, 24),
		green = hsl(158, 90, 42),
		darkgreen = hsl(120, 100, 18),
		blue = hsl(210, 90, 48),
		darkblue = hsl(240, 90, 25),
		purple = hsl(282, 90, 40),
		orange = hsl(25, 100, 40),
		red = hsl(0, 100, 60),
		yellow = hsl(60, 100, 75),

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
