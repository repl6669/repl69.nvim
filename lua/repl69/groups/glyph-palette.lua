local M = {}

M.url = "https://github.com/lambdalisue/glyph-palette.vim"

---@type repl69.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    GlyphPalette1 = { fg = c.red300 },
    GlyphPalette2 = { fg = c.green },
    GlyphPalette3 = { fg = c.yellow },
    GlyphPalette4 = { fg = c.blue },
    GlyphPalette6 = { fg = c.green100 },
    GlyphPalette7 = { fg = c.fg },
    GlyphPalette9 = { fg = c.red },
  }
end

return M