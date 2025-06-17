local Config = require("repl69.config")
local Groups = require("repl69.groups")
local test_helpers = require("tests.test_helpers")

before_each(function()
  test_helpers.setup_test_environment()
end)

describe("configuration", function()
  describe("edge cases", function()
    it("handles empty plugin list", function()
      local opts = Config.extend({ plugins = {} })
      local colors = require("repl69.colors").setup(opts)
      local highlights, groups = Groups.setup(colors, opts)

      assert.is_table(highlights, "highlights should be a table")
      assert.is_table(groups, "groups should be a table")
      -- Should still have base groups
      assert.is_true(groups.base == true, "base group should be enabled")
    end)

    it("handles conflicting plugin settings", function()
      local opts = Config.extend({
        plugins = {
          all = true,
          auto = false,
          telescope = false, -- Conflicting with all = true
        },
      })
      local colors = require("repl69.colors").setup(opts)
      local highlights, groups = Groups.setup(colors, opts)

      -- Should still work without errors
      assert.is_table(highlights, "highlights should be a table")
      assert.is_table(groups, "groups should be a table")
    end)

    it("handles invalid plugin names gracefully", function()
      local opts = Config.extend({
        plugins = {
          ["nonexistent-plugin"] = true,
          ["another-fake-plugin"] = true,
        },
      })
      local colors = require("repl69.colors").setup(opts)
      local highlights, groups = Groups.setup(colors, opts)

      -- Should still work without errors
      assert.is_table(highlights, "highlights should be a table")
      assert.is_table(groups, "groups should be a table")
    end)
  end)

  describe("plugin configuration scenarios", function()
    it("configures all plugins", function()
      local opts = Config.extend({ plugins = { all = true } })
      local expected = {}
      for _, name in ipairs(test_helpers.base_groups) do
        expected[name] = true
      end
      for _, name in pairs(Groups.plugins) do
        expected[name] = true
      end
      local colors = require("repl69.colors").setup(opts)
      local _, groups = Groups.setup(colors, opts)
      assert.same(expected, groups)
    end)

    it("configures base groups only", function()
      local opts = Config.extend({ plugins = { all = false, auto = false } })
      local expected = {}
      for _, name in ipairs(test_helpers.base_groups) do
        expected[name] = true
      end
      local colors = require("repl69.colors").setup(opts)
      local _, groups = Groups.setup(colors, opts)
      assert.same(expected, groups)
    end)

    it("configures specific plugin (dashboard)", function()
      local opts = Config.extend({
        plugins = {
          all = false,
          auto = false,
          dashboard = true,
        },
      })
      local expected = {}
      for _, name in ipairs(test_helpers.base_groups) do
        expected[name] = true
      end
      expected.dashboard = true
      local colors = require("repl69.colors").setup(opts)
      local _, groups = Groups.setup(colors, opts)
      assert.same(expected, groups)
    end)

    it("handles plugin name aliases (dashboard.nvim -> dashboard)", function()
      local opts = Config.extend({
        plugins = {
          all = false,
          auto = false,
          ["dashboard-nvim"] = true,
        },
      })
      local expected = {}
      for _, name in ipairs(test_helpers.base_groups) do
        expected[name] = true
      end
      expected.dashboard = true
      local colors = require("repl69.colors").setup(opts)
      local _, groups = Groups.setup(colors, opts)
      assert.same(expected, groups)
    end)
  end)
end)