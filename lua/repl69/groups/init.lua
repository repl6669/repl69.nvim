local Config = require("repl69.config")
local Util = require("repl69.util")

local M = {}

M.plugins = {
  ["ale"] = "ale",
  ["aerial.nvim"] = "aerial",
  ["alpha-nvim"] = "alpha",
  ["barbar.nvim"] = "barbar",
  ["blink.cmp"] = "blink",
  ["bufferline.nvim"] = "bufferline",
  ["codeium.nvim"] = "codeium",
  ["copilot.lua"] = "copilot",
  ["dashboard-nvim"] = "dashboard",
  ["flash.nvim"] = "flash",
  ["fzf-lua"] = "fzf",
  ["gitsigns.nvim"] = "gitsigns",
  ["gitgutter"] = "gitgutter",
  ["grug-far.nvim"] = "grug-far",
  ["headlines.nvim"] = "headlines",
  ["hop.nvim"] = "hop",
  ["indent-blankline.nvim"] = "indent-blankline",
  ["leap.nvim"] = "leap",
  ["indentmini.nvim"] = "indentmini",
  ["lazy.nvim"] = "lazy",
  ["lspsaga.nvim"] = "lspsaga",
  ["mini.cursorword"] = "mini_cursorword",
  ["mini.indentscope"] = "mini_indentscope",
  ["mini.pick"] = "mini_pick",
  ["mini.starter"] = "mini_starter",
  ["mini.statusline"] = "mini_statusline",
  ["mini.surround"] = "mini_surround",
  ["mini.tabline"] = "mini_tabline",
  ["mini.test"] = "mini_test",
  ["mini.trailspace"] = "mini_trailspace",
  ["mini.animate"] = "mini_animate",
  ["mini.clue"] = "mini_clue",
  ["mini.completion"] = "mini_completion",
  ["mini.deps"] = "mini_deps",
  ["mini.diff"] = "mini_diff",
  ["mini.files"] = "mini_files",
  ["mini.hipatterns"] = "mini_hipatterns",
  ["mini.icons"] = "mini_icons",
  ["mini.jump"] = "mini_jump",
  ["mini.map"] = "mini_map",
  ["mini.notify"] = "mini_notify",
  ["mini.operators"] = "mini_operators",
  ["neo-tree.nvim"] = "neo-tree",
  ["neogit"] = "neogit",
  ["neotest"] = "neotest",
  ["noice.nvim"] = "noice",
  ["nvim-cmp"] = "cmp",
  ["nvim-dap-ui"] = "dap",
  ["nvim-navic"] = "navic",
  ["nvim-notify"] = "notify",
  ["nvim-tree.lua"] = "nvim-tree",
  ["nvim-treesitter"] = "treesitter",
  ["nvim-treesitter-context"] = "treesitter-context",
  ["nvim-scrollbar"] = "scrollbar",
  ["octo.nvim"] = "octo",
  ["rainbow-delimiters.nvim"] = "rainbow",
  ["render-markdown.nvim"] = "render-markdown",
  ["snacks.nvim"] = "snacks",
  ["supermaven-nvim"] = "supermaven",
  ["telescope.nvim"] = "telescope",
  ["trouble.nvim"] = "trouble",
  ["vim-glyph-palette"] = "glyph-palette",
  ["vim-illuminate"] = "illuminate",
  ["vim-sneak"] = "sneak",
  ["vimwiki"] = "vimwiki",
  ["which-key.nvim"] = "which-key",
  ["yanky.nvim"] = "yanky",
}

local me = debug.getinfo(1, "S").source:sub(2)
me = vim.fn.fnamemodify(me, ":h")

function M.get_group(name)
  ---@type {get: repl69.HighlightsFn, url: string}
  return Util.mod("repl69.groups." .. name)
end

---@param colors ColorScheme
---@param opts repl69.Config
function M.get(name, colors, opts)
  local mod = M.get_group(name)
  return mod.get(colors, opts)
end

---@param colors ColorScheme
---@param opts repl69.Config
---@return repl69.Highlights
function M.setup(colors, opts)
  local groups = {
    base = true,
    kinds = true,
    semantic_tokens = true,
    treesitter = true,
  }

  if opts.plugins.all then
    for _, group in pairs(M.plugins) do
      groups[group] = true
    end
  elseif opts.plugins.auto and package.loaded.lazy then
    local plugins = require("lazy.core.config").plugins
    for plugin, group in pairs(M.plugins) do
      if plugins[plugin] then
        groups[group] = true
      end
    end

    -- special case for mini.nvim
    if plugins["mini.nvim"] then
      for _, group in pairs(M.plugins) do
        if group:find("^mini_") then
          groups[group] = true
        end
      end
    end
  end

  -- manually enable/disable plugins
  for plugin, group in pairs(M.plugins) do
    local use = opts.plugins[group]
    use = use == nil and opts.plugins[plugin] or use
    if use ~= nil then
      if type(use) == "table" then
        use = use.enabled
      end
      groups[group] = use or nil
    end
  end

  local names = vim.tbl_keys(groups)
  table.sort(names)

  local cache_key = opts.style
  local cache = opts.cache and Util.cache.read(cache_key)

  local inputs = {
    colors = colors,
    plugins = names,
    version = Config.version,
    opts = { transparent = opts.transparent, styles = opts.styles, dim_inactive = opts.dim_inactive },
  }

  local ret = cache and vim.deep_equal(inputs, cache.inputs) and cache.groups

  if not ret then
    ret = {}
    -- merge highlights
    for group in pairs(groups) do
      for k, v in pairs(M.get(group, colors, opts)) do
        ret[k] = v
      end
    end
    Util.resolve(ret)
    if opts.cache then
      Util.cache.write(cache_key, { groups = ret, inputs = inputs })
    end
  end
  opts.on_highlights(ret, colors)

  return ret, groups
end

return M
