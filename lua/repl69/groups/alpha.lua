local M = {}

M.url = "https://github.com/goolord/alpha-nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    AlphaShortcut    = { fg = c.gray300 },
    AlphaHeader      = { fg = c.gray200 },
    AlphaHeaderLabel = { fg = c.gray300 },
    AlphaFooter      = { fg = c.gray400 },
    AlphaButtons     = { fg = c.gray100 },
  }
end

return M