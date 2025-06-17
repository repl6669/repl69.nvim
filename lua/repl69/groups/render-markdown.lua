local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    RenderMarkdownBullet    = {fg = c.orange}, -- horizontal rule
    RenderMarkdownCode      = { bg = c.bg_darker},
    RenderMarkdownDash      = {fg = c.orange}, -- horizontal rule
    RenderMarkdownTableHead = { fg = c.orange},
    RenderMarkdownTableRow  = { fg = c.orange700},
    RenderMarkdownCodeInline = "@markup.raw.markdown_inline"
  }

  local rainbow_colors = {
    c.green500,
    c.orange500,
    c.yellow500,
    c.red500,
    c.pink500,
    c.purple500,
    c.blue500,
    c.cyan500,
  }

  for i, color in ipairs(rainbow_colors) do
    ret["RenderMarkdownH" .. i .. "Bg"] = { bg = Util.blend_bg(color, 0.2) }
    ret["RenderMarkdownH" .. i .. "Fg"] = { fg = color, bold = true }
  end
  return ret
end

return M
