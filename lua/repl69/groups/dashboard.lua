local M = {}

M.url = "https://github.com/nvimdev/dashboard-nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    -- General
    DashboardHeader           = { fg = c.gray200 },
    DashboardFooter           = { fg = c.gray400 },
    -- Hyper theme
    DashboardProjectTitle     = { fg = c.gray100 },
    DashboardProjectTitleIcon = { fg = c.gray300 },
    DashboardProjectIcon      = { fg = c.gray400 },
    DashboardMruTitle         = { fg = c.gray100 },
    DashboardMruIcon          = { fg = c.gray300 },
    DashboardFiles            = { fg = c.gray200 },
    DashboardShortCutIcon     = { fg = c.gray300 },
    -- Doome theme
    DashboardDesc             = { fg = c.gray100 },
    DashboardKey              = { fg = c.gray300, bold = styles.keywords.bold },
    DashboardIcon             = { fg = c.gray100 },
    DashboardShortCut         = { fg = c.gray100 },
  }
end

return M