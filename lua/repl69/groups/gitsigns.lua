local M = {}

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- lewis6991/gitsigns.nvim
    GitSignsAdd                 = { fg = c.git.add, bg = "NONE" },
    GitSignsChange              = { fg = c.git.change, bg = "NONE" },
    GitSignsDelete              = { fg = c.git.delete, bg = "NONE" },
    GitSignsAddNr               = { fg = c.git.add, bg = "NONE" },
    GitSignsChangeNr            = { fg = c.git.change, bg = "NONE" },
    GitSignsDeleteNr            = { fg = c.git.delete, bg = "NONE" },
    GitSignsAddLn               = { bg = c.diff.add },
    GitSignsChangeLn            = { bg = c.diff.change },
    GitSignsDeleteLn            = { bg = c.diff.delete },
    GitSignsCurrentLineBlame    = { fg = c.gray700, italic = opts.styles.comments.italic },
    GitSignsAddInline           = { bg = c.diff.add },
    GitSignsChangeInline        = { bg = c.diff.change },
    GitSignsDeleteInline        = { bg = c.diff.delete },
    GitSignsAddLnInline         = { bg = c.diff.add },
    GitSignsChangeLnInline      = { bg = c.diff.change },
    GitSignsDeleteLnInline      = { bg = c.diff.delete },
    GitSignsDeleteVirtLn        = { bg = c.diff.delete },
    GitSignsDeleteVirtLnInLine  = { bg = c.diff.delete },
    GitSignsVirtLnum            = { fg = c.gray700, italic = opts.styles.comments.italic },
    
    -- Generic sign highlights (used by some plugins)
    SignAdd                     = { fg = c.git.add, bg = "NONE" },
    SignChange                  = { fg = c.git.change, bg = "NONE" },
    SignDelete                  = { fg = c.git.delete, bg = "NONE" },
  }
end

return M