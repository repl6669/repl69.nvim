local Groups = require("repl69.groups")
local test_helpers = require("tests.test_helpers")

before_each(function()
  test_helpers.setup_test_environment()
end)

describe("group validation", function()
  describe("group files", function()
    for name in vim.fs.dir("lua/repl69/groups") do
      name = name:match("(.+)%.lua$")
      if name and name ~= "init" and not vim.list_contains(test_helpers.base_groups, name) then
        it(name .. " has a url", function()
          local group = Groups.get_group(name)
          assert.is_not_nil(group, "Group " .. name .. " should exist")
          assert.is_not_nil(group.url, "Group " .. name .. " should have a url")
        end)

        it(name .. " has a plugin mapping", function()
          local mapping = false
          for k, v in pairs(Groups.plugins) do
            if v == name then
              mapping = true
              break
            end
          end
          assert.is_true(mapping, "Group " .. name .. " should have a plugin mapping")
        end)
      end
    end
  end)

  describe("plugin mappings", function()
    for _, name in pairs(Groups.plugins) do
      it(name .. " group exists", function()
        local ok = pcall(Groups.get_group, name)
        assert(ok, "Group " .. name .. " should be loadable")
      end)
    end
  end)

  describe("group configuration", function()
    it("enables all groups when all = true", function()
      local _, _, groups = test_helpers.get_full_setup()
      
      local expected = {}
      for _, name in ipairs(test_helpers.base_groups) do
        expected[name] = true
      end
      for _, name in pairs(Groups.plugins) do
        expected[name] = true
      end
      
      assert.same(expected, groups)
    end)

    it("enables only base groups when all = false", function()
      local _, _, groups = test_helpers.get_minimal_setup()
      
      local expected = {}
      for _, name in ipairs(test_helpers.base_groups) do
        expected[name] = true
      end
      
      assert.same(expected, groups)
    end)

    it("enables specific plugins", function()
      local Config = require("repl69.config")
      local colors = require("repl69.colors").setup()
      local opts = Config.extend({
        plugins = {
          all = false,
          auto = false,
          dashboard = true,
        },
      })
      local _, groups = Groups.setup(colors, opts)

      local expected = {}
      for _, name in ipairs(test_helpers.base_groups) do
        expected[name] = true
      end
      expected.dashboard = true

      assert.same(expected, groups)
    end)

    it("handles plugin name mappings", function()
      local Config = require("repl69.config")
      local colors = require("repl69.colors").setup()
      local opts = Config.extend({
        plugins = {
          all = false,
          auto = false,
          ["dashboard-nvim"] = true, -- This should map to "dashboard"
        },
      })
      local _, groups = Groups.setup(colors, opts)

      local expected = {}
      for _, name in ipairs(test_helpers.base_groups) do
        expected[name] = true
      end
      expected.dashboard = true

      assert.same(expected, groups)
    end)
  end)
end)