# Repl69 Plugin Ecosystem Guide

Repl69 has evolved into a comprehensive theming ecosystem with support for 50+ popular Neovim plugins. This guide helps you understand and configure the extensive plugin support.

## 🎯 Quick Start

### Enable All Plugins
```lua
require('repl69').setup({
  plugins = {
    all = true,  -- Enable all supported plugins
  }
})
```

### Auto-detect Plugins (Recommended)
```lua
require('repl69').setup({
  plugins = {
    auto = true,  -- Automatically enable plugins you have installed
  }
})
```

### Selective Plugin Support
```lua
require('repl69').setup({
  plugins = {
    -- Core editing
    telescope = true,
    cmp = true,
    treesitter = true,
    
    -- Git integration
    gitsigns = true,
    neogit = true,
    
    -- File management
    ['nvim-tree'] = true,
    ['neo-tree'] = true,
    
    -- Modern completion
    blink = true,
    
    -- Motion plugins
    flash = true,
    hop = true,
    leap = true,
  }
})
```

## 📚 Plugin Categories

### 🔍 **Search & Navigation**
- **telescope** - Fuzzy finder
- **fzf** - Command line fuzzy finder
- **aerial** - Code outline and symbols
- **flash** - Modern motion plugin
- **hop** - EasyMotion-like navigation
- **leap** - Motion plugin with labels

### 💻 **Completion & LSP**
- **cmp** - Autocompletion framework
- **blink** - Modern completion plugin
- **lsp** - Built-in LSP highlights
- **semantic-tokens** - Enhanced LSP semantics
- **copilot** - GitHub Copilot integration
- **ale** - Asynchronous Lint Engine

### 📁 **File Management**
- **nvim-tree** - File explorer tree
- **neo-tree** - Modern file explorer
- **mini_files** - Minimalist file explorer

### 🎨 **UI Enhancement**
- **alpha** - Dashboard/greeter
- **dashboard** - Start screen
- **noice** - UI improvements
- **notify** - Notification system
- **trouble** - Diagnostics panel
- **which-key** - Keybinding helper

### 📊 **Status & Tablines**
- **mini_statusline** - Minimalist statusline
- **mini_tabline** - Simple tabline
- **barbar** - Advanced tabline
- **bufferline** - Buffer tabs

### 🔧 **Development Tools**
- **dap** - Debug Adapter Protocol
- **neotest** - Test runner
- **mini_test** - Test framework
- **gitsigns** - Git integration
- **gitgutter** - Git diff in gutter

### ✨ **Mini.nvim Ecosystem (13 plugins)**
Complete support for the mini.nvim plugin collection:
- **mini_completion** - Completion engine
- **mini_cursorword** - Highlight word under cursor
- **mini_diff** - Git diff visualization
- **mini_files** - File explorer
- **mini_hipatterns** - Pattern highlighting (TODO, FIXME, etc.)
- **mini_indentscope** - Indent scope visualization
- **mini_jump** - Jump/motion functionality
- **mini_map** - Code minimap
- **mini_notify** - Notifications
- **mini_operators** - Text operators
- **mini_pick** - General picker/selector
- **mini_starter** - Start screen
- **mini_statusline** - Status line
- **mini_surround** - Surround operations
- **mini_tabline** - Tab line
- **mini_test** - Testing framework
- **mini_trailspace** - Trailing whitespace

## 🎛️ Configuration Examples

### Modern Development Setup
```lua
require('repl69').setup({
  plugins = {
    -- Core
    telescope = true,
    blink = true,           -- Modern completion
    treesitter = true,
    
    -- LSP & Diagnostics
    lsp = true,
    ['semantic-tokens'] = true,
    trouble = true,
    aerial = true,         -- Code outline
    
    -- Git
    gitsigns = true,
    
    -- UI
    alpha = true,          -- Dashboard
    noice = true,          -- Enhanced UI
    flash = true,          -- Modern motion
    
    -- File management
    ['mini_files'] = true,
    
    -- Development
    dap = true,            -- Debugging
    neotest = true,        -- Testing
    copilot = true,        -- AI assistance
  }
})
```

### Minimalist Setup
```lua
require('repl69').setup({
  plugins = {
    -- Essential only
    telescope = true,
    cmp = true,
    gitsigns = true,
    
    -- Mini essentials
    ['mini_statusline'] = true,
    ['mini_cursorword'] = true,
    ['mini_files'] = true,
  }
})
```

### Power User Setup
```lua
require('repl69').setup({
  plugins = {
    all = true,  -- Enable everything!
    
    -- Override specific plugins if needed
    -- some_plugin = false,  -- Disable specific plugin
  }
})
```

## 🔧 Plugin-Specific Notes

### Completion Plugins
- **blink**: Modern, fast completion with built-in LSP kinds
- **cmp**: Traditional nvim-cmp with extensive customization

### Motion Plugins
- **flash**: Most modern, successor to lightspeed
- **hop**: Stable, well-established
- **leap**: Minimalist, efficient

### File Explorers
- **nvim-tree**: Traditional tree view
- **neo-tree**: Modern with git integration
- **mini_files**: Minimal, fast

### Statuslines
- **mini_statusline**: Lightweight, sufficient for most users
- Use with `lualine_bold = false` in repl69 config for consistency

## 🎨 Customization

### Override Plugin Colors
```lua
require('repl69').setup({
  plugins = { telescope = true },
  on_highlights = function(highlights, colors)
    -- Customize telescope colors
    highlights.TelescopeNormal = { bg = colors.gray950 }
    highlights.TelescopeBorder = { fg = colors.gray300 }
  end,
})
```

### Style Consistency
Repl69 maintains visual consistency across all plugins using:
- Grayscale color progression
- Consistent bold/italic styling
- Unified diagnostic colors
- Harmonized transparency support

## 📈 Performance

- Plugin highlights are loaded on-demand
- `auto = true` only loads plugins you have installed
- Minimal impact on startup time
- Cached for better performance when `cache = true`

## 🔍 Troubleshooting

### Plugin Not Working?
1. Ensure the plugin is installed
2. Check the exact plugin name in the mapping
3. Enable explicitly: `plugins = { ['plugin-name'] = true }`
4. Restart Neovim after configuration changes

### Performance Issues?
1. Use `auto = true` instead of `all = true`
2. Enable only plugins you actively use
3. Set `cache = true` in config

### Color Inconsistencies?
1. Ensure you're using the latest repl69 version
2. Check for conflicting colorscheme settings
3. Use `on_highlights` to override specific colors

## 🆕 Adding New Plugins

Want support for a plugin not listed? Create an issue with:
1. Plugin name and repository
2. Key highlight groups needed
3. Example usage

The modular architecture makes adding new plugins straightforward!

---

*For the complete list of supported plugins, see the [Plugin Reference](PLUGINS.md)*