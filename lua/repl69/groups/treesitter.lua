local Util = require("repl69.util")

local M = {}

function M.get(c, opts)
  local transparent = opts.transparent
  local styles = opts.styles

  -- stylua: ignore
  return {
    -- Variables
    ["@variable"]               = { fg = c.white, italic = styles.variables.italic },
    ["@variable.builtin"]       = { fg = c.gray100, italic = styles.variables.italic, bold = styles.keywords.bold },
    ["@variable.parameter"]     = { fg = c.white, italic = styles.variables.italic },
    ["@variable.parameter.builtin"] = { fg = c.gray100, italic = styles.variables.italic, bold = styles.keywords.bold },
    ["@variable.member"]        = { fg = c.gray100 },

    -- Constants
    ["@constant"]               = { fg = c.gray400 },
    ["@constant.builtin"]       = { fg = c.gray400, bold = styles.keywords.bold },
    ["@constant.macro"]         = { fg = c.gray400 },

    -- Modules and Labels
    ["@module"]                 = { fg = c.gray400 },
    ["@module.builtin"]         = { fg = c.gray400, bold = styles.keywords.bold },
    ["@label"]                  = "Label",

    -- Strings
    ["@string"]                 = "String",
    ["@string.regexp"]          = { fg = c.gray300 },
    ["@string.escape"]          = { fg = c.gray500 },
    ["@string.special"]         = "String",
    ["@string.special.symbol"]  = "Identifier",
    ["@string.special.url"]     = { fg = c.gray300 },
    ["@string.documentation"]   = { fg = c.gray400 },

    -- Characters
    ["@character"]              = "Character",
    ["@character.special"]      = "Character",

    -- Numbers and Booleans
    ["@boolean"]                = "Boolean",
    ["@number"]                 = "Number",
    ["@number.float"]           = "Number",
    ["@float"]                  = "Number",

    -- Types
    ["@type"]                   = { fg = c.gray100 },
    ["@type.builtin"]           = { fg = c.gray100, bold = styles.keywords.bold },
    ["@type.definition"]        = "Typedef",
    ["@type.qualifier"]         = "@keyword",

    -- Attributes and Properties
    ["@attribute"]              = { fg = c.gray300 },
    ["@attribute.builtin"]      = { fg = c.gray300, bold = styles.keywords.bold },
    ["@property"]               = { fg = c.gray200, italic = styles.variables.italic },

    -- Functions
    ["@function"]               = "Function",
    ["@function.builtin"]       = { fg = c.gray200, bold = styles.functions.bold },
    ["@function.macro"]         = "Function",
    ["@function.method"]        = "Function",
    ["@function.method.call"]   = "Function",
    ["@function.method.php"]    = "Function",
    ["@function.method.call.php"] = "Function",
    ["@function.call"]          = "@function",

    -- PHP specific
    ["@method.php"]             = "@function.method.php",
    ["@method.call.php"]        = "@function.method.call.php",

    -- Constructors
    ["@constructor"]            = { fg = c.gray200 },
    ["@constructor.tsx"]        = { fg = c.gray300 },

    -- Operators
    ["@operator"]               = "Operator",

    -- Keywords
    ["@keyword"]                = "Keyword",
    ["@keyword.modifier"]       = { fg = c.gray300 },
    ["@keyword.function"]       = { fg = c.gray200 },
    ["@keyword.operator"]       = { fg = c.gray200 },
    ["@keyword.import"]         = { fg = c.gray200 },
    ["@keyword.storage"]        = { fg = c.gray200 },
    ["@keyword.repeat"]         = { fg = c.gray200 },
    ["@keyword.return"]         = { fg = c.gray200 },
    ["@keyword.debug"]          = { fg = c.gray200 },
    ["@keyword.exception"]      = { fg = c.gray200 },
    ["@keyword.conditional"]    = { fg = c.gray200 },
    ["@keyword.conditional.ternary"] = { fg = c.gray200 },
    ["@keyword.directive"]      = { fg = c.gray200 },
    ["@keyword.directive.define"] = { fg = c.gray200 },
    ["@keyword.coroutine"]      = "@keyword",

    -- Punctuation
    ["@punctuation.delimiter"]  = { fg = c.gray500 },
    ["@punctuation.bracket"]    = { fg = c.gray300 },
    ["@punctuation.special"]    = { fg = c.gray500 },
    ["@punctuation.special.markdown"] = { fg = c.gray300 },

    -- Comments
    ["@comment"]                = "Comment",
    ["@comment.error"]          = { fg = c.error },
    ["@comment.warning"]        = { fg = c.warning },
    ["@comment.todo"]           = { fg = c.todo },
    ["@comment.hint"]           = { fg = c.hint },
    ["@comment.info"]           = { fg = c.info },
    ["@comment.note"]           = { fg = c.trace },

    -- Markup
    ["@markup"]                 = "@none",
    ["@markup.strong"]          = { bold = styles.keywords.bold },
    ["@markup.italic"]          = { italic = styles.comments.italic },
    ["@markup.strikethrough"]   = { strikethrough = true },
    ["@markup.underline"]       = { underline = true },
    ["@markup.heading"]         = { fg = c.gray200, bold = styles.keywords.bold },
    ["@markup.quote"]           = { fg = c.gray50 },
    ["@markup.math"]            = "Special",
    ["@markup.environment"]     = "Macro",
    ["@markup.environment.name"] = "@type",
    ["@markup.link"]            = { fg = c.gray300 },
    ["@markup.link.label"]      = "SpecialChar",
    ["@markup.link.label.symbol"] = "Identifier",
    ["@markup.link.label.markdown_inline"] = { fg = c.gray200 },
    ["@markup.link.markdown_inline"] = { fg = c.gray500 },
    ["@markup.link.url"]        = { fg = c.gray300 },
    ["@markup.raw"]             = "String",
    ["@markup.raw.delimiter.markdown"] = { fg = c.gray500 },
    ["@markup.raw.markdown_inline"] = { fg = c.gray300 },
    ["@markup.list"]            = { fg = c.gray500 },
    ["@markup.list.checked"]    = { fg = c.gray200, bg = c.gray200 },
    ["@markup.list.unchecked"]  = { fg = c.gray50 },
    ["@markup.list.markdown"]   = { fg = c.gray300, bold = true },
    ["@markup.emphasis"]        = { italic = true },

    -- Markdown headings
    ["@markup.heading.1.markdown"] = "markdownH1",
    ["@markup.heading.2.markdown"] = "markdownH2",
    ["@markup.heading.3.markdown"] = "markdownH3",
    ["@markup.heading.4.markdown"] = "markdownH4",
    ["@markup.heading.5.markdown"] = "markdownH5",
    ["@markup.heading.6.markdown"] = "markdownH6",
    ["@markup.heading.1.marker.markdown"] = "markdownH1Delimiter",
    ["@markup.heading.2.marker.markdown"] = "markdownH2Delimiter",
    ["@markup.heading.3.marker.markdown"] = "markdownH3Delimiter",
    ["@markup.heading.4.marker.markdown"] = "markdownH4Delimiter",
    ["@markup.heading.5.marker.markdown"] = "markdownH5Delimiter",
    ["@markup.heading.6.marker.markdown"] = "markdownH6Delimiter",

    -- Diff
    ["@diff.plus"]              = { fg = c.git.add, bg = c.diff.add },
    ["@diff.minus"]             = { fg = c.git.delete, bg = c.diff.delete },
    ["@diff.delta"]             = { bg = c.diff.change },

    -- Tags
    ["@tag"]                    = "Tag",
    ["@tag.attribute"]          = { fg = c.gray300 },
    ["@tag.delimiter"]          = { fg = c.gray500 },
    ["@tag.delimiter.tsx"]      = { fg = Util.blend_bg(c.gray300, 0.80) },
    ["@tag.tsx"]                = { fg = c.gray200 },
    ["@tag.javascript"]         = { fg = c.gray200 },

    -- Conceal
    ["@conceal"]                = "Conceal",
    ["@conceal.markdown"]       = { fg = c.gray500 },

    -- Utility
    ["@none"]                   = {},
    ["@annotation"]             = { fg = c.gray300 },
    ["@namespace"]              = { fg = c.gray200 },
    ["@namespace.builtin"]      = { fg = c.gray200, bold = styles.keywords.bold },
    ["@parameter"]              = { fg = c.gray100, italic = styles.variables.italic },
    ["@parameter.builtin"]      = "@variable.parameter.builtin",
    ["@field"]                  = { fg = c.gray200 },
    ["@field.key"]              = "@property",
    ["@interface"]              = { fg = c.gray100 },
    ["@symbol"]                 = { fg = c.gray300 },

    -- Text (legacy)
    ["@text"]                   = { fg = c.fg },
    ["@text.strong"]            = { bold = styles.keywords.bold },
    ["@text.emphasis"]          = { italic = styles.comments.italic },
    ["@text.strike"]            = { strikethrough = true },
    ["@text.literal"]           = { fg = c.gray400 },
    ["@text.uri"]               = { fg = c.gray300, underline = true },
    ["@text.title"]             = { fg = c.gray200, bold = styles.keywords.bold },
    ["@text.todo"]              = { fg = c.todo, bg = c.todo },
    ["@text.note"]              = { fg = c.info, bg = c.info },
    ["@text.warning"]           = { fg = c.warning, bg = c.warning },
    ["@text.danger"]            = { fg = c.error, bg = c.error },

    -- LSP Semantic tokens
    ["@lsp.type.comment"]       = {},
    ["@lsp.type.comment.c"]     = "@comment",
    ["@lsp.type.comment.cpp"]   = "@comment",
    ["@lsp.type.enum"]          = "@type",
    ["@lsp.type.interface"]     = "@interface",
    ["@lsp.type.keyword"]       = "@keyword",
    ["@lsp.type.namespace"]     = "@namespace",
    ["@lsp.type.namespace.python"] = "@variable",
    ["@lsp.type.parameter"]     = "@parameter",
    ["@lsp.type.property"]      = "@property",
    ["@lsp.type.variable"]      = {}, -- defer to treesitter for regular variables
    ["@lsp.type.variable.svelte"] = "@variable",
    ["@lsp.typemod.function.defaultLibrary"] = "@function.builtin",
    ["@lsp.typemod.operator.injected"] = "@operator",
    ["@lsp.typemod.string.injected"] = "@string",
    ["@lsp.typemod.variable.constant"] = "@constant",
    ["@lsp.typemod.variable.defaultLibrary"] = "@variable.builtin",
    ["@lsp.typemod.variable.injected"] = "@variable",

    -- Language specific overrides
    ["@constructor.lua"]        = { fg = c.gray200 },
    ["@function.call.lua"]      = { fg = c.gray200 },
    ["@keyword.function.lua"]   = { fg = c.gray200 },

    -- CSS
    ["@property.css"]           = { fg = c.gray300 },
    ["@string.css"]             = { fg = c.gray400 },
    ["@type.css"]               = { fg = c.gray200 },

    -- JSON
    ["@label.json"]             = { fg = c.gray300 },

    -- YAML
    ["@field.yaml"]             = { fg = c.gray300 },
  }
end

return M
