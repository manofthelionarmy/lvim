local dracula = require("dracula")
local colors = dracula.colors()
local frappe = require("catppuccin.palettes").get_palette "frappe"
dracula.setup({
  theme = 'dracula-soft',
  overrides = {
    -- CursorLineNr = { style = {"bold"} },
    Comment = { fg = colors.comment, bold = true },

    CursorLine = { bg = colors.visual },
    ALEWarningSign = {fg = colors.yellow},
    AleWarningLine = {fg = colors.orange},
    AleVirtualTextWarning = {fg = colors.orange},
    -- TODO: figure out which color this is
    -- TelescopeResultsBorder = { bg = colors.base },
    -- TelescopePromptBorder = { bg = colors.base },
    -- Normal = {bg="NONE", fg="NONE"},
    Normal = { bg = frappe.base },
    SignColumn = { bg = frappe.base },

    NvimTreeNormal = { bg = frappe.base },
    NvimTreeWinSeparator = { fg = colors.selection },
    NvimTreeCursorLine = {bg = colors.selection},
    ALEVirtualTextError = {fg=colors.red, bg=frappe.base},
    ALEVirtualTextInfo = {fg='#94e2d5', bg=colors.bg},
    ALEInfoSign = {fg='#94e2d5'},


    Pmenu = { bg = colors.nontext },
    PmenuSel = { bg = colors.selection, bold = true},
    PmenuSbar = { bg = colors.bg, },
    PmenuThumb = { bg = colors.white },

    CmpItemAbbrMatch = { fg = colors.bright_green},
    CmpItemAbbr = { fg = colors.fg},
    -- CmpItemKind = { fg = colors.comment},
    CmpItemMenu = { fg = colors.comment},
    CmpItemAbbrDeprecated = { bg = 'NONE', strikethrough = true },
    CmpItemKindOperator = { fg = colors.yellow },
    CmpItemKindVariable = { fg = colors.bright_blue },


    CompeDocumentation = { bg = colors.nontext },
    -- Document
    NormalFloat = { bg = colors.menu },


    --CocPumShortcut = { fg = colors.purple },
    --PmenuSel = { bg = colors.surface1 },
    -- CocSymbolOperator = { fg = colors.yellow },
    --CocSymbolModule = { fg = colors.mauve },
    --CocSymbolDefault = { fg = colors.green },
    --CocSymbolSnippet = { fg = colors.green },

    -- Telescope
    TelescopeNormal = { bg = colors.menu },
    TelescopeBorder = { bg = colors.menu },
    TelescopeMatching = { fg = colors.bright_green },
    TelescopeSelection = { fg = colors.white, bg = colors.nontext, bold = true },
    TelescopeSelectionCaret = { fg = colors.bright_red},

    -- Telescope Prompt
    TelescopePromptPrefix = { bg = colors.nontext, fg = colors.purple },
    TelescopePromptNormal = { bg = colors.nontext },
    TelescopePromptBorder = { bg = colors.nontext, fg = colors.nontext },
    TelescopePromptTitle = { fg = colors.white },

    -- Telescope Results
    TelescopeResultsNormal = { bg = colors.menu },
    TelescopeResultsBorder = { bg = colors.menu, fg = colors.menu },
    TelescopeResultsTitle = { fg = colors.menu },

    -- Telescope Preview
    TelescopePreviewNormal = { bg = colors.menu },
    TelescopePreviewBorder = { bg = colors.menu, fg = colors.menu },
    TelescopePreviewTitle = { bg = colors.green, fg = colors.menu },
  }
})
