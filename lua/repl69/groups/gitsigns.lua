local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/lewis6991/gitsigns.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    GitSignsAdd    = { fg = Util.blend_bg(c.git.add, 0.60) },
    GitSignsChange = { fg = Util.blend_bg(c.git.change, 0.60) },
    GitSignsDelete = { fg = Util.blend_bg(c.git.delete, 0.60) },
  }
end

return M
