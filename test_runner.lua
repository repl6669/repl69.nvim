#!/usr/bin/env -S nvim -l

-- Simple test runner for repl69
vim.env.LAZY_STDPATH = ".tests"
load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"))()

-- Setup lazy
require("lazy.minit").setup({
  spec = {
    { "nvim-lua/plenary.nvim" },
    {
      dir = vim.uv.cwd(),
      opts = {},
    },
  },
})

-- Run colorscheme tests
print("=== Running Colorscheme Tests ===")
local Config = require("repl69.config")
local Init = require("repl69")

-- Test basic loading
print("Testing basic colorscheme loading...")
vim.o.background = "dark"
vim.cmd.colorscheme("default")
Config.setup()
Init.styles = {}

-- Test void (dark) theme
print("Testing void theme...")
vim.o.background = "dark"
vim.cmd.colorscheme("repl69")
if vim.g.colors_name == "repl69-void" then
  print("✅ Void theme loads correctly")
else
  print("❌ Void theme failed: " .. (vim.g.colors_name or "nil"))
end

-- Test dawn (light) theme
print("Testing dawn theme...")
vim.o.background = "light"
vim.cmd.colorscheme("repl69")
if vim.g.colors_name == "repl69-dawn" then
  print("✅ Dawn theme loads correctly")
else
  print("❌ Dawn theme failed: " .. (vim.g.colors_name or "nil"))
end

-- Test direct style loading
print("Testing direct style loading...")
vim.cmd.colorscheme("repl69-void")
if vim.g.colors_name == "repl69-void" then
  print("✅ Direct void loading works")
else
  print("❌ Direct void loading failed")
end

vim.cmd.colorscheme("repl69-dawn")
if vim.g.colors_name == "repl69-dawn" then
  print("✅ Direct dawn loading works")
else
  print("❌ Direct dawn loading failed")
end

print("=== Testing Groups ===")
local Groups = require("repl69.groups")
local colors = require("repl69.colors").setup(Config.defaults)
local highlights = Groups.setup(colors, Config.defaults)

if highlights and next(highlights) then
  print("✅ Groups generate highlights")
  print("Generated " .. vim.tbl_count(highlights) .. " highlight groups")
else
  print("❌ Groups failed to generate highlights")
end

-- Test some specific groups exist
local expected_groups = {"Normal", "Comment", "Function", "String"}
local missing = {}
for _, group in ipairs(expected_groups) do
  if not highlights[group] then
    table.insert(missing, group)
  end
end

if #missing == 0 then
  print("✅ All expected highlight groups present")
else
  print("❌ Missing highlight groups: " .. table.concat(missing, ", "))
end

print("=== Test Summary ===")
print("Repl69 colorscheme tests completed!")