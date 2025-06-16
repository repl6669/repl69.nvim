
Understanding the modular architecture that makes repl69 maintainable and extensible.

## 🏗️ Overview

Repl69 has evolved from a monolithic colorscheme into a highly modular theming ecosystem. This architecture guide explains the design principles, file organization, and extension patterns.

## 📁 Directory Structure

```
lua/repl69/
├── init.lua                 # Main entry point
├── config.lua              # Configuration management
├── palette.lua             # Color definitions
├── theme.lua               # Theme orchestration
├── util.lua                # Utility functions
├── colors/
│   ├── init.lua            # Color initialization
│   └── darkness.lua        # Main color variant
└── groups/
    ├── init.lua            # Plugin orchestration
    ├── base.lua            # Core editor highlights
    ├── treesitter.lua      # Treesitter highlights
    ├── 
    ├── # Language/Syntax specific
    ├── html.lua            # HTML syntax
    ├── markdown.lua        # Markdown syntax
    ├── lsp.lua             # LSP highlights
    ├── git.lua             # Git diff highlights
    ├── health.lua          # Health check highlights
    ├── semantic-tokens.lua # Enhanced LSP semantics
    ├── 
    ├── # Plugin highlights (69+ files)
    ├── telescope.lua       # Telescope plugin
    ├── cmp.lua            # Completion plugin
    ├── blink.lua          # Modern completion
    ├── flash.lua          # Motion plugin
    ├── alpha.lua          # Dashboard plugin
    ├── mini_*.lua         # Mini.nvim ecosystem (16 files)
    ├── mason.lua          # Package manager
    ├── neogit.lua         # Git integration
    ├── snacks.lua         # UI utilities
    ├── render-markdown.lua # Markdown rendering
    └── ...                # Many more plugins
```

## 🎯 Design Principles

### 1. **Modular Architecture**
- Each plugin has its own highlight file
- Clear separation of concerns
- Easy to add/remove plugin support
- Independent testing and maintenance

### 2. **Consistent Theming**
- Unified grayscale color palette
- Consistent styling patterns
- Harmonized across all plugins
- Maintains visual coherence

### 3. **Performance Optimization**
- On-demand plugin loading
- Intelligent auto-detection
- Efficient caching system
- Minimal startup impact

### 4. **Extensibility**
- Simple plugin addition process
- Standardized highlight patterns
- Template-driven development
- Community-friendly contribution

## 🔧 Core Components

### 1. Configuration System (`config.lua`)

```lua
-- Manages all configuration options
M.defaults = {
  style = "darkness",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = { bold = true },
    variables = { italic = true },
  },
  plugins = {
    all = false,
    auto = true,
    -- Individual plugin controls
  },
}
```

**Key Features**:
- Centralized configuration management
- Plugin enable/disable controls
- Style consistency settings
- User customization hooks

### 2. Color Palette (`palette.lua`)

```lua
-- Defines the core grayscale progression
colors = {
  black = "#000000",
  gray950 = "#0a0a0a",
  gray925 = "#131313",
  gray900 = "#171717",
  -- ... grayscale progression
  gray50 = "#fafafa",
  white = "#ffffff",
  
  -- Semantic colors
  error = "#ef4444",
  warning = "#f59e0b",
  info = "#3b82f6",
  hint = "#10b981",
}
```

**Key Features**:
- Systematic grayscale progression
- Semantic color definitions
- Background/foreground variants
- Transparency support

### 3. Plugin Orchestration (`groups/init.lua`)

```lua
M.plugins = {
  ["telescope.nvim"] = "telescope",
  ["nvim-cmp"] = "cmp",
  ["flash.nvim"] = "flash",
  ["blink.cmp"] = "blink",
  ["mason.nvim"] = "mason",
  ["snacks.nvim"] = "snacks",
  ["render-markdown.nvim"] = "render-markdown",
  -- ... 69+ plugin mappings
}

-- Loads and combines highlights
function M.setup(colors, opts)
  local groups = {
    base = true,           -- Always enabled
    html = true,           # Core language support
    markdown = true,
    lsp = true,
    git = true,
    treesitter = true,
    ["semantic-tokens"] = true,
  }
  
  -- Plugin detection and loading logic
  -- Returns combined highlight table
end
```

**Key Features**:
- Plugin name mapping
- Intelligent loading
- Priority management
- Conflict resolution

### 4. Highlight Modules

Each plugin follows a standardized pattern:

```lua
-- Template: lua/repl69/groups/plugin_name.lua
local M = {}

M.url = "https://github.com/author/plugin-name"

---@type repl69.HighlightsFn
function M.get(c, opts)
  local styles = opts.styles
  
  -- stylua: ignore
  return {
    PluginHighlight1 = { fg = c.gray200, bold = styles.keywords.bold },
    PluginHighlight2 = { fg = c.gray400, bg = c.bg_float },
    -- ... more highlights
  }
end

return M
```

**Standards**:
- Consistent API (`M.get(colors, opts)`)
- Style parameter usage
- Documentation links
- Grayscale color usage

## 🎨 Color System

### Grayscale Progression
Repl69 uses a systematic 20-step grayscale progression:

```
black     → gray950 → gray925 → gray900 → gray850 → gray800
gray750   → gray700 → gray650 → gray600 → gray550 → gray500  
gray450   → gray400 → gray350 → gray300 → gray250 → gray200
gray150   → gray100 → gray50  → white
```

### Usage Patterns

| Element Type | Color Range | Example |
|-------------|-------------|---------|
| **Background** | `black` - `gray900` | Editor background, sidebars |
| **UI Elements** | `gray800` - `gray500` | Borders, separators, guides |
| **Secondary Text** | `gray600` - `gray400` | Comments, inactive elements |
| **Primary Text** | `gray300` - `gray100` | Normal text, keywords |
| **Emphasis** | `gray200` - `white` | Functions, titles, focus |

### Semantic Colors
```lua
-- Only used for specific semantic meaning
error   = "#ef4444"    -- Red for errors
warning = "#f59e0b"    -- Amber for warnings  
info    = "#3b82f6"    -- Blue for information
hint    = "#10b981"    -- Green for hints/success
```

## 🔌 Plugin Integration Patterns

### 1. **LSP Integration**
Many plugins support LSP symbol kinds:

```lua
-- Standard LSP kind mapping
local lsp_kinds = {
  Text          = { fg = c.gray100 },
  Method        = { fg = c.gray200 },
  Function      = { fg = c.gray200 },
  Constructor   = { fg = c.gray200 },
  Field         = { fg = c.gray300 },
  Variable      = { fg = c.gray100 },
  Class         = { fg = c.gray200 },
  Interface     = { fg = c.gray200 },
  -- ... more kinds
}

-- Applied to plugin-specific prefixes
for kind, style in pairs(lsp_kinds) do
  highlights["PluginKind" .. kind] = style
end
```

### 2. **State-based Highlighting**
UI plugins often have multiple states:

```lua
-- Example: Buffer states in tabline plugins
BufferCurrent    = { fg = c.fg, bg = c.bg },           -- Active
BufferInactive   = { fg = c.gray500, bg = c.gray900 }, -- Inactive
BufferVisible    = { fg = c.gray300, bg = c.gray800 }, -- Visible but not current
BufferModified   = { fg = c.warning },                 -- Has changes
BufferError      = { fg = c.error },                   -- Has errors
```

### 3. **Diagnostic Integration**
Development tools integrate with Neovim diagnostics:

```lua
-- Consistent diagnostic styling
PluginError   = { fg = c.error },    -- Link to semantic colors
PluginWarn    = { fg = c.warning },
PluginInfo    = { fg = c.info },
PluginHint    = { fg = c.hint },
```

## 🔧 Extension Patterns

### Adding a New Plugin

1. **Create highlight file**:
```bash
# lua/repl69/groups/new_plugin.lua
```

2. **Follow the template**:
```lua
local M = {}
M.url = "https://github.com/author/plugin"

function M.get(c, opts)
  local styles = opts.styles
  return {
    -- Plugin highlights using grayscale colors
    NewPluginNormal = { fg = c.gray100, bg = c.bg_float },
    NewPluginBorder = { fg = c.gray500 },
  }
end

return M
```

3. **Register in init.lua**:
```lua
M.plugins = {
  ["new-plugin.nvim"] = "new_plugin",
}
```

4. **Test the integration**:
```lua
require('repl69').setup({
  plugins = { ['new_plugin'] = true }
})
```

### Plugin Categories

Plugins are organized into logical categories:

- **Core**: Essential editing functionality
- **Language**: Syntax and language-specific
- **Development**: Debugging, testing, git
- **UI**: Interface enhancements
- **Navigation**: Search, motion, file management
- **Completion**: Autocompletion systems

## 📊 Performance Considerations

### Loading Strategy
```lua
-- Only load what's needed
if opts.plugins.all then
  -- Load all plugins
elseif opts.plugins.auto then
  -- Auto-detect installed plugins
else
  -- Load only explicitly enabled plugins
end
```

### Caching System
```lua
-- Cache compiled highlights for performance
if opts.cache then
  -- Use cached version if available
  -- Regenerate on configuration changes
end
```

### Memory Optimization
- Highlights loaded on-demand
- Unused plugins never loaded
- Efficient table merging
- Minimal memory footprint

## 🧪 Testing Architecture

### Automated Testing
```lua
-- Test plugin highlight loading
local function test_plugin(plugin_name)
  local highlights = require('repl69.groups.' .. plugin_name).get(colors, opts)
  assert(highlights and type(highlights) == 'table')
  -- Validate highlight structure
end
```

### Manual Testing Patterns
```lua
-- Enable specific plugin for testing
require('repl69').setup({
  plugins = { [plugin_name] = true }
})

-- Verify highlights are applied
local hl = vim.api.nvim_get_hl(0, { name = 'PluginHighlight' })
assert(next(hl), 'Highlight not found')
```

## 🚀 Future Architecture

### Planned Enhancements
1. **Theme Variants**: Multiple color schemes using same architecture
2. **Dynamic Theming**: Runtime color adjustments
3. **Plugin Templates**: Automated plugin integration
4. **Performance Monitoring**: Built-in performance tracking

### Contribution Guidelines
1. Follow the modular pattern
2. Use consistent color mappings
3. Include comprehensive tests
4. Document highlight groups
5. Maintain backward compatibility

---

This modular architecture enables repl69 to support 69+ plugins while maintaining performance, consistency, and extensibility. The systematic approach makes it easy for contributors to add new plugins and for users to customize their experience.

*For practical examples, see the [Plugin Guide](PLUGIN_GUIDE.md) and [Plugin Reference](PLUGINS.md)*