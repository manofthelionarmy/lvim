require("catppuccin").setup {
  flavour = "frappe", -- latte, frappe, macchiato, mocha
  integrations = {
    nvimtree = true,
    telescope = true,
    notify = false,
    mini = false,
    barbar = true,
    which_key = true,
    gitsigns = true,
    mason = true,
    cmp = true,
    dap = true, -- dap is Special
    navic = {
      enabled = true,
      custom_bg = "NONE"
    },
    treesitter_context = true,
    lsp_trouble = true
    -- ts_rainbow2 = true,
    -- coc_nvim = true,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
  custom_highlights = function(colors)
    return {
      Comment = { fg = colors.surface2, style = { "bold", "italic" } },
      ["@constant.builtin"] = { fg = colors.peach, style = {} },
      ["@comment"] = { fg = colors.surface2, style = { "bold", "italic" } },
      ["@property"] = { fg = colors.blue },
      CursorLineNr = { style = { "bold" } },
      -- ALEWarningSign = { fg = colors.yellow },
      -- AleWarningLine = { fg = colors.peach, style = { "bold", "undercurl" } },
      -- AleVirtualTextWarning = { fg = colors.peach, style = { "bold", "undercurl" } },
      NvimTreeNormal = { bg = colors.none },
      TelescopeNormal = { bg = colors.base },
      TelescopeBorder = { bg = colors.base },
      TelescopeResultsBorder = { bg = colors.base },
      TelescopePromptBorder = { bg = colors.base },
      -- Normal = { bg = "NONE", fg = "NONE" }
    }
  end
}
-- require("bufferline").setup {
--   highlights = require("catppuccin.groups.integrations.bufferline").get()
-- }
