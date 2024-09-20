local M = {}
local C = require('dracula').colors()

M.highlights = {
    -- buffers
    background = { nontext = C.nontext },
    buffer_visible = { fg = C.fg, nontext = C.nontext },
    buffer_selected = { fg = C.fg, nontext = C.nontext}, -- current
    -- Duplicate
    duplicate_selected = { fg = C.fg, nontext = C.nontext },
    duplicate_visible = { fg = C.fg, nontext = C.nontext },
    duplicate = { fg = C.fg, nontext = C.nontext },
    -- tabs
    tab = { fg = C.nontext, nontext = C.nontext },
    tab_selected = { fg = C.fg, nontext = C.nontext, bold = true },
    tab_separator = { fg = C.purple, nontext = C.green },
    tab_separator_selected = { fg = C.purple, nontext = C.nontext },

    tab_close = { fg = C.red, nontext = C.nontext },
    indicator_visible = { fg = C.purple, nontext = C.nontext },
    indicator_selected = { fg = C.purple, nontext = C.nontext },
    -- separators
    separator = { fg = C.nontext, nontext = C.nontext },
    separator_visible = { fg = C.purple, nontext = C.purple },
    separator_selected = { fg = C.nontext, nontext = C.nontext },
    offset_separator = { fg = C.green, nontext = C.green },
    -- close buttons
    close_button = { fg = C.fg, nontext = C.nontext },
    close_button_visible = { fg = C.fg, nontext = C.nontext },
    close_button_selected = { fg = C.red, nontext = C.nontext },
    -- Empty fill
    fill = { nontext = C.nontext },
    -- Numbers
    -- numbers = { fg = C.subtext0, nontext = C.nontext },
    -- numbers_visible = { fg = C.subtext0, nontext = C.nontext },
    -- numbers_selected = { fg = C.subtext0, nontext = C.nontext, style = styles },
    -- Errors
    -- error = { fg = C.red, nontext = C.nontext },
    -- error_visible = { fg = C.red, nontext = C.nontext },
    -- error_selected = { fg = C.red, nontext = C.nontext, style = styles },
    -- error_diagnostic = { fg = C.red, nontext = C.nontext },
    -- error_diagnostic_visible = { fg = C.red, nontext = C.nontext },
    -- error_diagnostic_selected = { fg = C.red, nontext = C.nontext },
    -- Warnings
    warning = { fg = C.yellow, nontext = C.nontext },
    warning_visible = { fg = C.yellow, nontext = C.nontext },
    warning_selected = { fg = C.yellow, nontext = C.nontext },
    warning_diagnostic = { fg = C.yellow, nontext = C.nontext },
    warning_diagnostic_visible = { fg = C.yellow, nontext = C.nontext },
    warning_diagnostic_selected = { fg = C.yellow, nontext = C.nontext },
    -- Infos
    info = { fg = C.bright_cyan, nontext = C.nontext },
    info_visible = { fg = C.bright_cyan, nontext = C.nontext },
    info_selected = { fg = C.bright_cyan, nontext = C.nontext },
    info_diagnostic = { fg = C.bright_cyan, nontext = C.nontext },
    info_diagnostic_visible = { fg = C.bright_cyan, nontext = C.nontext },
    info_diagnostic_selected = { fg = C.bright_cyan, nontext = C.nontext },
    -- Hint
    hint = { fg = C.bright_cyan, nontext = C.nontext },
    hint_visible = { fg = C.bright_cyan, nontext = C.nontext },
    hint_selected = { fg = C.bright_cyan, nontext = C.nontext },
    hint_diagnostic = { fg = C.bright_cyan, nontext = C.nontext },
    hint_diagnostic_visible = { fg = C.bright_cyan, nontext = C.nontext },
    hint_diagnostic_selected = { fg = C.bright_cyan, nontext = C.nontext },
    -- Diagnostics
    -- diagnostic = { fg = C.subtext0, nontext = C.nontext },
    -- diagnostic_visible = { fg = C.subtext0, nontext = C.nontext },
    -- diagnostic_selected = { fg = C.subtext0, nontext = C.nontext, style = styles },
    -- Modified
    modified = { fg = C.orange, nontext = C.nontext },
    modified_visible = { fg = C.orange, nontext = C.nontext },
    modified_selected = { fg = C.orange, nontext = C.nontext },
}

return M
