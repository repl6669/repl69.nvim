-- Clear cached modules only if config hasn't been setup
local config = require("repl69.config")
if not config.options then
  package.loaded["repl69"] = nil
  package.loaded["repl69.config"] = nil
  package.loaded["repl69.colors"] = nil
  package.loaded["repl69.colors.init"] = nil
  package.loaded["repl69.colors.darkness"] = nil
  package.loaded["repl69.groups"] = nil
  package.loaded["repl69.groups.init"] = nil
  package.loaded["repl69.groups.base"] = nil
  package.loaded["repl69.groups.gitsigns"] = nil
  package.loaded["repl69.groups.gitgutter"] = nil
  package.loaded["repl69.theme"] = nil
  package.loaded["repl69.util"] = nil
end

require("repl69").load()
