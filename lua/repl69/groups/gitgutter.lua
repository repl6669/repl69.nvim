local M = {}

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- airblade/vim-gitgutter
    GitGutterAdd                = { fg = c.git.add, bg = "NONE" },
    GitGutterChange             = { fg = c.git.change, bg = "NONE" },
    GitGutterDelete             = { fg = c.git.delete, bg = "NONE" },
    GitGutterChangeDelete       = { fg = c.git.change, bg = "NONE" },
    GitGutterAddLine            = { bg = c.diff.add },
    GitGutterChangeLine         = { bg = c.diff.change },
    GitGutterDeleteLine         = { bg = c.diff.delete },
    GitGutterChangeDeleteLine   = { bg = c.diff.change },
    GitGutterAddLineNr          = { fg = c.git.add, bg = "NONE" },
    GitGutterChangeLineNr       = { fg = c.git.change, bg = "NONE" },
    GitGutterDeleteLineNr       = { fg = c.git.delete, bg = "NONE" },
    GitGutterChangeDeleteLineNr = { fg = c.git.change, bg = "NONE" },
  }
end

return M