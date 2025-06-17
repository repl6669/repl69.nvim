local M = {}

M.url = "https://github.com/echasnovski/mini.map"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniMapNormal      = "NormalFloat",
    MiniMapSymbolCount = "Special",
    MiniMapSymbolLine  = "Title",
    MiniMapSymbolView  = "Delimiter",
  }
end

return M