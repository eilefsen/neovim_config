local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
	'rust_analyzer',
    'lua_ls',
    'marksman',
    'html',
    'jsonls',
    'cssls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})

-- mapping
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<Tab>'] = cmp.mapping.confirm(),
})
-- setup completion
lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn  = 'W',
		hint  = 'H',
		info  = 'I'
	}
})

lsp.on_attach(function(client, bufnr)
    -- helper function for setting keymaps
    lsp.default_keymaps({buffer = bufnr})
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = true, desc = desc })
    end
    -- lsp keymaps
    nmap('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
    nmap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')

    -- format

end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})
