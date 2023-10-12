lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
    -- disable hover in favor of pyright
    client.server_capabilities.hoverProvider = false
end

lspconfig.ruff_lsp.setup {
    on_attach = on_attach,
}
