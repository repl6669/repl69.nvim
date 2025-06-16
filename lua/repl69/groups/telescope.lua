local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    TelescopeBorder         = { fg = c.border_highlight, bg = opts.transparent and c.none or c.bg_float },
    TelescopeNormal         = { fg = c.fg, bg = opts.transparent and c.none or c.bg_float },
    TelescopePromptBorder   = { fg = c.gray300, bg = opts.transparent and c.none or c.bg_float },
    TelescopePromptTitle    = { fg = c.gray200, bg = opts.transparent and c.none or c.bg_float },
    TelescopeResultsComment = { fg = c.gray600 },
  }
end

return M