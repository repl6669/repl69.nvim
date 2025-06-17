local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    RenderMarkdownBullet    = {fg = c.orange}, -- horizontal rule
    RenderMarkdownCode      = { bg = c.bg_dark },
    RenderMarkdownDash      = {fg = c.orange}, -- horizontal rule
    RenderMarkdownTableHead = { fg = c.red},
    RenderMarkdownTableRow  = { fg = c.orange},
    RenderMarkdownCodeInline = "@markup.raw.markdown_inline"
  }
  
  local rainbow_colors = { c.red, c.orange, c.yellow, c.green, c.cyan, c.blue, c.purple, c.pink }
  for i, color in ipairs(rainbow_colors) do
    ret["RenderMarkdownH" .. i .. "Bg"] = { bg = Util.blend_bg(color, 0.1) }
    ret["RenderMarkdownH" .. i .. "Fg"] = { fg = color, bold = true }
  end
  return ret
end

return M