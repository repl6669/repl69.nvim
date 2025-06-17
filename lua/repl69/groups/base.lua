local Util = require("repl69.util")

local M = {}

function M.get(c, opts)
  local transparent = opts.transparent
  local styles = opts.styles

  return {
    -- Comments
    Comment = { fg = c.gray700, italic = styles.comments.italic }, -- any comment

    -- Cursor
    CurSearch = { fg = c.black, bg = c.orange500 },
    Cursor = { fg = c.gray50, bg = c.gray700 }, -- character under the cursor
    lCursor = { fg = c.bg, bg = c.gray100 }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = c.bg, bg = c.gray100 }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.gray925 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.gray925 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorLineNr = { fg = c.gray450, bold = styles.keywords.bold }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

    -- Columns and Lines
    ColorColumn = { bg = c.gray925 }, -- used for the columns set with 'colorcolumn'
    LineNr = { fg = c.gray800 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove = { fg = c.gray800 },
    LineNrBelow = { fg = c.gray800 },
    SignColumn = { fg = c.gray50, bg = transparent and c.none or c.bg },
    SignColumnSB = { bg = c.bg_sidebar, fg = c.gray800 }, -- column where |signs| are displayed

    -- Search
    Search = { fg = c.gray50, bg = c.gray400 }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = "CurSearch", -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute = "IncSearch", -- |:substitute| replacement text highlighting

    -- Text Display
    Conceal = { bg = c.none }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Directory = { fg = c.gray200, bold = styles.keywords.bold }, -- directory names (and other special names in listings)
    EndOfBuffer = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    NonText = { fg = c.gray850 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.gray100, bg = transparent and c.none or c.bg }, -- normal text
    NormalFloat = { fg = c.fg_float, bg = transparent and c.none or c.bg_float }, -- Normal text in floating windows.
    NormalNC = { fg = c.gray50, bg = transparent and c.none or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- normal text in sidebar
    SpecialKey = { fg = c.gray200 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    Title = { fg = c.gray200, bold = styles.keywords.bold }, -- titles for output from ":set all", ":autocmd" etc.
    Whitespace = { fg = c.gray800 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'

    -- Visual Selection
    Visual = { bg = c.bg_visual }, -- Visual mode selection
    VisualNOS = { bg = c.bg_visual }, -- Visual mode selection when vim is "Not Owning the Selection"

    -- Matching
    MatchParen = { fg = c.gray500, bg = c.gray800 }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

    -- Messages
    ErrorMsg = { fg = c.error, bold = styles.keywords.bold }, -- error messages on the command line
    ModeMsg = { fg = c.gray500 }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.gray500 }, -- Area for messages and cmdline
    MoreMsg = { fg = c.gray300 }, -- |more-prompt|
    Question = { fg = c.gray400 }, -- |hit-enter| prompt and yes/no questions
    WarningMsg = { fg = c.warning, bold = styles.keywords.bold }, -- warning messages

    -- Folding
    FoldColumn = { fg = c.gray850 }, -- 'foldcolumn'
    Folded = { fg = c.gray50, bg = transparent and c.none or c.bg_popup }, -- line used for closed folds

    -- Windows and Borders
    VertSplit = { fg = c.border }, -- the column separating vertically split windows
    WinSeparator = { fg = c.border }, -- the column separating vertically split windows
    FloatBorder = { fg = c.border, bg = transparent and c.none or c.bg_float },
    FloatTitle = { fg = c.gray200, bg = transparent and c.none or c.bg_float, bold = styles.keywords.bold },

    -- Status Line
    StatusLine = { fg = c.gray500, bg = transparent and c.none or c.bg_statusline }, -- status line of current window
    StatusLineNC = { fg = c.gray850, bg = transparent and c.none or c.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    StatusLineTerm = { fg = c.black, bg = c.gray500 },
    StatusLineTermNC = { fg = c.black, bg = c.gray500 },
    WinBar = { fg = c.gray500, bg = transparent and c.none or c.bg_statusline }, -- window bar
    WinBarNC = { fg = c.gray850, bg = transparent and c.none or c.bg_statusline }, -- window bar in inactive windows

    -- Tabs
    TabLine = { fg = c.gray500, bg = transparent and c.none or c.bg_statusline }, -- tab pages line, not active tab page label
    TabLineFill = { bg = transparent and c.none or c.bg_statusline }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.gray50, bg = transparent and c.none or c.gray750, bold = styles.keywords.bold }, -- tab pages line, active tab page label

    -- Popup Menu
    Pmenu = { fg = c.gray500, bg = transparent and c.none or c.bg_popup }, -- Popup menu: normal item.
    PmenuMatch = { bg = transparent and c.none or c.bg_popup, fg = c.orange500 }, -- Popup menu: Matched text in normal item.
    PmenuMatchSel = { bg = transparent and c.none or c.visual, fg = c.orange500 }, -- Popup menu: Matched text in selected item.
    PmenuExtra = { fg = c.gray800, bg = transparent and c.none or c.bg_popup },
    PmenuExtraSel = { fg = c.gray500, bg = transparent and c.none or c.gray750 },
    PmenuKind = { fg = c.gray200, bg = transparent and c.none or c.bg_popup },
    PmenuKindSel = { fg = c.gray500, bg = transparent and c.none or c.gray750 },
    PmenuSbar = { bg = transparent and c.none or c.bg_popup }, -- Popup menu: scrollbar.
    PmenuSel = { fg = c.gray50, bg = transparent and c.none or c.gray750 }, -- Popup menu: selected item.
    PmenuThumb = { bg = transparent and c.none or c.gray850 }, -- Popup menu: Thumb of the scrollbar.

    -- Spelling
    SpellBad = { sp = c.gray500, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.gray500, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.gray500, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.gray500, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    -- Debug and Special
    NvimInternalError = "ErrorMsg",
    QuickFixLine = { bg = c.bg_visual, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    RedrawDebugClear = { fg = c.black, bg = c.gray400 },
    RedrawDebugComposed = { fg = c.black, bg = c.gray500 },
    RedrawDebugRecompose = { fg = c.black, bg = c.gray600 },
    WildMenu = "IncSearch", -- current match in 'wildmenu' completion

    -- LSP
    LspReferenceText = { bg = c.fg_gutter }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.fg_gutter }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.fg_gutter }, -- used for highlighting "write" references
    LspSignatureActiveParameter = { bg = Util.blend_bg(c.bg_visual, 0.40), bold = true },
    LspCodeLens = { fg = c.comment },
    LspInlayHint = { fg = c.comment },
    LspInfoBorder = { fg = c.border_highlight, bg = c.bg_float },

    -- Diagnostics
    DiagnosticError = { fg = c.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = { fg = c.gray700 }, -- Used for unnecessary code diagnostics
    DiagnosticOk = { fg = c.hint },
    DiagnosticDefaultError = "DiagnosticError",
    DiagnosticDefaultHint = "DiagnosticHint",
    DiagnosticDefaultInfo = "DiagnosticInfo",
    DiagnosticDefaultOk = "DiagnosticOk",
    DiagnosticDefaultWarn = "DiagnosticWarn",
    DiagnosticFloatingError = "DiagnosticError",
    DiagnosticFloatingHint = "DiagnosticHint",
    DiagnosticFloatingInfo = "DiagnosticInfo",
    DiagnosticFloatingOk = "DiagnosticOk",
    DiagnosticFloatingWarn = "DiagnosticWarn",
    DiagnosticSignError = "DiagnosticError",
    DiagnosticSignHint = "DiagnosticHint",
    DiagnosticSignInfo = "DiagnosticInfo",
    DiagnosticSignOk = "DiagnosticOk",
    DiagnosticSignWarn = "DiagnosticWarn",
    DiagnosticUnderlineError = { sp = c.error, undercurl = true }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { sp = c.warning, undercurl = true }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { sp = c.info, undercurl = true }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { sp = c.hint, undercurl = true }, -- Used to underline "Hint" diagnostics
    DiagnosticUnderlineOk = { sp = c.hint, undercurl = true },
    DiagnosticVirtualTextError = { fg = c.error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { fg = c.warning }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { fg = c.info }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { fg = c.hint }, -- Used for "Hint" diagnostic virtual text
    DiagnosticVirtualTextOk = { fg = c.hint },

    -- Syntax Highlighting
    Boolean = { fg = c.gray600, bold = styles.keywords.bold },
    Character = { fg = c.gray600, bold = styles.keywords.bold }, --  a character constant: 'c', '\n'
    Conditional = { fg = c.white, bold = styles.keywords.bold },
    Constant = { fg = c.gray600, bold = styles.keywords.bold }, -- (preferred) any constant
    Debug = { fg = c.white }, --    debugging statements
    Define = { fg = c.white, bold = styles.keywords.bold },
    Delimiter = { fg = c.white }, --  character that needs attention
    Error = { fg = c.red, bold = styles.keywords.bold }, -- (preferred) any erroneous construct
    Exception = { fg = c.white },
    Float = { fg = c.gray600, bold = styles.keywords.bold },
    Function = { fg = c.gray50, bold = styles.functions.bold }, -- function name (also: methods for classes)
    Identifier = { fg = c.white, bold = styles.keywords.bold }, -- (preferred) any variable name
    Include = { fg = c.white, bold = styles.keywords.bold },
    Keyword = { fg = c.gray50, bold = styles.keywords.bold }, --  any other keyword
    Label = { fg = c.white },
    Macro = { fg = c.white, bold = styles.keywords.bold },
    Number = { fg = c.gray600, bold = styles.keywords.bold },
    Operator = { fg = c.gray300, bold = styles.keywords.bold }, -- "sizeof", "+", "*", etc.
    PreCondit = { fg = c.white, bold = styles.keywords.bold },
    PreProc = "PreCondit", -- (preferred) generic Preprocessor
    Repeat = { fg = c.white },
    Special = { fg = c.white }, -- (preferred) any special symbol
    SpecialChar = "Special",
    SpecialComment = { fg = c.gray600, bold = styles.keywords.bold },
    Statement = { fg = c.white, bold = styles.keywords.bold }, -- (preferred) any statement
    StorageClass = { fg = c.white, bold = styles.keywords.bold },
    String = { fg = c.gray450 }, --   a string constant: "this is a string"
    Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
    Structure = { fg = c.white, bold = styles.keywords.bold },
    Tag = { fg = c.white },
    Todo = { fg = c.bg_border_info, bg = c.info, bold = styles.keywords.bold }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Type = { fg = c.gray50, bold = styles.keywords.bold }, -- (preferred) int, long, char, etc.
    TypeDef = "Type",
    Italic = { italic = true, fg = c.gray100 }, -- (preferred) any italic text
    Bold = { bold = true, fg = c.gray100 }, -- (preferred) any bold text

    -- Misc
    debugBreakpoint = { bg = Util.blend_bg(c.info, 0.10), fg = c.info }, -- used for breakpoint colors in terminal-debug
    debugPC = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    dosIniLabel = "@property",
    helpCommand = { bg = c.black, fg = c.info },
    helpExample = { fg = c.comment },
    -- htmlH1                      = { fg = c.green500, bold = true },
    -- htmlH2                      = { fg = c.orange500, bold = true },
    qfFileName = { fg = c.trace },
    qfLineNr = { fg = c.gray700 },

    -- Health
    healthError = { fg = c.error },
    healthSuccess = { fg = c.hint },
    healthWarning = { fg = c.warning },

    -- Diff
    DiffAdd = { fg = c.git.add, bg = c.diff.add },
    DiffChange = { fg = c.git.change, bg = c.diff.change },
    DiffDelete = { fg = c.git.delete, bg = c.diff.delete },
    DiffText = { fg = c.git.text, bg = c.diff.text },
    diffAdded = { bg = c.diff.add, fg = c.git.add },
    diffRemoved = { bg = c.diff.delete, fg = c.git.delete },
    diffChanged = { bg = c.diff.change, fg = c.git.change },
    diffOldFile = { fg = c.git.delete, bg = c.diff.delete },
    diffNewFile = { fg = c.git.add, bg = c.diff.add },
    diffFile = { fg = c.trace, bg = Util.blend_bg(c.trace, 0.10) },
    diffLine = { fg = c.comment },
    diffIndexLine = { fg = c.purple100 },
  }
end

return M
