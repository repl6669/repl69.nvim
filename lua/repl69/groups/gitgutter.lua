local Util = require("repl69.util")

local M = {}

M.url = "https://github.com/airblade/vim-gitgutter"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    GitGutterAdd          = { fg = Util.blend_bg(c.git.add, 0.60) }, 
    GitGutterChange       = { fg = Util.blend_bg(c.git.change, 0.60) }, 
    GitGutterDelete       = { fg = Util.blend_bg(c.git.delete, 0.60) }, 
    GitGutterAddLineNr    = { fg = Util.blend_bg(c.git.add, 0.60) },
    GitGutterChangeLineNr = { fg = Util.blend_bg(c.git.change, 0.60) },
    GitGutterDeleteLineNr = { fg = Util.blend_bg(c.git.delete, 0.60) },
  }
end

return M
