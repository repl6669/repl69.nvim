local test_helpers = require("tests.test_helpers")

before_each(function()
  test_helpers.setup_test_environment()
end)

describe("highlight links", function()
  describe("link resolution", function()
    it("resolves links correctly", function()
      local _, highlights = test_helpers.get_full_setup()

      -- Find groups that are strings (links) and verify internal links
      for group_name, group_data in pairs(highlights) do
        if type(group_data) == "string" then
          -- Only test internal links (those that should exist in our highlights table)
          -- External links to built-in Neovim groups are ok
          if highlights[group_data] == nil then
            -- This might be an external link to a built-in group, which is valid
            -- We'll just ensure the link string is not empty
            assert.is_not_equal(
              "",
              group_data,
              string.format("Link target for group '%s' should not be empty", group_name)
            )
          end
        end
      end
    end)

    it("links point to valid highlight definitions", function()
      local _, highlights = test_helpers.get_full_setup()

      for group_name, group_data in pairs(highlights) do
        if type(group_data) == "string" then
          -- Ensure link target name is valid (not empty)
          assert.is_not_equal("", group_data, string.format("Link target for group '%s' should not be empty", group_name))

          -- If target exists in our table, it should be valid
          local target = highlights[group_data]
          if target then
            assert(
              type(target) == "table" or type(target) == "string",
              string.format("Link target '%s' has invalid type: %s", group_data, type(target))
            )
          end
        end
      end
    end)
  end)

  describe("circular link detection", function()
    it("has no circular links", function()
      local _, highlights = test_helpers.get_full_setup()

      -- Check for circular references
      for group_name, group_data in pairs(highlights) do
        if type(group_data) == "string" then
          local visited = {}
          local current = group_name

          -- Follow the link chain (only for internal links)
          while highlights[current] and type(highlights[current]) == "string" do
            assert.is_nil(visited[current], string.format("Circular link detected involving '%s'", current))
            visited[current] = true
            current = highlights[current]
          end

          -- Should end at a table (actual highlight definition) or be external
          if highlights[current] then
            assert.is_table(
              highlights[current],
              string.format("Link chain from '%s' does not resolve to a highlight table", group_name)
            )
          end
        end
      end
    end)
  end)
end)