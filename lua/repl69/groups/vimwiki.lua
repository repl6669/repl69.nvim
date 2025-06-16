local M = {}

M.url = "https://github.com/vimwiki/vimwiki"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    VimwikiLink = { fg = c.blue, bg = c.none },
    VimwikiHeaderChar = { fg = c.yellow, bg = c.none },
    VimwikiHR = { fg = c.yellow, bg = c.none },
    VimwikiList = { fg = c.orange, bg = c.none },
    VimwikiTag = { fg = c.green, bg = c.none },
    VimwikiMarkers = { fg = c.blue, bg = c.none },
  }
  
  local rainbow_colors = { c.red, c.orange, c.yellow, c.green, c.cyan, c.blue, c.purple, c.pink }
  for i, color in ipairs(rainbow_colors) do
    ret["VimwikiHeader" .. i] = { fg = color, bg = c.none, bold = true }
  end
  return ret
end

return M