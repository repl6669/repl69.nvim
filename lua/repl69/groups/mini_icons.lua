local M = {}

M.url = "https://github.com/nvim-mini/mini.icons"

---@type repl69.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniIconsGrey   = { fg = c.gray100 },
    MiniIconsPurple = { fg = c.purple100 },
    MiniIconsBlue   = { fg = c.blue100 },
    MiniIconsAzure  = { fg = c.pink100 },
    MiniIconsCyan   = { fg = c.cyan100 },
    MiniIconsGreen  = { fg = c.green100 },
    MiniIconsYellow = { fg = c.yellow100 },
    MiniIconsOrange = { fg = c.orange100 },
    MiniIconsRed    = { fg = c.red100 },
  }
end

return M
