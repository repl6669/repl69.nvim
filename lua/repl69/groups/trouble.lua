local M = {}

M.url = "https://github.com/folke/trouble.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    TroubleText   = { fg = c.fg_dark },
    TroubleCount  = { fg = c.gray200, bg = c.fg_gutter },
    TroubleNormal = { fg = c.fg, bg = opts.transparent and c.none or c.bg_sidebar },
  }
end

return M