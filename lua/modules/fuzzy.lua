local M = {}
local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
  return
end


M.document_symbols = function()
  -- local builtin = require('telescope.builtin')
  -- local themes = require('telescope.themes')
  -- builtin.find_files(themes.get_ivy())
  local opts = {}
  opts.layout_strategy = "bottom_pane"
  opts.sorting_strategy = "ascending"
  opts.layout_config = {
    height = 0.50,
    -- width = 0.75,
    prompt_position = "bottom",
    -- preview_cutoff = 120,
    horizontal = { mirror = false },
    vertical = { mirror = false },
  }
  opts.prompt_title = ""
  -- builtin.lsp_document_symbols(themes.get_cursor())
  builtin.lsp_document_symbols(opts)
end

M.diagnostics = function()
  local opts = {}
  opts.prompt_title = ""
  opts.layout_strategy = "bottom_pane"
  opts.sorting_strategy = "ascending"
  opts.layout_config = {
    height = 0.50,
    -- width = 0.75,
    prompt_position = "bottom",
    -- preview_cutoff = 120,
    horizontal = { mirror = false },
    vertical = { mirror = false },
  }
  builtin.diagnostics(opts)
end
return M
