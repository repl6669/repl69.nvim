local M = {}

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    -- Markdown
    markdownDelimiter           = { fg = c.gray500 },
    markdownH1                  = { fg = c.gray200, bold = styles.keywords.bold },
    markdownH1Delimiter         = "markdownH1",
    markdownH2                  = { fg = c.gray200, bold = styles.keywords.bold },
    markdownH2Delimiter         = "markdownH2",
    markdownH3                  = { fg = c.gray200, bold = styles.keywords.bold },
    markdownH3Delimiter         = "markdownH3",
    markdownH4                  = { fg = c.gray200, bold = styles.keywords.bold },
    markdownH4Delimiter         = "markdownH4",
    markdownH5                  = { fg = c.gray200, bold = styles.keywords.bold },
    markdownH5Delimiter         = "markdownH5",
    markdownH6                  = { fg = c.gray200, bold = styles.keywords.bold },
    markdownH6Delimiter         = "markdownH6",
    markdownLinkText            = "markdownUrl",
    markdownUrl                 = { fg = c.gray300, sp = c.gray300, underline = true },
  }
end

return M