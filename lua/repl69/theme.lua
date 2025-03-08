-- local M = {}
--
-- ---@param opts? repl69.Config
-- function M.setup(opts)
--   opts = require("repl69.config").extend(opts)
--
--   local colors = require("repl69.colors").setup(opts)
--   local groups = require("repl69.groups").setup(colors, opts)
--
--   -- only needed to clear when not the default colorscheme
--   if vim.g.colors_name then
--     vim.cmd("hi clear")
--   end
--
--   vim.o.termguicolors = true
--   vim.g.colors_name = "repl69-" .. opts.variant
--
--   for group, hl in pairs(groups) do
--     hl = type(hl) == "string" and { link = hl } or hl
--     vim.api.nvim_set_hl(0, group, hl)
--   end
--
--   if opts.terminal_colors then
--     M.terminal(colors)
--   end
--
--   return colors, groups, opts
-- end
--
-- ---@param colors ColorScheme
-- function M.terminal(colors)
--   -- Dark
--   vim.g.terminal_color_0 = colors.gray750
--   vim.g.terminal_color_8 = colors.gray700
--
--   -- Light
--   vim.g.terminal_color_7 = colors.gray25
--   vim.g.terminal_color_15 = colors.white
--
--   -- Red
--   vim.g.terminal_color_1 = colors.gray650
--   vim.g.terminal_color_9 = colors.gray600
--
--   -- Green
--   vim.g.terminal_color_2 = colors.gray550
--   vim.g.terminal_color_10 = colors.gray500
--
--   -- Yellow
--   vim.g.terminal_color_3 = colors.gray450
--   vim.g.terminal_color_11 = colors.gray400
--
--   -- Blue
--   vim.g.terminal_color_4 = colors.gray250
--   vim.g.terminal_color_12 = colors.gray200
--
--   -- Magenta
--   vim.g.terminal_color_5 = colors.gray350
--   vim.g.terminal_color_13 = colors.gray300
--
--   -- Cyan
--   vim.g.terminal_color_6 = colors.gray100
--   vim.g.terminal_color_14 = colors.gray50
-- end
--
-- return M
