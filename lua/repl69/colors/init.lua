local Util = require("repl69.util")

local M = {}

---@type table<string, Palette|fun(opts:repl69.Config):Palette>
M.styles = setmetatable({}, {
  __index = function(_, style)
    return vim.deepcopy(Util.mod("repl69.colors." .. style))
  end,
})

---@param opts? repl69.Config
function M.setup(opts)
  opts = require("repl69.config").extend(opts)

  local palette = M.styles[opts.style]
  if type(palette) == "function" then
    palette = palette(opts) --[[@as Palette]]
  end

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = palette

  Util.bg = colors.bg
  Util.fg = colors.fg

  colors.none = "NONE"

  colors.diff = {
    add = Util.blend_bg(colors.git.add, 0.20),
    delete = Util.blend_bg(colors.git.delete, 0.20),
    change = Util.blend_bg(colors.git.change, 0.20),
    text = colors.git.change,
  }

  colors.black = Util.blend_bg(colors.bg, 0.8, "#000000")
  colors.border_highlight = Util.blend_bg(colors.gray300, 0.8)
  colors.border = colors.gray900

  -- Popups and statusline always get a dark background
  colors.bg_popup = opts.styles.floats == "transparent" and colors.none or colors.gray950
  colors.bg_statusline = colors.gray950

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
    or opts.styles.sidebars == "dark" and colors.gray950
    or colors.bg

  colors.bg_float = opts.styles.floats == "transparent" and colors.none
    or opts.styles.floats == "dark" and colors.gray950
    or colors.bg

  colors.bg_dark = colors.gray925
  colors.bg_search = colors.gray400
  colors.bg_visual = colors.gray800

  colors.fg_dark = colors.gray50
  colors.fg_float = colors.gray100
  colors.fg_gutter = colors.gray800
  colors.fg_sidebar = colors.gray500

  colors.error = colors.red700
  colors.warning = colors.orange700
  colors.info = colors.cyan700
  colors.hint = colors.green700
  colors.todo = colors.cyan700

  -- stylua: ignore
  --- @class TerminalColors
  colors.terminal = {
    black =             colors.gray750,
    black_bright =      colors.gray700,
    red =               colors.gray650,
    red_bright =        colors.gray600,
    green =             colors.gray550,
    green_bright =      colors.gray500,
    yellow =            colors.gray450,
    yellow_bright =     colors.gray400,
    blue =              colors.gray250,
    blue_bright =       colors.gray200,
    magenta =           colors.gray350,
    magenta_bright =    colors.gray300,
    cyan =              colors.gray100,
    cyan_bright =       colors.gray50,
    white =             colors.gray25,
    white_bright =      colors.white,
  }

  if opts.on_colors then
    opts.on_colors(colors)
  end

  return colors
end

return M
