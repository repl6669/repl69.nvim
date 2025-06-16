local M = {}

M.url = "https://github.com/folke/which-key.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    WhichKey          = { fg = c.gray200 },
    WhichKeyGroup     = { fg = c.gray300 },
    WhichKeyDesc      = { fg = c.gray100 },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyNormal    = { bg = opts.transparent and c.none or c.bg_sidebar },
    WhichKeyValue     = { fg = c.gray500 },
  }
end

return M