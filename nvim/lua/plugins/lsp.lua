return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- Override gd (go to definition) to open in new tab
      keys[#keys + 1] = {
        "gd",
        function()
          -- Get current position to restore if needed
          local current_buf = vim.api.nvim_get_current_buf()
          local mark = vim.api.nvim_buf_get_mark(current_buf, ".")

          -- Request definition
          local params = vim.lsp.util.make_position_params()
          vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result, ctx, config)
            if err or not result or vim.tbl_isempty(result) then
              vim.notify("No definition found", vim.log.levels.INFO)
              return
            end

            -- Normalize result (can be Location or Location[])
            local locations = vim.islist(result) and result or { result }

            -- If single result, open in new tab and jump
            if #locations == 1 then
              vim.cmd("tab split")
              vim.lsp.util.jump_to_location(locations[1], "utf-8")
            else
              -- Multiple results, use fzf-lua
              require("fzf-lua").lsp_definitions()
            end
          end)
        end,
        desc = "Go to definition in new tab",
      }
      -- Override gr (go to references) to open in new tab
      keys[#keys + 1] = {
        "gr",
        function()
          require("fzf-lua").lsp_references()
        end,
        desc = "Go to references",
      }
    end,
  },
}
