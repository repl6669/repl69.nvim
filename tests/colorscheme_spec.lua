local Config = require("repl69.config")
local Init = require("repl69")

before_each(function()
  vim.o.background = "dark"
  vim.cmd.colorscheme("default")
  Config.setup()
  Init.styles = {}
end)

it("did prper init", function()
  assert.same({}, Init.styles)
  assert.same("default", vim.g.colors_name)
  assert.same("dark", vim.o.background)
end)

describe("loading respects vim.o.background", function()
  it("= dark", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("repl69")
    assert.same("dark", vim.o.background)
    assert.same("repl69-void", vim.g.colors_name)
  end)

  it("= light", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("repl69")
    assert.same("light", vim.o.background)
    assert.same("repl69-dawn", vim.g.colors_name)
  end)

  it("= dark with void", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("repl69-void")
    assert.same("dark", vim.o.background)
    assert.same("repl69-void", vim.g.colors_name)
  end)

  it("= dark with dawn", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("repl69-dawn")
    assert.same("light", vim.o.background)
    assert.same("repl69-dawn", vim.g.colors_name)
  end)

  it("= light with void", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("repl69-void")
    assert.same("dark", vim.o.background)
    assert.same("repl69-void", vim.g.colors_name)
  end)

  it("= light with dawn", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("repl69-dawn")
    assert.same("light", vim.o.background)
    assert.same("repl69-dawn", vim.g.colors_name)
  end)

  it(" and switches to light", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("repl69-void")
    vim.o.background = "light"
    assert.same("light", vim.o.background)
    assert.same("repl69-dawn", vim.g.colors_name)
  end)

  it(" and switches to dark", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("repl69")
    vim.o.background = "dark"
    assert.same("dark", vim.o.background)
    assert.same("repl69-void", vim.g.colors_name)
  end)

  it(" and remembers dark", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("repl69-void")
    vim.o.background = "light"
    vim.o.background = "dark"
    assert.same("dark", vim.o.background)
    assert.same("repl69-void", vim.g.colors_name)
  end)
end)
