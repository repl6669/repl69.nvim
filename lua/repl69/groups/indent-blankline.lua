local M = {}

M.url = "https://github.com/lukas-reineke/indent-blankline.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    IndentBlanklineChar        = { fg = c.indent_inactive, nocombine = true },
    IndentBlanklineContextChar = { fg = c.indent_active, nocombine = true },
    IblIndent                  = { fg = c.indent_inactive, nocombine = true },
    IblScope                   = { fg = c.indent_active, nocombine = true },
  }
end

return M

