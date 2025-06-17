local Config = require("repl69.config")
local Groups = require("repl69.groups")
local test_helpers = require("tests.test_helpers")

before_each(function()
  test_helpers.setup_test_environment()
end)

describe("performance", function()
  describe("highlight generation speed", function()
    it("generates highlights quickly with all plugins", function()
      local highlights, duration_ms = test_helpers.measure_time(function()
        local colors = require("repl69.colors").setup()
        local highlights, _ = Groups.setup(colors, Config.extend({ plugins = { all = true } }))
        return highlights
      end)

      assert(duration_ms < 100, "Highlight generation took too long: " .. duration_ms .. "ms")
      assert.is_table(highlights, "highlights should be generated")
    end)

    it("generates base highlights quickly", function()
      local highlights, duration_ms = test_helpers.measure_time(function()
        local colors = require("repl69.colors").setup()
        local highlights, _ = Groups.setup(colors, Config.extend({ plugins = { all = false, auto = false } }))
        return highlights
      end)

      assert(duration_ms < 50, "Base highlight generation took too long: " .. duration_ms .. "ms")
      assert.is_table(highlights, "highlights should be generated")
    end)
  end)

  describe("color setup speed", function()
    it("color setup is fast", function()
      local colors, duration_ms = test_helpers.measure_time(function()
        return require("repl69.colors").setup()
      end)

      assert(duration_ms < 20, "Color setup took too long: " .. duration_ms .. "ms")
      assert.is_table(colors, "colors should be generated")
    end)
  end)

  describe("memory efficiency", function()
    it("doesn't create excessive objects", function()
      -- This is a basic test to ensure we're not creating too many intermediate objects
      local before_gc = collectgarbage("count")
      
      -- Generate highlights multiple times
      for i = 1, 10 do
        local colors = require("repl69.colors").setup()
        Groups.setup(colors, Config.extend({ plugins = { all = true } }))
      end
      
      collectgarbage("collect")
      local after_gc = collectgarbage("count")
      
      -- Memory usage shouldn't grow excessively (allowing for some overhead)
      local memory_growth = after_gc - before_gc
      assert(memory_growth < 1000, "Memory growth too high: " .. memory_growth .. "KB")
    end)
  end)
end)