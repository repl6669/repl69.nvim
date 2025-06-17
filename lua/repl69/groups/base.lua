local Util = require("repl69.util")

local M = {}

function M.get(c, opts)
  local transparent = opts.transparent
  local styles = opts.styles

  -- stylua: ignore
  return {
    -- Base editor highlights
    ColorColumn                 = { bg = c.gray925 },
    Conceal                     = { bg = c.none },
    CurSearch                   = { fg = c.black, bg = c.orange500 },
    Cursor                      = { fg = c.gray50, bg = c.gray700 },
    lCursor                     = { fg = c.bg, bg = c.gray100 },
    CursorIM                    = { fg = c.bg, bg = c.gray100 },
    CursorColumn                = { bg = c.gray925 },
    CursorLine                  = { bg = c.gray925 },
    CursorLineNr                = { fg = c.gray450, bold = styles.keywords.bold },
    Directory                   = { fg = c.gray200, bold = styles.keywords.bold },
    EndOfBuffer                 = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg                    = { fg = c.error, bold = styles.keywords.bold },
    FloatBorder                 = { fg = c.border, bg = transparent and c.none or c.bg_float },
    FloatTitle                  = { fg = c.gray200, bg = transparent and c.none or c.bg_float, bold = styles.keywords.bold },
    FoldColumn                  = { fg = c.gray850 },
    Folded                      = { fg = c.gray50, bg = transparent and c.none or c.bg_popup },
    IncSearch                   = "CurSearch",
    LineNr                      = { fg = c.gray800 },
    LineNrAbove                 = { fg = c.gray800 },
    LineNrBelow                 = { fg = c.gray800 },
    MatchParen                  = { fg = c.gray500, bg = c.gray800 },
    ModeMsg                     = { fg = c.gray500 },
    MsgArea                     = { fg = c.gray500 }, -- Area for messages and cmdline
    MoreMsg                     = { fg = c.gray300 },
    NonText                     = { fg = c.gray850 },
    Normal                      = { fg = c.gray100, bg = transparent and c.none or c.bg },
    NormalFloat                 = { fg = c.fg_float, bg = transparent and c.none or c.bg_float },
    NormalNC                    = { fg = c.gray50, bg = transparent and c.none or c.bg },
    NormalSB                    = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- normal text in sidebar
    NvimInternalError           = "ErrorMsg",
    Pmenu                       = { fg = c.gray500, bg = transparent and c.none or c.bg_popup },
    PmenuMatch                  = { bg = transparent and c.none or c.bg_popup, fg = c.orange500 }, -- Popup menu: Matched text in normal item.
    PmenuMatchSel               = { bg = transparent and c.none or c.visual, fg = c.orange500 }, -- Popup menu: Matched text in selected item.
    PmenuExtra                  = { fg = c.gray800, bg = transparent and c.none or c.bg_popup },
    PmenuExtraSel               = { fg = c.gray500, bg = transparent and c.none or c.gray750 },
    PmenuKind                   = { fg = c.gray200, bg = transparent and c.none or c.bg_popup },
    PmenuKindSel                = { fg = c.gray500, bg = transparent and c.none or c.gray750 },
    PmenuSbar                   = { bg = transparent and c.none or c.bg_popup },
    PmenuSel                    = { fg = c.gray50, bg = transparent and c.none or c.gray750 },
    PmenuThumb                  = { bg = transparent and c.none or c.gray850 },
    Question                    = { fg = c.gray400 },
    QuickFixLine                = { bg = c.bg_visual, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    RedrawDebugClear            = { fg = c.black, bg = c.gray400 },
    RedrawDebugComposed         = { fg = c.black, bg = c.gray500 },
    RedrawDebugRecompose        = { fg = c.black, bg = c.gray600 },
    Search                      = { fg = c.gray50, bg = c.gray400 },
    SignColumn                  = { fg = c.gray50, bg = transparent and c.none or c.bg },
    SignColumnSB                = { bg = c.bg_sidebar, fg = c.gray800 }, -- column where |signs| are displayed
    SpecialKey                  = { fg = c.gray200 },
    SpellBad                    = { sp = c.gray500, undercurl = true },
    SpellCap                    = { sp = c.gray500, undercurl = true },
    SpellLocal                  = { sp = c.gray500, undercurl = true },
    SpellRare                   = { sp = c.gray500, undercurl = true },
    StatusLine                  = { fg = c.gray500, bg = transparent and c.none or c.bg_statusline },
    StatusLineNC                = { fg = c.gray850, bg = transparent and c.none or c.bg_statusline },
    StatusLineTerm              = { fg = c.black, bg = c.gray500 },
    StatusLineTermNC            = { fg = c.black, bg = c.gray500 },
    Substitute                  = "IncSearch",
    TabLine                     = { fg = c.gray500, bg = transparent and c.none or c.bg_statusline },
    TabLineFill                 = { bg = transparent and c.none or c.bg_statusline },
    TabLineSel                  = { fg = c.gray50, bg = transparent and c.none or c.gray750, bold = styles.keywords.bold },
    Title                       = { fg = c.gray200, bold = styles.keywords.bold },
    VertSplit                   = { fg = c.border },
    Visual                      = { bg = c.bg_visual },
    WarningMsg                  = { fg = c.warning, bold = styles.keywords.bold },
    WildMenu                    = "IncSearch",
    WinBar                      = { fg = c.gray500, bg = transparent and c.none or c.bg_statusline },
    WinBarNC                    = { fg = c.gray850, bg = transparent and c.none or c.bg_statusline },
    WinSeparator                = { fg = c.border },
    Whitespace                  = { fg = c.gray800 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own.
    LspReferenceText            = { bg = c.fg_gutter }, -- used for highlighting "text" references
    LspReferenceRead            = { bg = c.fg_gutter }, -- used for highlighting "read" references
    LspReferenceWrite           = { bg = c.fg_gutter }, -- used for highlighting "write" references
    LspSignatureActiveParameter = { bg = Util.blend_bg(c.bg_visual, 0.40), bold = true },
    LspCodeLens                 = { fg = c.comment },
    LspInlayHint                = { fg = c.comment },
    LspInfoBorder               = { fg = c.border_highlight, bg = c.bg_float },

    -- Diagnostics
    DiagnosticError             = { fg = c.error },
    DiagnosticHint              = { fg = c.hint },
    DiagnosticInfo              = { fg = c.info },
    DiagnosticOk                = { fg = c.hint },
    DiagnosticWarn              = { fg = c.warning },
    DiagnosticDefaultError      = "DiagnosticError",
    DiagnosticDefaultHint       = "DiagnosticHint",
    DiagnosticDefaultInfo       = "DiagnosticInfo",
    DiagnosticDefaultOk         = "DiagnosticOk",
    DiagnosticDefaultWarn       = "DiagnosticWarn",
    DiagnosticFloatingError     = "DiagnosticError",
    DiagnosticFloatingHint      = "DiagnosticHint",
    DiagnosticFloatingInfo      = "DiagnosticInfo",
    DiagnosticFloatingOk        = "DiagnosticOk",
    DiagnosticFloatingWarn      = "DiagnosticWarn",
    DiagnosticSignError         = "DiagnosticError",
    DiagnosticSignHint          = "DiagnosticHint",
    DiagnosticSignInfo          = "DiagnosticInfo",
    DiagnosticSignOk            = "DiagnosticOk",
    DiagnosticSignWarn          = "DiagnosticWarn",
    DiagnosticUnderlineError    = { sp = c.error, undercurl = true },
    DiagnosticUnderlineHint     = { sp = c.hint, undercurl = true },
    DiagnosticUnderlineInfo     = { sp = c.info, undercurl = true },
    DiagnosticUnderlineOk       = { sp = c.hint, undercurl = true },
    DiagnosticUnderlineWarn     = { sp = c.warning, undercurl = true },
    DiagnosticVirtualTextError  = { fg = c.error },
    DiagnosticVirtualTextHint   = { fg = c.hint },
    DiagnosticVirtualTextInfo   = { fg = c.info },
    DiagnosticVirtualTextOk     = { fg = c.hint },
    DiagnosticVirtualTextWarn   = { fg = c.warning },

    -- Syntax highlighting
    Boolean                     = { fg = c.gray600, bold = styles.keywords.bold },
    Character                   = { fg = c.gray600, bold = styles.keywords.bold },
    Comment                     = { fg = c.gray700, italic = styles.comments.italic },
    Conditional                 = { fg = c.white, bold = styles.keywords.bold },
    Constant                    = { fg = c.gray600, bold = styles.keywords.bold },
    Debug                       = { fg = c.white },
    Define                      = { fg = c.white, bold = styles.keywords.bold },
    Delimiter                   = { fg = c.white },
    Error                       = { fg = c.red, bold = styles.keywords.bold },
    Exception                   = { fg = c.white },
    Float                       = { fg = c.gray600, bold = styles.keywords.bold },
    Function                    = { fg = c.gray50, bold = styles.functions.bold },
    Identifier                  = { fg = c.white, bold = styles.keywords.bold },
    Include                     = { fg = c.white, bold = styles.keywords.bold },
    Keyword                     = { fg = c.gray50, bold = styles.keywords.bold },
    Label                       = { fg = c.white },
    Macro                       = { fg = c.white, bold = styles.keywords.bold },
    Number                      = { fg = c.gray600, bold = styles.keywords.bold },
    Operator                    = { fg = c.gray300, bold = styles.keywords.bold },
    PreCondit                   = { fg = c.white, bold = styles.keywords.bold },
    PreProc                     = "PreCondit",
    Repeat                      = { fg = c.white },
    Special                     = { fg = c.white },
    SpecialChar                 = "Special",
    SpecialComment              = { fg = c.gray600, bold = styles.keywords.bold },
    Statement                   = { fg = c.white, bold = styles.keywords.bold },
    StorageClass                = { fg = c.white, bold = styles.keywords.bold },
    String                      = { fg = c.gray450 },
    Underlined                  = { underline = true },
    Structure                   = { fg = c.white, bold = styles.keywords.bold },
    Tag                         = { fg = c.white },
    Todo                        = { fg = c.bg_border_info, bg = c.info, bold = styles.keywords.bold },
    Type                        = { fg = c.gray50, bold = styles.keywords.bold },
    TypeDef                     = "Type",
    Italic                      = { italic = true, fg = c.gray100 }, -- (preferred) any italic text
    Bold                        = { bold = true, fg = c.gray100 }, -- (preferred) any bold text
    debugBreakpoint             = { bg = Util.blend_bg(c.info, 0.10), fg = c.info }, -- used for breakpoint colors in terminal-debug
    debugPC                     = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    dosIniLabel                 = "@property",
    helpCommand                 = { bg = c.black, fg = c.info },
    helpExample                 = { fg = c.comment },
    -- htmlH1                      = { fg = c.green500, bold = true },
    -- htmlH2                      = { fg = c.orange500, bold = true },
    qfFileName                  = { fg = c.trace },
    qfLineNr                    = { fg = c.gray700 },

    -- Health
    healthError                 = { fg = c.error },
    healthSuccess               = { fg = c.hint },
    healthWarning               = { fg = c.warning },

    -- Diff
    DiffAdd                     = { fg = c.git.add, bg = c.diff.add },
    DiffChange                  = { fg = c.git.change, bg = c.diff.change },
    DiffDelete                  = { fg = c.git.delete, bg = c.diff.delete },
    DiffText                    = { fg = c.git.text, bg = c.diff.text },
    diffAdded                   = { bg = c.diff.add, fg = c.git.add },
    diffRemoved                 = { bg = c.diff.delete, fg = c.git.delete },
    diffChanged                 = { bg = c.diff.change, fg = c.git.change },
    diffOldFile                 = { fg = c.git.delete, bg=c.diff.delete },
    diffNewFile                 = { fg = c.git.add, bg=c.diff.add },
    diffFile                    = { fg = c.trace, bg = Util.blend_bg(c.trace, 0.10) },
    diffLine                    = { fg = c.comment },
    diffIndexLine               = { fg = c.purple100 },
  }
end

return M
