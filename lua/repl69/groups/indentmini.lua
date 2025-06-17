local M = {}

M.url = "https://github.com/nvimdev/indentmini.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    IndentLine =        { fg = c.indent_inactive, nocombine = true },
    IndentLineCurrent = { fg = c.indent_active, nocombine = true },
  }
end

return M
