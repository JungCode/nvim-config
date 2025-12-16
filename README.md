# Neovim Configuration

A modern Neovim configuration based on [LazyVim](https://www.lazyvim.org/) with AI-powered coding assistance, transparent backgrounds, and custom formatting settings.

## ✨ Features

- **LazyVim Foundation**: Built on top of LazyVim for a well-structured, extensible configuration
- **AI Assistance**: GitHub Copilot and Copilot Chat integration for intelligent code completion
- **Transparent Background**: Beautiful transparent UI that blends with your terminal
- **Auto-formatting**: Prettier integration for JavaScript, TypeScript, JSON, HTML, and CSS
- **Plugin Management**: Lazy.nvim for fast, efficient plugin loading
- **LSP Support**: Full Language Server Protocol support with automatic installation
- **Code Formatting**: StyLua configured for consistent Lua code style

## 📋 Prerequisites

Before installing, ensure you have the following installed:

- **Neovim >= 0.9.0** (required)
- **Git** (for cloning and plugin management)
- **Node.js** (for Copilot and formatters like Prettier)
- **A Nerd Font** (recommended for icons) - [Download here](https://www.nerdfonts.com/)
- **ripgrep** (for Telescope search) - Install via: `brew install ripgrep`
- **fd** (optional, for better file finding) - Install via: `brew install fd`

### Check Neovim Version

```bash
nvim --version
```

If you need to upgrade:

```bash
brew install neovim
```

## 🚀 Installation

### 1. Backup Existing Configuration

If you have an existing Neovim configuration, back it up first:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### 2. Clone This Configuration

```bash
git clone <your-repo-url> ~/.config/nvim
```

Or if you want to start fresh with this structure:

```bash
mkdir -p ~/.config/nvim
cd ~/.config/nvim
```

Then copy all the configuration files from this repository.

### 3. Install Dependencies

Install required tools for formatting and development:

```bash
# Install Node.js packages globally
npm install -g prettier

# Install ripgrep for Telescope
brew install ripgrep

# Install fd (optional but recommended)
brew install fd
```

### 4. Launch Neovim

```bash
nvim
```

On first launch:
- Lazy.nvim will automatically bootstrap itself
- All plugins will be installed automatically
- LSP servers will be installed via Mason
- This may take a few minutes

### 5. Setup GitHub Copilot (Optional)

If you want to use GitHub Copilot:

1. In Neovim, run:
   ```
   :Copilot auth
   ```
2. Follow the prompts to authenticate with GitHub
3. You need an active GitHub Copilot subscription

## 📁 Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Entry point - bootstraps lazy.nvim
├── lua/
│   ├── config/
│   │   ├── lazy.lua        # Lazy.nvim configuration
│   │   ├── options.lua     # Neovim options (extends LazyVim defaults)
│   │   ├── keymaps.lua     # Custom keymaps (extends LazyVim defaults)
│   │   └── autocmds.lua    # Auto commands (extends LazyVim defaults)
│   └── plugins/
│       ├── conform.lua     # Prettier formatter configuration
│       ├── copilot-keymap.lua  # Copilot keymap settings (commented out)
│       ├── transparent.lua # Transparent background plugin
│       └── example.lua     # Example plugin configurations (disabled)
├── .neoconf.json           # Neoconf and Neodev settings for Lua development
├── lazyvim.json            # LazyVim extras configuration
├── stylua.toml             # StyLua formatter settings
├── lazy-lock.json          # Plugin version lock file
└── README.md               # This file
```

## ⚙️ Key Configurations

### Plugin Manager (Lazy.nvim)

- **Auto-update**: Plugins are checked for updates automatically
- **Lazy loading**: Optimized startup time with intelligent lazy-loading
- **Default colorscheme**: Tokyo Night
- **Disabled plugins**: gzip, tar, zip plugins for better performance

### Formatters (Conform.nvim)

Auto-formatting on save with Prettier for:
- JavaScript/TypeScript (`.js`, `.jsx`, `.ts`, `.tsx`)
- JSON (`.json`)
- HTML (`.html`)
- CSS (`.css`)

**Timeout**: 8 seconds (increased for slower formatters like eslint_d)

### LazyVim Extras

Enabled extras (configured in `lazyvim.json`):
- `lazyvim.plugins.extras.ai.copilot` - GitHub Copilot integration
- `lazyvim.plugins.extras.ai.copilot-chat` - Copilot chat interface

### Transparent Background

The transparent.nvim plugin makes the following elements transparent:
- Normal windows
- Floating windows
- Float borders
- Telescope windows (all variants)

### Code Style (StyLua)

Lua files are formatted with:
- **Indent type**: Spaces
- **Indent width**: 2 spaces
- **Column width**: 120 characters

## 🎯 Default Keymaps

LazyVim comes with sensible defaults. Here are some essential keymaps:

### General
- `<leader>` - Space (default leader key)
- `<leader>l` - Open Lazy.nvim UI
- `<leader>e` - Toggle file explorer (Neo-tree)
- `<leader>qq` - Quit all

### File Navigation
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fr` - Recent files

### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Show hover documentation
- `<leader>ca` - Code actions
- `<leader>cr` - Rename symbol

### Copilot Chat
- `<leader>aa` - Toggle Copilot Chat
- `<leader>ax` - Clear chat
- `<leader>aq` - Quick chat

For a complete list of keymaps, press `<leader>?` in Neovim or visit the [LazyVim keymaps documentation](https://www.lazyvim.org/keymaps).

## 🔧 Customization

### Adding Plugins

Create a new file in `lua/plugins/` directory:

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  opts = {
    -- plugin options here
  },
}
```

### Changing Options

Edit `lua/config/options.lua`:

```lua
-- Example: Change line numbers
vim.opt.relativenumber = true
vim.opt.number = true
```

### Adding Keymaps

Edit `lua/config/keymaps.lua`:

```lua
-- Example: Add custom keymap
vim.keymap.set("n", "<leader>hw", "<cmd>echo 'Hello World'<cr>", { desc = "Hello World" })
```

### Disabling LazyVim Extras

Edit `lazyvim.json` and remove unwanted extras from the `extras` array.

## 🐛 Troubleshooting

### Plugins Not Loading

```bash
# Clear plugin cache and reinstall
rm -rf ~/.local/share/nvim
nvim
```

### LSP Not Working

1. Open Neovim
2. Run `:Mason` to check if LSP servers are installed
3. Install missing servers with `:MasonInstall <server-name>`

### Formatter Not Working

Check if Prettier is installed:

```bash
which prettier
```

If not found, install it:

```bash
npm install -g prettier
```

### Copilot Not Working

1. Ensure you're authenticated: `:Copilot auth`
2. Check status: `:Copilot status`
3. Restart Neovim

## 📚 Resources

- [LazyVim Documentation](https://www.lazyvim.org/)
- [Lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)
- [Neovim Documentation](https://neovim.io/doc/)
- [GitHub Copilot for Neovim](https://github.com/zbirenbaum/copilot.lua)

## 📝 License

This configuration is available under the same license as the original repository (see LICENSE file).

## 🤝 Contributing

Feel free to fork this configuration and make it your own! If you have improvements or suggestions, contributions are welcome.
