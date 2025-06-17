local test_helpers = require("tests.test_helpers")

before_each(function()
  test_helpers.setup_test_environment()
end)

describe("color validation", function()
  describe("hex color format", function()
    it("uses valid hex colors in highlights", function()
      local _, highlights = test_helpers.get_full_setup()

      for group_name, group_data in pairs(highlights) do
        if type(group_data) == "table" then
          for key, value in pairs(group_data) do
            if key == "fg" or key == "bg" or key == "sp" then
              if type(value) == "string" and value ~= "NONE" and value ~= "none" then
                assert.matches(
                  "^#%x%x%x%x%x%x$",
                  value,
                  string.format("%s.%s has invalid color: %s", group_name, key, value)
                )
              end
            end
          end
        end
      end
    end)
  end)

  describe("color palette", function()
    it("has all required color properties", function()
      local colors = require("repl69.colors").setup()
      local required_colors = {
        "bg",
        "fg",
        "error",
        "warning",
        "info",
        "hint",
        "border",
      }

      for _, color_name in ipairs(required_colors) do
        assert.is_not_nil(colors[color_name], "Missing required color: " .. color_name)
      end
    end)

    it("has essential UI colors", function()
      local colors = require("repl69.colors").setup()
      local ui_colors = {
        "bg_sidebar",
        "bg_statusline",
        "bg_popup",
        "bg_float",
        "fg_sidebar",
        "fg_float",
        "border_highlight",
      }

      for _, color_name in ipairs(ui_colors) do
        assert.is_not_nil(colors[color_name], "Missing UI color: " .. color_name)
      end
    end)

    it("has git-related colors", function()
      local colors = require("repl69.colors").setup()

      assert.is_table(colors.git, "git colors should be a table")
      assert.is_not_nil(colors.git.add, "git.add color should exist")
      assert.is_not_nil(colors.git.change, "git.change color should exist")
      assert.is_not_nil(colors.git.delete, "git.delete color should exist")
    end)

    it("has diff-related colors", function()
      local colors = require("repl69.colors").setup()

      assert.is_table(colors.diff, "diff colors should be a table")
      assert.is_not_nil(colors.diff.add, "diff.add color should exist")
      assert.is_not_nil(colors.diff.change, "diff.change color should exist")
      assert.is_not_nil(colors.diff.delete, "diff.delete color should exist")
    end)
  end)
end)