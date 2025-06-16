local M = {}

M.url = "https://github.com/echasnovski/mini.starter"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local transparent = opts.transparent
  local styles = opts.styles

  -- stylua: ignore
  return {
    MiniStarterCurrent    = { nocombine = true },
    MiniStarterFooter     = { fg = c.gray400, italic = styles.comments.italic },
    MiniStarterHeader     = { fg = c.gray200 },
    MiniStarterInactive   = { fg = c.gray700, italic = styles.comments.italic },
    MiniStarterItem       = { fg = c.gray100, bg = transparent and c.none or c.bg },
    MiniStarterItemBullet = { fg = c.gray500 },
    MiniStarterItemPrefix = { fg = c.gray300 },
    MiniStarterQuery      = { fg = c.gray200 },
    MiniStarterSection    = { fg = c.gray200 },
  }
end

return M