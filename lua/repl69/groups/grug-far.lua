local M = {}

M.url = "https://github.com/MagicDuck/grug-far.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    GrugFarHelpHeader             = { fg = c.comment },
    GrugFarHelpHeaderKey          = { fg = c.cyan },
    GrugFarInputLabel             = { fg = c.blue },
    GrugFarInputPlaceholder       = { fg = c.gray850 },
    GrugFarResultsChangeIndicator = { fg = c.git.change },
    GrugFarResultsHeader          = { fg = c.orange },
    GrugFarResultsLineColumn      = { fg = c.gray850 },
    GrugFarResultsLineNo          = { fg = c.gray850 },
    GrugFarResultsMatch           = { fg = c.black, bg = c.red },
    GrugFarResultsStats           = { fg = c.blue },
  }
end

return M