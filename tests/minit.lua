#!/usr/bin/env -S nvim -l

vim.env.LAZY_STDPATH = ".tests"
vim.env.LAZY_PATH = vim.fs.normalize("~/projects/lazy.nvim")
load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"))()

require("lazy.minit").setup({
  spec = {
    { "nvim-lua/plenary.nvim" },
    {
      dir = vim.uv.cwd(),
      opts = {},
    },
  },
})

-- Run tests with plenary
if vim.v.argv[#vim.v.argv] == "--minitest" then
  require("plenary.test_harness").test_directory("tests/")
end
