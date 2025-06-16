local M = {}

M.url = "https://github.com/williamboman/mason.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- Mason window styling
    MasonNormal              = { fg = c.fg, bg = opts.transparent and c.none or c.bg_popup },
    MasonHeader              = { fg = c.gray100, bg = opts.transparent and c.none or c.bg_popup, bold = true },
    MasonBorder              = { fg = c.border, bg = opts.transparent and c.none or c.bg_popup },
    
    -- Mason highlight colors - override the bright defaults with grayscale
    MasonHighlight           = { fg = c.gray200 },
    MasonHighlightSecondary  = { fg = c.gray300 },
    MasonHighlightBlock      = { fg = c.gray100, bg = c.gray800 },
    MasonHighlightBlockBold  = { fg = c.gray100, bg = c.gray800, bold = true },
    MasonHighlightBlockSecondary = { fg = c.gray200, bg = c.gray750 },
    MasonHighlightBlockBoldSecondary = { fg = c.gray200, bg = c.gray750, bold = true },
    
    -- Mason mutued/dimmed text
    MasonMuted               = { fg = c.gray600 },
    MasonMutedBlock          = { fg = c.gray600, bg = c.gray850 },
    MasonMutedBlockBold      = { fg = c.gray600, bg = c.gray850, bold = true },
    
    -- Mason links and other elements
    MasonLink                = { fg = c.gray300 },
    MasonError               = { fg = c.error },
    MasonWarning             = { fg = c.warning },
  }
end

return M