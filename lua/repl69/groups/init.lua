local Config = require("repl69.config")
local Util = require("repl69.util")

M.plugins = {
  ["aerial.nvim"]                   = "aerial",
  ["ale"]                           = "ale",
  ["aerial.nvim"]                   = "aerial",
  ["ale"]                           = "ale",
  ["alpha-nvim"]                    = "alpha",
  ["alpha-nvim"]                    = "alpha",
  ["barbar.nvim"]                   = "barbar",
  ["blink.cmp"]                     = "blink",
  ["barbar.nvim"]                   = "barbar",
  ["blink.cmp"]                     = "blink",
  ["bufferline.nvim"]               = "bufferline",
  ["codeium.nvim"]                  = "codeium",
  ["copilot.lua"]                   = "copilot",
  ["copilot.lua"]                   = "copilot",
  ["dashboard-nvim"]                = "dashboard",
  ["flash.nvim"]                    = "flash",
  ["dashboard-nvim"]                = "dashboard",
  ["flash.nvim"]                    = "flash",
  ["fzf-lua"]                       = "fzf",
  ["gitsigns.nvim"]                 = "gitsigns",
  ["gitgutter"]                     = "gitgutter",
  ["grug-far.nvim"]                 = "grug-far",
  ["headlines.nvim"]                = "headlines",
  ["hop.nvim"]                      = "hop",
  ["indent-blankline.nvim"]         = "indent-blankline",
  ["hop.nvim"]                      = "hop",
  ["indent-blankline.nvim"]         = "indent-blankline",
  ["leap.nvim"]                     = "leap",
  ["indentmini.nvim"]               = "indentmini",
  ["lazy.nvim"]                     = "lazy",
  ["leap.nvim"]                     = "leap",
  ["lspsaga.nvim"]                  = "lspsaga",
  ["mini.cursorword"]               = "mini_cursorword",
  ["mini.indentscope"]              = "mini_indentscope",
  ["mini.pick"]                     = "mini_pick",
  ["mini.starter"]                  = "mini_starter",
  ["mini.statusline"]               = "mini_statusline",
  ["mini.surround"]                 = "mini_surround",
  ["mini.tabline"]                  = "mini_tabline",
  ["mini.test"]                     = "mini_test",
  ["mini.trailspace"]               = "mini_trailspace",
  ["mini.animate"]                  = "mini_animate",
  ["mini.clue"]                     = "mini_clue",
  ["mini.completion"]               = "mini_completion",
  ["mini.completion"]               = "mini_completion",
  ["mini.cursorword"]               = "mini_cursorword",
  ["mini.deps"]                     = "mini_deps",
  ["mini.diff"]                     = "mini_diff",
  ["mini.files"]                    = "mini_files",
  ["mini.diff"]                     = "mini_diff",
  ["mini.files"]                    = "mini_files",
  ["mini.hipatterns"]               = "mini_hipatterns",
  ["mini.hipatterns"]               = "mini_hipatterns",
  ["mini.icons"]                    = "mini_icons",
  ["mini.indentscope"]              = "mini_indentscope",
  ["mini.jump"]                     = "mini_jump",
  ["mini.map"]                      = "mini_map",
  ["mini.notify"]                   = "mini_notify",
  ["mini.operators"]                = "mini_operators",
  ["mini.jump"]                     = "mini_jump",
  ["mini.map"]                      = "mini_map",
  ["mini.notify"]                   = "mini_notify",
  ["mini.operators"]                = "mini_operators",
  ["mini.pick"]                     = "mini_pick",
  ["mini.starter"]                  = "mini_starter",
  ["mini.statusline"]               = "mini_statusline",
  ["mini.surround"]                 = "mini_surround",
  ["mini.tabline"]                  = "mini_tabline",
  ["mini.test"]                     = "mini_test",
  ["mini.trailspace"]               = "mini_trailspace",
  ["neo-tree.nvim"]                 = "neo-tree",
  ["neogit"]                        = "neogit",
  ["neotest"]                       = "neotest",
  ["noice.nvim"]                    = "noice",
  ["neotest"]                       = "neotest",
  ["noice.nvim"]                    = "noice",
  ["nvim-cmp"]                      = "cmp",
  ["nvim-dap-ui"]                   = "dap",
  ["nvim-dap-ui"]                   = "dap",
  ["nvim-navic"]                    = "navic",
  ["nvim-notify"]                   = "notify",
  ["nvim-tree.lua"]                 = "nvim-tree",
  ["nvim-tree.lua"]                 = "nvim-tree",
  ["nvim-treesitter"]               = "treesitter",
  ["nvim-treesitter-context"]       = "treesitter-context",
  ["nvim-web-devicons"]             = "devicons",
  ["octo.nvim"]                     = "octo",
  ["pounce.nvim"]                   = "pounce",
  ["rainbow-delimiters.nvim"]       = "rainbow",
  ["rainbow-delimiters.nvim"]       = "rainbow",
  ["render-markdown.nvim"]          = "render-markdown",
  ["scrollbar.nvim"]                = "scrollbar",
  ["snacks.nvim"]                   = "snacks",
  ["telescope.nvim"]                = "telescope",
  ["trouble.nvim"]                  = "trouble",
  ["vim-illuminate"]                = "illuminate",
  ["vim-sneak"]                     = "sneak",
  ["which-key.nvim"]                = "which-key",
  ["yanky.nvim"]                    = "yanky",
  ["html"]                          = "html",
  ["markdown"]                      = "markdown",
  ["health"]                        = "health",
  ["lsp"]                           = "lsp",
  ["git"]                           = "git",
  ["semantic-tokens"]               = "semantic-tokens",
}

---@param colors ColorScheme
---@param opts repl69.Config
---@return repl69.Highlights
function M.setup(colors, opts)
  local groups = {
    base = true,
    html = true,
    markdown = true,
    health = true,
    lsp = true,
    git = true,
    ["semantic-tokens"] = true,
    gitsigns = true,
    gitgutter = true,
  }

  local ret = {}
  for group, enabled in pairs(groups) do
    if enabled then
      local ok, mod = pcall(require, "repl69.groups." .. group)
      if ok and type(mod.get) == "function" then
        local highlights = mod.get(colors, opts)
        ret = vim.tbl_extend("force", ret, highlights)
      end
    end
  end

  -- Enable plugins
  if opts.plugins.all then
    for plugin, group in pairs(M.plugins) do
      groups[group] = true
    end
  elseif opts.plugins.auto and package.loaded.lazy then
    local plugins = require("lazy").plugins()
    for _, plugin in pairs(plugins) do
      if M.plugins[plugin.name] then
        groups[M.plugins[plugin.name]] = true
      end
    end
  end

  for group, enabled in pairs(opts.plugins) do
    if type(enabled) == "table" then
      enabled = enabled.enabled
    end
    if enabled and M.plugins[group] then
      groups[M.plugins[group]] = enabled
    elseif type(enabled) == "boolean" then
      groups[group] = enabled
    end
  end

  for group, enabled in pairs(groups) do
    if enabled and group ~= "base" and group ~= "gitsigns" and group ~= "gitgutter" then
      local ok, mod = pcall(require, "repl69.groups." .. group)
      if ok and type(mod.get) == "function" then
        local highlights = mod.get(colors, opts)
        ret = vim.tbl_extend("force", ret, highlights)
      end
    end
  end

  if opts.on_highlights then
    opts.on_highlights(ret, colors)
  end

  return ret
end

return M