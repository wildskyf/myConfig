return {
  -- Disable typescript-tools.nvim (use LazyVim's default vtsls instead)
  {
    "pmizio/typescript-tools.nvim",
    enabled = false,
  },

  -- Mason: ensure TypeScript tools are installed
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "prettier",
        "eslint-lsp",
      },
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 10,
    },
  },
}
