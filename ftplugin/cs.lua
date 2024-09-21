local opts = {}
-- local config = require("lspconfig.configs")
-- re-use common lsp configurations (keybindings, buffer-highlight and cmp integration)
opts.handlers = {
  ["textDocument/definition"] = require('csharpls_extended').handler,
  ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
}
opts.cmd = { "csharp-ls"}
require('lvim.lsp.manager').setup("csharp_ls", opts)
