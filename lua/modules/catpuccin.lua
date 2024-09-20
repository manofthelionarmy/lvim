require("catppuccin").setup {
  flavour = "frappe", -- latte, frappe, macchiato, mocha
  transparent_background = false,
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
    lsp_trouble = true,
    -- ts_rainbow2 = true,
    rainbow_delimiters = true,
    leap = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
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
      PmenuSel = { bg = colors.surface1, fg = colors.surface1},
      Pmenu = { bg = colors.surface0 },
      Search = { fg = colors.maroon },
      PmenuExtra = { fg = colors.mauve},
      CmpItemAbbrMatch = { fg = colors.maroon},


      TelescopeMatching = { fg = colors.flamingo },
      TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

      TelescopePromptPrefix = { bg = colors.surface0, fg = colors.red },
      TelescopePromptNormal = { bg = colors.surface0 },
      TelescopeResultsNormal = { bg = colors.mantle },
      TelescopePreviewNormal = { bg = colors.mantle },
      TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
      TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
      TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
      TelescopePromptTitle = { fg = colors.mantle },
      TelescopeResultsTitle = { fg = colors.mantle },
      TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
    }
  end,
  no_underline = true, -- Force no underline
}
-- require("bufferline").setup {
--   highlights = require("catppuccin.groups.integrations.bufferline").get()
-- }
