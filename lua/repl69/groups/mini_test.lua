local M = {}

M.url = "https://github.com/echasnovski/mini.test"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    MiniTestEmphasis = { bold = styles.keywords.bold },
    MiniTestFail = { fg = c.red, bold = styles.keywords.bold },
    MiniTestPass = { fg = c.green, bold = styles.keywords.bold },
  }
end

return M