local Config = require("repl69.config")
local Groups = require("repl69.groups")

local base = { "base", "html", "markdown", "health", "lsp", "git", "semantic-tokens" }

before_each(function()
  Config.setup()
end)

describe("group is valid", function()
  for name in vim.fs.dir("lua/repl69/groups") do
    name = name:match("(.+)%.lua$")
    if name and name ~= "init" and not vim.list_contains(base, name) then
      it(name .. " has an url", function()
        local ok, group = pcall(require, "repl69.groups." .. name)
        assert.is_true(ok, name)
        assert.is_not_nil(group.url, name)
      end)
      it(name .. " has a plugin mapping", function()
        local mapping = false
        for k, v in pairs(Groups.plugins) do
          if v == name then
            mapping = true
            break
          end
        end
        assert.is_true(mapping, name)
      end)
    end
  end

  for _, name in pairs(Groups.plugins) do
    it(name .. " exists", function()
      local ok = pcall(require, "repl69.groups." .. name)
      assert(ok, name)
    end)
  end
end)

describe("group config", function()
  it("does all", function()
    local opts = Config.extend({ plugins = { all = true } })
    local all = {} ---@type table<string, boolean>
    for _, name in ipairs(base) do
      all[name] = true
    end
    for _, name in pairs(Groups.plugins) do
      all[name] = true
    end
    local colors = require("repl69.colors").setup(opts)
    local highlights = Groups.setup(colors, opts)
    local groups = {}
    for group in pairs(highlights) do
      groups[group] = true
    end
    -- Just check that we have highlights
    assert.is_not_nil(highlights)
    assert.is_true(next(highlights) ~= nil)
  end)

  it("does base", function()
    local opts = Config.extend({ plugins = { all = false, auto = false } })
    local all = {} ---@type table<string, boolean>
    for _, name in ipairs(base) do
      all[name] = true
    end
    local colors = require("repl69.colors").setup(opts)
    local highlights = Groups.setup(colors, opts)
    -- Just check that we have highlights
    assert.is_not_nil(highlights)
    assert.is_true(next(highlights) ~= nil)
  end)

  it("does dashboard", function()
    local opts = Config.extend({ plugins = {
      all = false,
      auto = false,
      dashboard = true,
    } })
    local all = {} ---@type table<string, boolean>
    for _, name in ipairs(base) do
      all[name] = true
    end
    all.dashboard = true
    local colors = require("repl69.colors").setup(opts)
    local highlights = Groups.setup(colors, opts)
    -- Just check that we have highlights
    assert.is_not_nil(highlights)
    assert.is_true(next(highlights) ~= nil)
  end)

  it("does dashboard.nvim", function()
    local opts = Config.extend({
      plugins = {
        all = false,
        auto = false,
        ["dashboard-nvim"] = true,
      },
    })
    local all = {} ---@type table<string, boolean>
    for _, name in ipairs(base) do
      all[name] = true
    end
    all.dashboard = true
    local colors = require("repl69.colors").setup(opts)
    local highlights = Groups.setup(colors, opts)
    -- Just check that we have highlights
    assert.is_not_nil(highlights)
    assert.is_true(next(highlights) ~= nil)
  end)
end)
