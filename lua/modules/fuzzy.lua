local M = {}
local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
  return
end


M.document_symbols = function()
  local opts = {}
  opts.sorting_strategy = "ascending"
  opts.layout_config = {
    -- width = 0.75,
    prompt_position = "top",
    -- preview_cutoff = 120,
    horizontal = { mirror = false },
    vertical = { mirror = false },
  }
  builtin.lsp_document_symbols(opts)
end

M.diagnostics = function()
  local opts = {}
  opts.sorting_strategy = "ascending"
  opts.layout_config = {
    -- width = 0.75,
    prompt_position = "top",
    -- preview_cutoff = 120,
    horizontal = { mirror = false },
    vertical = { mirror = false },
  }
  builtin.diagnostics(opts)
end
return M
