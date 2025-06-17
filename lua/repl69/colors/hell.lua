---@param opts repl69.Config
return function(opts)
  local style = opts.light_style or "void"
  style = style == "hell" and "void" or style

  local Util = require("repl69.util")

  ---@type Palette
  local colors = vim.deepcopy(Util.mod("repl69.colors." .. style))

  ---@type Palette

  Util.invert(colors)
  colors.bg_darker= Util.blend(colors.bg, 0.9, colors.fg)
  colors.bg_dark = Util.blend(colors.bg_dark, 0.9, colors.fg)
  return colors
end
