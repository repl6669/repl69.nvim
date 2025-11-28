local M = {}

M.url = "https://github.com/nvim-mini/mini.test"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    MiniTestEmphasis = { bold = styles.keywords.bold },
    MiniTestFail = { fg = c.red500, bold = styles.keywords.bold },
    MiniTestPass = { fg = c.green500, bold = styles.keywords.bold },
  }
end

return M

