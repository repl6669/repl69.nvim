# Architecture Guide

Exploring the architecture that ensures `repl69` is both maintainable and easy to extend.

## Directory Structure

```
lua/repl69/
├── init.lua                 # Main entry point
├── config.lua              # Configuration management
├── palette.lua             # Color definitions
├── theme.lua               # Theme orchestration
├── util.lua                # Utility functions
├── colors/
│   ├── init.lua            # Color initialization
│   ├── void.lua            # Main color variant (dark theme)
│   └── hell.lua            # Light color variant
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

## Core Components

### 1. Configuration System (`config.lua`)

```lua
-- Manages all configuration options
M.defaults = {
  style = "void",
  light_style = "hell",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = { bold = true },
    variables = { italic = true },
    sidebars = "dark",
    floats = "dark",
  },
  dim_inactive = false,
  lualine_bold = false,
  cache = true,
  plugins = {
    all = package.loaded.lazy == nil,
    auto = true,
    -- Individual plugin controls
  },
  on_colors = function(colors) end,
  on_highlights = function(highlights, colors) end,
}
```

Key Features:

- Centralized configuration management
- Support for both dark (`void`) and light (`hell`) styles
- Advanced styling options for sidebars and floats
- Plugin enable/disable controls
- Style consistency settings
- User customization hooks
- Performance caching system
- Lualine integration settings

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

Key Features:

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
    html = true,           -- Core language support
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

Key Features:

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

Standards:

- Style parameter usage
- Documentation links
- Grayscale color usage

