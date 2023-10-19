local M = {}
local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
  return
end

local opts = {
  results_title = false,
  -- bottom_pane layout causing weird bug; jumps to random location in other buffer
  -- layout_strategy = "bottom_pane",
  sorting_strategy = "ascending",
  symbol_width = 50,
  layout_config = {
    height = 0.65,
    -- width = 0.75,
    prompt_position = "bottom",
    -- preview_cutoff = 120,
    horizontal = { mirror = false },
    vertical = { mirror = false },
  },
  -- border = true,
  -- borderchars = {
  --   prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  --   results = { "─", "│", "─", "│", "╭", "╮", "┤", "├" },
  --   preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  -- }
}

M.workspace_symbols = function()
  builtin.lsp_workspace_symbols(opts)
end


M.document_symbols = function()
  builtin.lsp_document_symbols(opts)
end

M.diagnostics = function()
  builtin.diagnostics(opts)
end
return M
