local M = {}

M.url = "https://github.com/hrsh7th/nvim-cmp"

---@type repl69.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    CmpDocumentation       = { fg = c.fg, bg = opts.transparent and c.none or c.bg_float },
    CmpDocumentationBorder = { fg = c.border_highlight, bg = opts.transparent and c.none or c.bg_float },
    CmpGhostText           = { fg = c.gray800 },
    CmpItemAbbr            = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated  = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch       = { fg = c.gray200, bg = c.none },
    CmpItemAbbrMatchFuzzy  = { fg = c.gray200, bg = c.none },
    CmpItemKindCodeium     = { fg = c.gray300, bg = c.none },
    CmpItemKindCopilot     = { fg = c.gray300, bg = c.none },
    CmpItemKindSupermaven  = { fg = c.gray300, bg = c.none },
    CmpItemKindDefault     = { fg = c.fg_dark, bg = c.none },
    CmpItemKindTabNine     = { fg = c.gray300, bg = c.none },
    CmpItemMenu            = { fg = c.comment, bg = c.none },
  }

  local kinds = {
    Array = "@punctuation.bracket",
    Boolean = "@boolean",
    Class = "@type",
    Color = "Special",
    Constant = "@constant",
    Constructor = "@constructor",
    Enum = "@lsp.type.enum",
    EnumMember = "@lsp.type.enumMember",
    Event = "Special",
    Field = "@variable.member",
    File = "Normal",
    Folder = "Directory",
    Function = "@function",
    Interface = "@lsp.type.interface",
    Key = "@variable.member",
    Keyword = "@lsp.type.keyword",
    Method = "@function.method",
    Module = "@module",
    Namespace = "@module",
    Null = "@constant.builtin",
    Number = "@number",
    Object = "@constant",
    Operator = "@operator",
    Package = "@module",
    Property = "@property",
    Reference = "@markup.link",
    Snippet = "Conceal",
    String = "@string",
    Struct = "@lsp.type.struct",
    Unit = "@lsp.type.struct",
    Text = "@markup",
    TypeParameter = "@lsp.type.typeParameter",
    Variable = "@variable",
    Value = "@string",
  }

  for kind, link in pairs(kinds) do
    ret["CmpItemKind" .. kind] = link
  end

  return ret
end

return M

