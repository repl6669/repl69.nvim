local M = {}

M.url = "https://github.com/echasnovski/mini.animate"

---@type repl69.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniAnimateCursor      = { reverse = true, nocombine = true },
    MiniAnimateNormalFloat = "NormalFloat",
  }
end

return M