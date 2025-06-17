local M = {}

M.url = "https://github.com/echasnovski/mini.hipatterns"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    MiniHipatternsFixme = { fg = c.error, bg = c.bg_border_error, bold = styles.keywords.bold },
    MiniHipatternsHack  = { fg = c.warning , bg = c.bg_border_warning, bold = styles.keywords.bold },
    MiniHipatternsNote  = { fg = c.hint, bg = c.bg_border_hint, bold = styles.keywords.bold },
    MiniHipatternsTodo  = { fg = c.info, bg = c.bg_border_info, bold = styles.keywords.bold },
  }
end

return M
