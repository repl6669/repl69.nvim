local test_helpers = require("tests.test_helpers")

before_each(function()
  test_helpers.setup_test_environment()
end)

describe("highlight validation", function()
  describe("highlight completeness", function()
    it("all groups return valid highlight definitions", function()
      local _, highlights = test_helpers.get_full_setup()

      for group_name, group_data in pairs(highlights) do
        assert.is_not_nil(group_data, "Group " .. group_name .. " should not be nil")

        if type(group_data) == "table" then
          -- Table-based highlight groups are valid (even if empty - used to clear highlights)
          assert.is_table(group_data, "Group " .. group_name .. " should be a table")
        elseif type(group_data) == "string" then
          -- String-based groups are links - should not be empty
          assert.is_not_equal("", group_data, "Group " .. group_name .. " link should not be empty")
        else
          -- Invalid type
          assert.fail("Group " .. group_name .. " has invalid type: " .. type(group_data))
        end
      end
    end)
  end)

  describe("style consistency", function()
    it("uses consistent style properties", function()
      local valid_style_keys = {
        "fg",
        "bg",
        "sp", -- colors
        "bold",
        "italic",
        "underline", -- basic styles
        "undercurl",
        "underdot",
        "underdash", -- underline styles
        "strikethrough",
        "reverse",
        "inverse", -- other styles
        "standout",
        "nocombine", -- special attributes
      }

      local _, highlights = test_helpers.get_full_setup()

      for group_name, group_data in pairs(highlights) do
        if type(group_data) == "table" then
          for key, _ in pairs(group_data) do
            assert(
              vim.list_contains(valid_style_keys, key),
              string.format("Invalid style key '%s' in group '%s'", key, group_name)
            )
          end
        end
      end
    end)
  end)
end)