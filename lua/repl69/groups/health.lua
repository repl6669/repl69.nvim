local M = {}

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- Health
    healthError                 = { fg = c.error },
    healthSuccess               = { fg = c.info },
    healthWarning               = { fg = c.warning },
  }
end

return M