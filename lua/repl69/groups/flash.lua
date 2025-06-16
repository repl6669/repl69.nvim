local M = {}

M.url = "https://github.com/folke/flash.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    FlashBackdrop = { fg = c.gray850 },
    FlashLabel    = { bg = c.gray200, bold = styles.keywords.bold, fg = c.black },
  }
end

return M