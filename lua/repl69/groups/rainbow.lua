local M = {}

M.url = "https://github.com/HiPhish/rainbow-delimiters.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- rainbow-delimiters - using grayscale progression for repl69
    RainbowDelimiterRed    = { fg = c.gray100 },
    RainbowDelimiterOrange = { fg = c.gray200 },
    RainbowDelimiterYellow = { fg = c.gray300 },
    RainbowDelimiterGreen  = { fg = c.gray400 },
    RainbowDelimiterBlue   = { fg = c.gray500 },
    RainbowDelimiterViolet = { fg = c.gray600 },
    RainbowDelimiterCyan   = { fg = c.gray700 },
  }
end

return M