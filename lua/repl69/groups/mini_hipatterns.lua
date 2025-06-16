local M = {}

M.url = "https://github.com/echasnovski/mini.hipatterns"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    MiniHipatternsFixme = { fg = c.black, bg = c.error, bold = styles.keywords.bold },
    MiniHipatternsHack  = { fg = c.black, bg = c.warning, bold = styles.keywords.bold },
    MiniHipatternsNote  = { fg = c.black, bg = c.hint, bold = styles.keywords.bold },
    MiniHipatternsTodo  = { fg = c.black, bg = c.info, bold = styles.keywords.bold },
  }
end

return M