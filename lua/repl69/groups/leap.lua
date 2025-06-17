local M = {}

M.url = "https://github.com/ggandor/leap.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    LeapMatch          = { bg = c.gray200, fg = c.black, bold = styles.keywords.bold },
    LeapLabel          = { fg = c.gray200, bold = styles.keywords.bold },
    LeapBackdrop       = { fg = c.gray850 },
  }
end

return M