local M = {}

M.url = "https://github.com/lukas-reineke/indent-blankline.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    IndentBlanklineChar        = { fg = c.gray850, nocombine = true },
    IndentBlanklineContextChar = { fg = c.gray400, nocombine = true },
    IblIndent                  = { fg = c.gray850, nocombine = true },
    IblScope                   = { fg = c.gray400, nocombine = true },
  }
end

return M