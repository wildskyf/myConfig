-- Custom tabline to show only filename in tabs
local M = {}

function M.render()
  local tabline = ""
  local current_tab = vim.fn.tabpagenr()

  for i = 1, vim.fn.tabpagenr("$") do
    -- Get the buffer number in this tab
    local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
    local bufname = vim.fn.bufname(bufnr)

    -- Extract filename only (tail of path)
    local filename = vim.fn.fnamemodify(bufname, ":t")
    if filename == "" then
      filename = "[No Name]"
    end

    -- Check if buffer is modified
    local modified = vim.fn.getbufvar(bufnr, "&modified") == 1 and "+" or ""

    -- Highlight for current vs inactive tab
    if i == current_tab then
      tabline = tabline .. "%#TabLineSel#"
    else
      tabline = tabline .. "%#TabLine#"
    end

    -- Add tab content: number + filename + modified flag
    tabline = tabline .. " " .. i .. " " .. filename .. modified .. " "

    -- Add separator
    tabline = tabline .. "%#TabLineFill#"
  end

  -- Fill the rest of the tabline
  tabline = tabline .. "%#TabLineFill#"

  return tabline
end

return M
