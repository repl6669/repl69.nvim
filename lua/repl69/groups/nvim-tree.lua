local M = {}

M.url = "https://github.com/kyazdani42/nvim-tree.lua"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    NvimTreeFolderIcon   = { bg = c.none, fg = c.gray200 },
    NvimTreeGitDeleted   = { fg = c.git.delete },
    NvimTreeGitDirty     = { fg = c.git.change },
    NvimTreeGitNew       = { fg = c.git.add },
    NvimTreeImageFile    = { fg = c.gray500 },
    NvimTreeIndentMarker = { fg = c.gray800 },
    NvimTreeNormal       = { fg = c.gray500, bg = c.bg_sidebar },
    NvimTreeNormalNC     = { fg = c.gray500, bg = c.bg_sidebar },
    NvimTreeOpenedFile   = { bg = c.bg_highlight },
    NvimTreeRootFolder   = { fg = c.gray200, bold = styles.keywords.bold },
    NvimTreeSpecialFile  = { fg = c.gray300, underline = true },
    NvimTreeSymlink      = { fg = c.gray200 },
    NvimTreeWinSeparator = { fg = styles.sidebars == "transparent" and c.border or c.bg_sidebar, bg = c.bg_sidebar },
  }
end

return M