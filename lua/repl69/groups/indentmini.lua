local M = {}

M.url = "https://github.com/nvimdev/indentmini.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  return {
    IndentLine = { fg = c.gray850, nocombine = true },
    IndentLineCurrent = { fg = c.gray400, nocombine = true },
  }
end

return M
