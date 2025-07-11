local M = {}

M.url = "https://github.com/justinmk/vim-sneak"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    Sneak      = { fg = c.bg_dark, bg = c.pink },
    SneakScope = { bg = c.bg_visual },
  }
end

return M
