local M = {}
local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
  return
end

local opts = {
  -- I found that we can filter out the kind of document symbols
  -- these are the highlevel things I want to grep for
  symbols = {
    "function",
    "class",
    "method",
    "interface",
    "variable",
    "constructor",
    "struct",
    "property", -- does this even work?
    "constant",
    "object",
    -- "field", -- field and property are 2 different things; field is on a struct, property is on a class
  },
  -- results_title = true,
  -- prompt_title = false,
  -- bottom_pane layout causing weird bug; jumps to random location in other buffer
  -- layout_strategy = "bottom_pane",
  sorting_strategy = "ascending",
  symbol_width = 30,
  layout_config = {
    -- height = 0.35,
    -- width = 0.75,
    prompt_position = "bottom",
    -- preview_cutoff = 120,
    horizontal = { mirror = false },
    vertical = { mirror = false },
  },
  border = true,
  borderchars = {
    prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
    results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  },
  show_line = true,
}

local function append_bufnr(opts)
  -- always get the latest bufnr
  opts.bufnr = vim.api.nvim_win_get_buf(0)
  return opts
end

local function add_field_symbols(opts)
  if vim.o.filetype == "lua" then
    table.insert(opts.symbols, "field")
    table.insert(opts.symbols, "array")
  elseif vim.o.filetype == "html" then
    table.insert(opts.symbols, "field")
  end
  return opts
end

M.workspace_symbols = function()
  -- always get the latest bufnr
  local opts = add_field_symbols(opts)
  builtin.lsp_workspace_symbols(append_bufnr(opts))
end


M.document_symbols = function()
  -- always get the latest bufnr
  local opts = add_field_symbols(opts)
  builtin.lsp_document_symbols(append_bufnr(opts))
end

M.diagnostics = function()
  -- always get the latest bufnr
  builtin.diagnostics(append_bufnr(opts))
end
return M
