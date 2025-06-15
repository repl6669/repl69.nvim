local config = require("repl69.config")

local M = {}
---@type {light?: string, dark?: string}
M.styles = {}

---@param opts? repl69.Config
function M.load(opts)
  opts = require("repl69.config").extend(opts)
  local bg = vim.o.background
  local style_bg = opts.style == "day" and "light" or "dark" -- repl69 only has dark variant, but keeping structure

  if bg ~= style_bg then
    if vim.g.colors_name == "repl69-" .. opts.style then
      opts.style = bg == "light" and (M.styles.light or "darkness") or (M.styles.dark or "darkness")
    else
      vim.o.background = style_bg
    end
  end
  M.styles[vim.o.background] = opts.style
  return require("repl69.theme").setup(opts)
end

M.setup = config.setup

return M