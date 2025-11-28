local M = {}

M.url = "https://github.com/olimorris/codecompanion.nvim"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles

  -- stylua: ignore
  return {
    CodeCompanionChatInfo = { fg = c.hint },
    CodeCompanionChatInfoBanner  = nil,
    CodeCompanionChatError  = nil,
    CodeCompanionChatWarn  = nil,
    CodeCompanionChatSubtext  = nil,
    CodeCompanionChatFold  = nil,
    CodeCompanionChatHeader  = nil,
    CodeCompanionChatSeparator   = nil,
    CodeCompanionSuperDiffDirectory  = { fg = c.orange500 },
    CodeCompanionSuperDiffFilename  = { fg = c.warning },
    CodeCompanionChatTokens  = { fg = c.error },
    CodeCompanionChatToolGroups  = { fg = c.orange500 },
    CodeCompanionChatTool  = { fg = c.warning },
    CodeCompanionChatVariable  = { fg = c.hint },
    CodeCompanionVirtualText  = nil,
  }
end

return M
