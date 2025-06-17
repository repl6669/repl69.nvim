local M = {}

M.url = "https://github.com/petertriho/nvim-scrollbar"

---@type repl69.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    ScrollbarError        = { fg = c.error, bg = c.none },
    ScrollbarErrorHandle  = { fg = c.error, bg = c.bg_dark },
    ScrollbarHandle       = { fg = c.none, bg = c.bg_dark },
    ScrollbarHint         = { fg = c.hint, bg = c.none },
    ScrollbarHintHandle   = { fg = c.hint, bg = c.bg_dark },
    ScrollbarInfo         = { fg = c.info, bg = c.none },
    ScrollbarInfoHandle   = { fg = c.info, bg = c.bg_dark },
    ScrollbarMisc         = { fg = c.purple, bg = c.none },
    ScrollbarMiscHandle   = { fg = c.purple, bg = c.bg_dark },
    ScrollbarSearch       = { fg = c.orange, bg = c.none },
    ScrollbarSearchHandle = { fg = c.orange, bg = c.bg_dark },
    ScrollbarWarn         = { fg = c.warning, bg = c.none },
    ScrollbarWarnHandle   = { fg = c.warning, bg = c.bg_dark },

  }
end

return M
