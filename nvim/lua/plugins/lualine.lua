return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Section A: Mode indicator (保留)
    opts.sections.lualine_a = { "mode" }

    -- Section B: 移除 git branch
    opts.sections.lualine_b = {}

    -- Section C: 相對路徑 + Diagnostics
    opts.sections.lualine_c = {
      {
        "filename",
        path = 1, -- 0=檔名, 1=相對路徑, 2=絕對路徑, 3=相對於HOME
        shorting_target = 40, -- 縮短過長的路徑
      },
      {
        "diagnostics",
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
      },
    }

    -- Section X: 移除 diff 資訊
    opts.sections.lualine_x = {}

    -- Section Y: 行號和進度 (保留)
    opts.sections.lualine_y = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    }

    -- Section Z: 移除時間
    opts.sections.lualine_z = {}

    return opts
  end,
}
