-- general
lvim.log.level = "none"
lvim.format_on_save.enabled = true
-- May have to update this whenever I wan to lint on save
lvim.format_on_save.pattern = { "*.lua", "*.javascript", "*.go", "*.html", "*.gohtml", "*.tmpl" }
lvim.lint_on_save = true
-- lvim.colorscheme = "lunar"
lvim.colorscheme = "catppuccin"
vim.o.relativenumber = true
lvim.transparent_window = true
lvim.reload_config_on_save = false
vim.o.autochdir = true

local cmp = require('cmp')
-- found this on reddit, this really helped me :)
local compare = require('cmp.config.compare')
local comparators = {
  -- compare.score_offset, -- not good at all
  compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
  compare.locality,
  -- NOTE: disable recently_used
  -- compare.recently_used, -- disable this
  compare.offset,
  compare.order,
  -- compare.scopes, -- what?
  -- compare.sort_text,
  -- compare.exact,
  -- compare.kind,
  -- compare.length, -- useless
}
-- Enable preselection
lvim.builtin.cmp.preselect = cmp.PreselectMode.Item
-- lvim.builtin.cmp.confirm_opts.select = true
-- Was trying to autocomplete first preselected item
-- lvim.builtin.cmp.confirm = { select = true, behavior = cmp.ConfirmBehavior.Replace }

-- NOTE: Very important to set this, this ensures we don't sort completion items
-- and that preselect will always highlight first completion item
lvim.builtin.cmp.sorting = { priority_weight = 1.0, comparators = comparators }
-- lvim.builtin.cmp.matching = { disallow_fuzzy_matching = true }

lvim.builtin.alpha.dashboard.section.header.val = require('modules/alpha').alpha_header

-- lvim.reload.enable = false
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "\\"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- NvimTree
lvim.keys.normal_mode["tn"] = ":NvimTreeToggle<CR>"

-- Telescope
-- The reasone this doesn't remap because which key maps it to undo stage hunk
-- reset_hunk is mapped to <leader>gr in which key
-- lvim.keys.normal_mode["<leader>gu"] = ":lua require('gitsigns').reset_hunk()<cr>"
lvim.keys.normal_mode["<space>td"] = ":lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })<CR>"
lvim.keys.normal_mode["<leader>tt"] = ":lua require('telescope.builtin').find_files()<CR>"
lvim.keys.normal_mode["<space>t`"] = ":lua require('telescope.builtin').buffers({initial_mode = 'insert'})<CR>"
-- NOTE: for some odd reason, it doens't jump to document symbol, it jumps to other buffer, is the wrong buffer id being passed intermittently?
lvim.keys.normal_mode["<space>o"] = ":lua require('modules/fuzzy').document_symbols()<CR>"
lvim.keys.normal_mode["<space>O"] = ":lua require('modules/fuzzy').workspace_symbols()<CR>"
lvim.keys.normal_mode["<space>a"] = ":lua require('modules/fuzzy').diagnostics()<CR>"
lvim.keys.normal_mode["<space>A"] = ":Trouble document_diagnostics<CR>"
lvim.keys.normal_mode["<leader>tc"] = ":lua require('modules/searchconfigs').search_configs()<CR>"

lvim.keys.normal_mode["<leader>rn"] = ":lua vim.lsp.buf.rename"

-- Center cursorline
lvim.keys.normal_mode["j"] = "jzz"
lvim.keys.normal_mode["k"] = "kzz"
lvim.keys.normal_mode["G"] = "Gzz"

-- Shift Blocks of Code a la vs code
lvim.keys.visual_block_mode["<S-j>"] = ":m '>+1<CR>gv-gv"
lvim.keys.visual_block_mode["<S-k>"] = ":m '<-2<CR>gv-gv"

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.comment.active = true
lvim.builtin.bufferline.options.always_show_bufferline = true
-- This is mapped to navic
lvim.builtin.breadcrumbs.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.git.ignore = true
lvim.builtin.nvimtree.setup.update_focused_file.ignore_list = { "^\\.git$", "^node_modules$", "^\\.cache$", "vendor",
  "plugin$" }
lvim.builtin.nvimtree.setup.filters.custom = { "node_modules", "^\\.git$", "^\\.cache$", "vendor$", "plugin$" }
lvim.builtin.nvimtree.setup.filters.exclude = { ".gitlab_ci.yaml", ".gitignore", ".gitlab_ci.yml" }
lvim.builtin.nvimtree.setup.diagnostics = {
  enable = true, -- neat, it works with nvim-lsp and coc :)
  icons = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  }
}
lvim.builtin.nvimtree.setup.renderer.indent_markers.enable = true

lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git/", "node_modules/", "vendor/" }
lvim.builtin.telescope.defaults.env = { COLORTERM = "truecolor" }

-- local components = require('lvim.core.lualine.components')
-- components.diagnostics.symbols.error = ''
-- components.diagnostics.symbols.hint = ''
-- components.diagnostics.symbols.info = ''
-- components.diagnostics.symbols.warn = ''


-- loading the components into here
-- maybe better to copy the components from that file and put in my config, in the event they change stuff
lvim.builtin.lualine.sections = require('modules/lualine').configure()

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "go",
  "dockerfile",
  "make",
  "sql",
  "html"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow.enable = true


-- let g:gitgutter_sign_added              = '+'
-- let g:gitgutter_sign_modified           = '~'
-- let g:gitgutter_sign_removed            = '_'
-- let g:gitgutter_sign_removed_first_line = '‾'
-- let g:gitgutter_sign_removed_above_and_below = '_¯'
-- let g:gitgutter_sign_modified_removed   = '~_'
--
-- GitSigns follow gitgutter
lvim.builtin.gitsigns.opts.signs.add.text = "+"
lvim.builtin.gitsigns.opts.signs.change.text = "~"
lvim.builtin.gitsigns.opts.signs.delete.text = "_"
lvim.builtin.gitsigns.opts.signs.changedelete.text = "~_"
lvim.builtin.gitsigns.opts.signs.topdelete.text = "‾"

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "sumneko_lua",
  "jsonls",
  "gopls",
  "dockerls",
  "yamlls",
  "bashls",
  "tsserver",
  "html",
  "cssls",
  "sqls",
  "emmet_ls"
}
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
-- TODO: configure typescript, javascript, html, emmet, css
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "gofmt",     filetypes = { "go" } },
  { command = "goimports", filetypes = { "go" } },
  { command = "black",     filetypes = { "python" } },
  { command = "isort",     filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "revive", filetypes = { "go" } },
  { command = "flake8", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  -- {
  --   command = "codespell",
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "javascript", "python" },
  -- },
}

-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- FIXME: this isn't working, it's becuase gomodify tags is available for later versions of null-ls
-- // it's a pain in the butt to update plugins in lunar vim
-- // a workaround for codeactions for go is to install vim-go
--
-- code_actions.setup {
--   { name = "gomodifytags" },
--   { name = "impl" },
-- }

-- local linters = require "lvim.lsp.null-ls.linters"

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    'christoomey/vim-tmux-navigator',
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup()
    end
  },
  {
    'fatih/vim-go',
    tag = "v1.28",
    filetypes = { 'go', 'gomod' }
  },
  {
    'ray-x/lsp_signature.nvim',
    config = function()
    end
  },
  {
    'catppuccin/nvim',
  }
  -- {
  --   'tpope/vim-sensible'
  -- }
}

-- Load stuff for my plugins
require "lsp_signature".setup(require('modules.signature').cfg)
vim.cmd('source ~/.config/lvim/tmux.vim')
vim.cmd('source ~/.config/lvim/vim-go.vim')
if lvim.colorscheme ~= "catppuccin" then
  vim.cmd('source ~/.config/lvim/tokyonight.vim')
else
  require("modules/catpuccin")
  lvim.builtin.bufferline.highlights = require("catppuccin.groups.integrations.bufferline").get()
end
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "Trouble" },
  -- enable wrap mode for json files only
  command = "nnoremap <silent> <buffer> <Esc> :q<CR>",
})


vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.hbs", "*.jet", "*.gohtml", "*.html" },
  command = ":set ft=html"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qf" },
  -- enable wrap mode for json files only
  command = "nnoremap <silent> <buffer> <Esc> :q<CR>",
})

require('modules/icons')
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
-- Emmet is part of the skipped servers. I have to configure it myself, or remove it from skipped servers list
-- https://www.lunarvim.org/docs/troubleshooting#update-node
-- Make sure to run LvimCacheReset
vim.tbl_map(function(server)
  return server ~= "emmet_ls"
end, lvim.lsp.automatic_configuration.skipped_servers)
