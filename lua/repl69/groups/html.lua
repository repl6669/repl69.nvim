local M = {}

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    -- HTML
    htmlArg                     = { fg = c.gray300 },
    htmlBold                    = { bold = styles.keywords.bold },
    htmlEndTag                  = { fg = c.gray500 },
    htmlH1                      = "markdownH1",
    htmlH2                      = "markdownH2",
    htmlH3                      = "markdownH3",
    htmlH4                      = "markdownH4",
  }
end

return M