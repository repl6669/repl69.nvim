local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/nvim-neo-tree/neo-tree.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local dark = opts.styles.sidebars == "transparent" and c.none or Util.blend(c.bg_sidebar, 0.8, "#000000")
  -- stylua: ignore
  return {
    NeoTreeDimText             = { fg = c.fg_gutter },
    NeoTreeFileName            = { fg = c.fg_sidebar },
    NeoTreeGitModified         = { fg = c.git.change },
    NeoTreeGitStaged           = { fg = c.git.add },
    NeoTreeGitUntracked        = { fg = c.git.untracked },
    NeoTreeNormal              = { fg = c.fg_sidebar, bg = opts.transparent and c.none or c.bg_sidebar },
    NeoTreeNormalNC            = { fg = c.fg_sidebar, bg = opts.transparent and c.none or c.bg_sidebar },
    NeoTreeTabActive           = { fg = c.gray200, bg = opts.transparent and c.none or c.bg_dark, bold = true },
    NeoTreeTabInactive         = { fg = c.gray600, bg = opts.transparent and c.none or dark },
    NeoTreeTabSeparatorActive  = { fg = c.gray200, bg = opts.transparent and c.none or c.bg_darker},
    NeoTreeTabSeparatorInactive= { fg = c.bg, bg = opts.transparent and c.none or dark },
  }
end

return M
