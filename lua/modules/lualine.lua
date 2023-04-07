local M = {}

local hide_width = function()
  return vim.fn.winwidth(0) >= 50
end

local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  purple = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local filetype = {
  "filetype",
  cond = hide_width,
  padding = { left = 1, right = 1 }
}

local fileformat = {
  'fileformat',
  color = { fg = "#008080" },
  padding = { left = 1, right = 1 },
  fmt = function()
    return ''
  end,
  cond = hide_width
}

local mode = {
  'mode', fmt = function(s) return s:sub(1, 1) end, color = { gui = 'bold' }
}

local treesitter = {
  function()
    if next(vim.treesitter.highlighter.active) then
      return "  "
    end
    return ""
  end,
  padding = { left = 1, right = 0 },
  color = { fg = colors.green },
  cond = hide_width
}

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  cond = hide_width
}

vim.cmd [[
  augroup MyGitBranchHiglights
    autocmd!
    autocmd ColorScheme * hi GitBranchIcon guifg=#e8ab53 guibg=#292e42
    \ | hi GitBranchName guifg=#c0caf5 guibg=#292e42
  augroup END
]]

-- The only thing I don't like about this is I have to create this hi light grourp
local branch_icon = "%#GitBranchIcon#" .. '' .. "%*" .. "%#GitBranchName#"
local branch = {
  'branch',
  icon = branch_icon,
  color = { gui = "bold" },
}

local diff = {
  'diff',
  source = 'gitsigns',
  symbols = { added = " ", modified = "柳", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  color = {},
  cond = nil,
}

local progress = {
  'progress',
  fmt = function(str)
    if str == 'Top' or str == 'Bot' then
      return str
    end
    -- it's 3 because lualine prepends percents with %%. This get's resolved in master of lua
    if str:len() == 3 then
      return ' ' .. str
    end
    return str
  end,
  cond = hide_width,
}

local scrollbar = {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  cond = hide_width,
  padding = { left = 1, right = 1 },
  color = { fg = "#ECBE7B", bg = "#202328" }
}

M.configure = function()
  local sections = {}
  -- local scrollbar = components.scrollbar
  -- scrollbar.padding = { left = 1, right = 1 }
  -- scrollbar.color = { fg = "#ECBE7B", bg = "#202328" }
  sections.lualine_a = { mode }
  sections.lualine_b = { branch }
  sections.lualine_c = { diff }
  sections.lualine_x = { diagnostics, treesitter, fileformat, filetype }
  sections.lualine_y = { progress }
  sections.lualine_z = { scrollbar }
  return sections
end

return M
