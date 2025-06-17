-- Test helpers and shared utilities
local Config = require("repl69.config")

local M = {}

-- Base groups that should always be present
M.base_groups = { "base", "kinds", "semantic_tokens", "treesitter" }

-- Common setup function
function M.setup_test_environment()
  Config.setup()
end

-- Helper to get colors and highlights with all plugins enabled
function M.get_full_setup()
  local colors = require("repl69.colors").setup()
  local opts = Config.extend({ plugins = { all = true } })
  local highlights, groups = require("repl69.groups").setup(colors, opts)
  return colors, highlights, groups, opts
end

-- Helper to get minimal setup (base only)
function M.get_minimal_setup()
  local colors = require("repl69.colors").setup()
  local opts = Config.extend({ plugins = { all = false, auto = false } })
  local highlights, groups = require("repl69.groups").setup(colors, opts)
  return colors, highlights, groups, opts
end

-- Helper to measure execution time
function M.measure_time(fn)
  local start_time = vim.uv.hrtime()
  local result = fn()
  local end_time = vim.uv.hrtime()
  local duration_ms = (end_time - start_time) / 1000000
  return result, duration_ms
end

return M