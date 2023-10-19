local M = {}
local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
  return
end

local opts = {
  results_title = false,
  -- bottom_pane layout causing weird bug; jumps to random location in other buffer
  layout_strategy = "bottom_pane",
  sorting_strategy = "ascending",
  symbol_width = 30,
  layout_config = {
    height = 0.45,
    -- width = 0.75,
    prompt_position = "bottom",
    -- preview_cutoff = 120,
    horizontal = { mirror = false },
    vertical = { mirror = false },
  },
  border = false,
  -- borderchars = {
  --   prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  --   results = { "─", "│", "─", "│", "╭", "╮", "┤", "├" },
  --   preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  -- },
  show_line = true
}

M.workspace_symbols = function()
  -- always get the latest bufnr
  opts.bufnr = vim.api.nvim_win_get_buf(0)
  builtin.lsp_workspace_symbols(opts)
end


M.document_symbols = function()
  -- always get the latest bufnr
  opts.bufnr = vim.api.nvim_win_get_buf(0)
  builtin.lsp_document_symbols(opts)
end

M.diagnostics = function()
  -- always get the latest bufnr
  opts.bufnr = vim.api.nvim_win_get_buf(0)
  builtin.diagnostics(opts)
end
return M
