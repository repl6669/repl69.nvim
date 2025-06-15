local M = {}

---@param opts? repl69.Config
function M.load(opts)
  return require("repl69").load(opts)
end

---@param opts? repl69.Config
function M.setup(opts)
  require("repl69.config").setup(opts)
end

-- For backward compatibility
function M.colorscheme(variant)
  M.load({ style = variant or "darkness" })
end

return M