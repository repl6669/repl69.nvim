local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/folke/snacks.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    -- Notifications
    SnacksNotifierDebug       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderDebug = { fg = c.bg_border_comment, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconDebug   = { fg = c.comment },
    SnacksNotifierTitleDebug  = { fg = c.comment },
    SnacksNotifierError       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderError = { fg = c.bg_border_error, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconError   = { fg = c.error },
    SnacksNotifierTitleError  = { fg = c.error },
    SnacksNotifierInfo        = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderInfo  = { fg = c.bg_border_info, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconInfo    = { fg = c.info },
    SnacksNotifierTitleInfo   = { fg = c.info },
    SnacksNotifierTrace       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderTrace = { fg = c.bg_border_trace, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconTrace   = { fg = c.purple },
    SnacksNotifierTitleTrace  = { fg = c.purple },
    SnacksNotifierWarn        = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderWarn  = { fg = c.bg_border_warning, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconWarn    = { fg = c.warning },

    -- Dashboard
    SnacksDashboardDesc       = { fg = c.gray400 },
    SnacksDashboardFooter     = { fg = c.gray500 },
    SnacksDashboardHeader     = { fg = c.green },
    SnacksDashboardIcon       = { fg = c.gray300 },
    SnacksDashboardKey        = { fg = c.gray200 },
    SnacksDashboardSpecial    = { fg = c.gray600 },
    SnacksDashboardDir        = { fg = c.gray850 },

    -- Profiler
    SnacksProfilerIconInfo    = { bg = Util.blend_bg(c.blue100, 0.30), fg = c.blue100 },
    SnacksProfilerBadgeInfo   = { bg = Util.blend_bg(c.blue100, 0.15), fg = c.blue100 },
    SnacksScratchKey          = "SnacksProfilerIconInfo",
    SnacksScratchDesc         = "SnacksProfilerBadgeInfo",
    SnacksProfilerIconTrace   = { bg = Util.blend_bg(c.blue700, 0.30), fg = c.gray300 },
    SnacksProfilerBadgeTrace  = { bg = Util.blend_bg(c.blue700, 0.15), fg = c.gray300 },

    -- Indent
    SnacksIndent              = { fg = c.gray850, nocombine = true },
    SnacksIndentScope         = { fg = c.gray600, nocombine = true },

    -- Zen
    SnacksZenIcon             = { fg = c.purple },

    -- Input
    SnacksInputPrompt         = { fg = c.orange700 },
    SnacksInputIcon           = { fg = c.orange700 },
    SnacksInputTitle          = { fg = c.orange700 },
    SnacksInputBorder         = "FloatBorder",

    -- Picker
    SnacksPickerInputTitle         = { fg = c.orange700, bg = c.bg_float },
    SnacksPickerBoxTitle         = { fg = c.orange700, bg = c.bg_float },
    SnacksPickerInputBorder   = "FloatBorder",
    SnacksPickerSelected    = { fg = c.pink500},
    SnacksPickerToggle         = "SnacksProfilerBadgeInfo",
    SnacksPickerPickWinCurrent   = { fg = c.fg, bg = c.pink700, bold = true },
    SnacksPickerPickWin   = { fg = c.gray100, bg = c.bg_search, bold = true },
  }

  -- Use consistent gray colors for all indent levels instead of rainbow
  for i = 1, 8 do
    ret["SnacksIndent" .. i] = { fg = c.gray850, nocombine = true }
  end
  return ret
end

return M
