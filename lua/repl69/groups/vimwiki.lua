local M = {}

M.url = "https://github.com/vimwiki/vimwiki"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    VimwikiLink = { fg = c.blue700, bg = c.none },
    VimwikiHeaderChar = { fg = c.yellow700, bg = c.none },
    VimwikiHR = { fg = c.yellow700, bg = c.none },
    VimwikiList = { fg = c.orange700, bg = c.none },
    VimwikiTag = { fg = c.green700, bg = c.none },
    VimwikiMarkers = { fg = c.blue700, bg = c.none },
  }

  local rainbow_colors = {
    c.green700,
    c.orange700,
    c.yellow700,
    c.red700,
    c.pink700,
    c.purple700,
    c.blue700,
    c.cyan700,
  }

  for i, color in ipairs(rainbow_colors) do
    ret["VimwikiHeader" .. i] = { fg = color, bg = c.none, bold = true }
  end
  return ret
end

return M

