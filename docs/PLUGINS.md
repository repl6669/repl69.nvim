# Repl69 Plugin Reference

Complete reference of all supported plugins with their highlight groups and configuration options.

## 📊 Overview

- **Total Plugins Supported**: 50+
- **Plugin Categories**: 8
- **Highlight Groups**: 1,900+
- **Mini.nvim Plugins**: 13/21 supported

## 🔍 Search & Navigation

### telescope.nvim
**Repository**: [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
**Config Key**: `telescope`

**Key Highlights**:
- `TelescopeNormal` - Main telescope window
- `TelescopeBorder` - Window border
- `TelescopePrompt` - Input prompt
- `TelescopeSelection` - Selected item
- `TelescopeMatching` - Matched text

### fzf-lua
**Repository**: [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)
**Config Key**: `fzf`

### aerial.nvim
**Repository**: [stevearc/aerial.nvim](https://github.com/stevearc/aerial.nvim)
**Config Key**: `aerial`

**Key Highlights**:
- `AerialNormal` - Main aerial window
- `AerialGuide` - Guide lines
- `Aerial*Icon` - LSP symbol icons (Function, Class, etc.)

### flash.nvim
**Repository**: [folke/flash.nvim](https://github.com/folke/flash.nvim)
**Config Key**: `flash`

**Key Highlights**:
- `FlashBackdrop` - Dimmed background
- `FlashLabel` - Jump labels

### hop.nvim
**Repository**: [phaazon/hop.nvim](https://github.com/phaazon/hop.nvim)
**Config Key**: `hop`

**Key Highlights**:
- `HopNextKey` - Primary jump key
- `HopNextKey1` - Secondary jump key
- `HopNextKey2` - Tertiary jump key
- `HopUnmatched` - Non-matching text

### leap.nvim
**Repository**: [ggandor/leap.nvim](https://github.com/ggandor/leap.nvim)
**Config Key**: `leap`

**Key Highlights**:
- `LeapMatch` - Matched targets
- `LeapLabel` - Jump labels
- `LeapBackdrop` - Dimmed background

## 💻 Completion & LSP

### nvim-cmp
**Repository**: [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
**Config Key**: `cmp`

**Key Highlights**:
- `CmpItemKind*` - Completion item kinds
- `CmpItemMenu` - Completion menu
- `CmpItemAbbr` - Completion text

### blink.cmp
**Repository**: [Saghen/blink.cmp](https://github.com/Saghen/blink.cmp)
**Config Key**: `blink`

**Key Highlights**:
- `BlinkCmpMenu` - Completion menu
- `BlinkCmpDoc` - Documentation window
- `BlinkCmpKind*` - LSP symbol kinds
- `BlinkCmpLabel` - Completion labels
- `BlinkCmpGhostText` - Ghost text suggestions

### Built-in LSP
**Config Key**: `lsp`

**Key Highlights**:
- `LspCodeLens` - Code lens
- `LspInlayHint` - Inlay hints
- `LspReference*` - Symbol references

### Semantic Tokens
**Config Key**: `semantic-tokens`

**Key Highlights**:
- `@lsp.type.*` - LSP semantic types
- `@lsp.typemod.*` - LSP type modifiers

### GitHub Copilot
**Repository**: [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua)
**Config Key**: `copilot`

**Key Highlights**:
- `CopilotAnnotation` - AI suggestions annotation
- `CopilotSuggestion` - AI code suggestions

### ALE (Asynchronous Lint Engine)
**Repository**: [dense-analysis/ale](https://github.com/dense-analysis/ale)
**Config Key**: `ale`

**Key Highlights**:
- `ALEErrorSign` - Error signs
- `ALEWarningSign` - Warning signs

## 📁 File Management

### nvim-tree.lua
**Repository**: [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
**Config Key**: `nvim-tree`

**Key Highlights**:
- `NvimTreeNormal` - Tree window
- `NvimTreeFolderIcon` - Folder icons
- `NvimTreeGit*` - Git status indicators
- `NvimTreeIndentMarker` - Indent guides

### neo-tree.nvim
**Repository**: [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
**Config Key**: `neo-tree`

## 🎨 UI Enhancement

### alpha-nvim
**Repository**: [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)
**Config Key**: `alpha`

**Key Highlights**:
- `AlphaHeader` - Dashboard header
- `AlphaShortcut` - Shortcut keys
- `AlphaButtons` - Action buttons
- `AlphaFooter` - Footer text

### dashboard-nvim
**Repository**: [nvimdev/dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
**Config Key**: `dashboard`

**Key Highlights**:
- `DashboardHeader` - Header text
- `DashboardKey` - Shortcut keys
- `DashboardIcon` - Icons
- `DashboardDesc` - Descriptions

### noice.nvim
**Repository**: [folke/noice.nvim](https://github.com/folke/noice.nvim)
**Config Key**: `noice`

**Key Highlights**:
- `NoiceCmdlineIcon*` - Command line icons
- `NoiceCmdlinePopup*` - Popup styling
- `NoiceCompletionItemKind*` - Completion kinds

### nvim-notify
**Repository**: [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
**Config Key**: `notify`

### trouble.nvim
**Repository**: [folke/trouble.nvim](https://github.com/folke/trouble.nvim)
**Config Key**: `trouble`

### which-key.nvim
**Repository**: [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
**Config Key**: `which-key`

## 📊 Status & Tablines

### barbar.nvim
**Repository**: [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim)
**Config Key**: `barbar`

**Key Highlights**:
- `BufferCurrent` - Active buffer
- `BufferInactive` - Inactive buffers
- `Buffer*ERROR/WARN/INFO` - Diagnostic indicators
- `BufferVisible` - Visible but not current

### bufferline.nvim
**Repository**: [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
**Config Key**: `bufferline`

## 🔧 Development Tools

### nvim-dap-ui
**Repository**: [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
**Config Key**: `dap`

**Key Highlights**:
- `DapStoppedLine` - Debugger stopped line

### neotest
**Repository**: [nvim-neotest/neotest](https://github.com/nvim-neotest/neotest)
**Config Key**: `neotest`

**Key Highlights**:
- `NeotestPassed` - Passed tests
- `NeotestFailed` - Failed tests
- `NeotestRunning` - Running tests
- `NeotestSkipped` - Skipped tests

### gitsigns.nvim
**Repository**: [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
**Config Key**: `gitsigns`

### vim-gitgutter
**Repository**: [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)
**Config Key**: `gitgutter`

## ✨ Mini.nvim Ecosystem

### Core Mini Plugins

#### mini.completion
**Repository**: [echasnovski/mini.completion](https://github.com/echasnovski/mini.completion)
**Config Key**: `mini_completion`

#### mini.files
**Repository**: [echasnovski/mini.files](https://github.com/echasnovski/mini.files)
**Config Key**: `mini_files`

**Key Highlights**:
- `MiniFilesNormal` - File explorer window
- `MiniFilesBorder` - Window border
- `MiniFilesDirectory` - Directory entries
- `MiniFilesTitleFocused` - Focused window title

#### mini.pick
**Repository**: [echasnovski/mini.pick](https://github.com/echasnovski/mini.pick)
**Config Key**: `mini_pick`

**Key Highlights**:
- `MiniPickNormal` - Picker window
- `MiniPickBorder` - Window border
- `MiniPickPrompt` - Input prompt
- `MiniPickMatchCurrent` - Current match

### UI Mini Plugins

#### mini.statusline
**Repository**: [echasnovski/mini.statusline](https://github.com/echasnovski/mini.statusline)
**Config Key**: `mini_statusline`

**Key Highlights**:
- `MiniStatuslineMode*` - Mode-specific colors
- `MiniStatuslineFilename` - File name section
- `MiniStatuslineDevinfo` - Development info

#### mini.tabline
**Repository**: [echasnovski/mini.tabline](https://github.com/echasnovski/mini.tabline)
**Config Key**: `mini_tabline`

#### mini.starter
**Repository**: [echasnovski/mini.starter](https://github.com/echasnovski/mini.starter)
**Config Key**: `mini_starter`

#### mini.notify
**Repository**: [echasnovski/mini.notify](https://github.com/echasnovski/mini.notify)
**Config Key**: `mini_notify`

### Editing Mini Plugins

#### mini.cursorword
**Repository**: [echasnovski/mini.cursorword](https://github.com/echasnovski/mini.cursorword)
**Config Key**: `mini_cursorword`

#### mini.indentscope
**Repository**: [echasnovski/mini.indentscope](https://github.com/echasnovski/mini.indentscope)
**Config Key**: `mini_indentscope`

#### mini.surround
**Repository**: [echasnovski/mini.surround](https://github.com/echasnovski/mini.surround)
**Config Key**: `mini_surround`

#### mini.jump
**Repository**: [echasnovski/mini.jump](https://github.com/echasnovski/mini.jump)
**Config Key**: `mini_jump`

### Development Mini Plugins

#### mini.diff
**Repository**: [echasnovski/mini.diff](https://github.com/echasnovski/mini.diff)
**Config Key**: `mini_diff`

#### mini.test
**Repository**: [echasnovski/mini.test](https://github.com/echasnovski/mini.test)
**Config Key**: `mini_test`

#### mini.hipatterns
**Repository**: [echasnovski/mini.hipatterns](https://github.com/echasnovski/mini.hipatterns)
**Config Key**: `mini_hipatterns`

**Key Highlights**:
- `MiniHipatternsFixme` - FIXME pattern
- `MiniHipatternsTodo` - TODO pattern
- `MiniHipatternsNote` - NOTE pattern
- `MiniHipatternsHack` - HACK pattern

### Utility Mini Plugins

#### mini.map
**Repository**: [echasnovski/mini.map](https://github.com/echasnovski/mini.map)
**Config Key**: `mini_map`

#### mini.operators
**Repository**: [echasnovski/mini.operators](https://github.com/echasnovski/mini.operators)
**Config Key**: `mini_operators`

#### mini.trailspace
**Repository**: [echasnovski/mini.trailspace](https://github.com/echasnovski/mini.trailspace)
**Config Key**: `mini_trailspace`

## 🎯 Other Plugins

### Syntax & Language

#### indent-blankline.nvim
**Repository**: [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
**Config Key**: `indent-blankline`

#### rainbow-delimiters.nvim
**Repository**: [HiPhish/rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)
**Config Key**: `rainbow`

### Built-in Language Support

#### HTML
**Config Key**: `html` (auto-enabled)

#### Markdown
**Config Key**: `markdown` (auto-enabled)

#### Git
**Config Key**: `git` (auto-enabled)

#### Health
**Config Key**: `health` (auto-enabled)

## 🔧 Configuration Matrix

| Plugin Category | Essential | Recommended | Power User |
|----------------|-----------|-------------|------------|
| **Completion** | `cmp` | `blink` | Both |
| **Search** | `telescope` | `telescope` + `flash` | All motion plugins |
| **File Explorer** | `nvim-tree` | `mini_files` | Multiple explorers |
| **Statusline** | None | `mini_statusline` | Custom setup |
| **Git** | `gitsigns` | `gitsigns` + `mini_diff` | Full git suite |
| **Testing** | None | `neotest` | `neotest` + `mini_test` |
| **AI** | None | `copilot` | Multiple AI tools |

## 📚 Usage Examples

### Enable by Category
```lua
-- Modern development stack
plugins = {
  -- Search & Navigation
  telescope = true,
  flash = true,
  aerial = true,
  
  -- Completion & LSP
  blink = true,
  lsp = true,
  ['semantic-tokens'] = true,
  
  -- File Management
  ['mini_files'] = true,
  
  -- UI Enhancement
  alpha = true,
  noice = true,
  
  -- Development Tools
  dap = true,
  neotest = true,
  gitsigns = true,
}
```

### Mini.nvim Focus
```lua
-- Pure mini.nvim setup
plugins = {
  ['mini_completion'] = true,
  ['mini_files'] = true,
  ['mini_pick'] = true,
  ['mini_statusline'] = true,
  ['mini_cursorword'] = true,
  ['mini_indentscope'] = true,
  ['mini_diff'] = true,
  ['mini_hipatterns'] = true,
  ['mini_starter'] = true,
}
```

---

*This reference covers all supported plugins. For setup guides and examples, see the [Plugin Guide](PLUGIN_GUIDE.md)*