local M = {}

M.url = "https://github.com/ibhagwan/fzf-lua"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local function make_border(fg)
    fg = fg or c.border
    return {
      fg = fg,
      bg = opts.transparent and c.none or c.bg_float,
    }
  end

  -- stylua: ignore
  return {
    -- Original repl69 fzf-lua colors from main branch
    FzfLuaBorder        = make_border(),
    FzfLuaCursor        = "IncSearch",
    FzfLuaDirPart       = { fg = c.gray700 },
    FzfLuaFilePart      = { fg = c.gray450 },
    FzfLuaFzfCursorLine = "Visual",
    FzfLuaFzfNormal     = { fg = c.gray100 },
    FzfLuaFzfPointer    = { fg = c.orange500 },
    FzfLuaHeaderBind    = "@punctuation.special",
    FzfLuaHeaderText    = "Title",
    FzfLuaBufFlagAlt    = { fg = c.gray500 },
    FzfLuaBufFlagCur    = { fg = c.gray500 },
    FzfLuaPath          = "Directory",
    FzfLuaNormal        = "NormalFloat",
    FzfLuaPreviewTitle  = { fg = c.fg, bg = opts.transparent and c.none or c.bg_popup },
    FzfLuaTitle         = "FloatTitle",
    FzfLuaLivePrompt    = { fg = c.orange500 },
    FzfLuaLiveSym       = { fg = c.orange500 },
  }
end

return M