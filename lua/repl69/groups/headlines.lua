local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/lukas-reineke/headlines.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    CodeBlock = { bg = c.bg_darker},
    Headline  = "Headline1",
  }
  
  local rainbow_colors = { c.red, c.orange, c.yellow, c.green, c.cyan, c.blue, c.purple, c.pink }
  for i, color in ipairs(rainbow_colors) do
    ret["Headline" .. i] = { bg = Util.blend_bg(color, 0.05) }
  end
  return ret
end

return M
