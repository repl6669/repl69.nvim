local M = {}

M.url = "https://github.com/nvim-mini/mini.jump"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    MiniJump             = { bg = c.gray200, fg = c.black },
    MiniJump2dDim        = "Comment",
    MiniJump2dSpot       = { fg = c.gray200, bold = styles.keywords.bold, nocombine = true },
    MiniJump2dSpotAhead  = { fg = c.hint, bg = c.bg_dark, nocombine = true },
    MiniJump2dSpotUnique = { fg = c.gray300, bold = styles.keywords.bold, nocombine = true },
  }
end

return M
