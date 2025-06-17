local Config = require("repl69.config")
local Groups = require("repl69.groups")

local test_helpers = require("tests.test_helpers")

-- Integration tests that verify the entire Groups module works together
-- Individual aspects are tested in dedicated spec files:
--   - groups_validation_spec.lua: Group file validation and plugin mappings
--   - color_validation_spec.lua: Color format and palette validation
--   - highlight_validation_spec.lua: Highlight definition validation
--   - highlight_links_spec.lua: Link resolution and circular reference detection
--   - configuration_spec.lua: Configuration handling and edge cases
--   - performance_spec.lua: Performance and memory tests

before_each(function()
  test_helpers.setup_test_environment()
end)

describe("Groups integration", function()
  it("successfully generates complete theme", function()
    local colors, highlights, groups = test_helpers.get_full_setup()

    -- Verify all components are present
    assert.is_table(colors, "colors should be generated")
    assert.is_table(highlights, "highlights should be generated")
    assert.is_table(groups, "groups should be generated")

    -- Verify we have meaningful content
    local highlight_count = 0
    for _ in pairs(highlights) do
      highlight_count = highlight_count + 1
    end
    assert(highlight_count > 50, "Should generate substantial number of highlights")

    -- Verify base groups are always included
    for _, base_group in ipairs(test_helpers.base_groups) do
      assert.is_true(groups[base_group], "Base group " .. base_group .. " should be enabled")
    end
  end)

  it("maintains consistency across different configurations", function()
    -- Test that switching between configurations doesn't break anything
    local configs = {
      { plugins = { all = true } },
      { plugins = { all = false, auto = false } },
      { plugins = { all = false, auto = false, dashboard = true } },
    }

    for i, config_opts in ipairs(configs) do
      local opts = Config.extend(config_opts)
      local colors = require("repl69.colors").setup(opts)
      local highlights, groups = Groups.setup(colors, opts)

      assert.is_table(highlights, "Configuration " .. i .. " should produce highlights")
      assert.is_table(groups, "Configuration " .. i .. " should produce groups")

      -- Base groups should always be present
      for _, base_group in ipairs(test_helpers.base_groups) do
        assert.is_true(groups[base_group], "Base group " .. base_group .. " should be enabled in config " .. i)
      end
    end
  end)
end)
