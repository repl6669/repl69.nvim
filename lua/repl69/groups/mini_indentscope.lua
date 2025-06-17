local M = {}

M.url = "https://github.com/echasnovski/mini.indentscope"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniIndentscopeSymbol = { fg = c.indent_active, nocombine = true },
    MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible
  }
end

return M
