-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false
vim.g.lazyvim_python_ruff = "ruff"
vim.g.snacks_animate = false

-- Auto-detect file indentation settings
vim.opt.modeline = true -- Enable modeline detection
vim.opt.modelines = 5 -- Check first/last 5 lines for modelines
vim.opt.autoindent = true -- Copy indent from current line when starting new line
vim.opt.smartindent = true -- Smart autoindenting for C-like programs

-- Buffer-centric workflow optimizations
vim.opt.hidden = true -- Allow switching buffers without saving
vim.opt.switchbuf = "useopen,usetab" -- Jump to existing buffer/tab if open

-- Command-line completion (for :b command)
vim.opt.wildmenu = true -- Enable command-line completion menu
vim.opt.wildmode = "list:longest,full" -- List all matches and complete longest common, then full
vim.opt.wildignore = "*.o,*.obj,*.pyc,*~,*.swp,*.class,*.DS_Store" -- Ignore patterns for file/buffer completion

-- Tabline settings - only show filename in tabs
vim.opt.tabline = "%!v:lua.require'config.tabline'.render()" -- Custom tabline: show only filename
