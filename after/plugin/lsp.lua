require("neodev").setup({})

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
local mason = require('mason')
local mason_config = require('mason-lspconfig')
mason.setup()
mason_config.setup({
    ensure_installed = {
        'lua_ls',
        'pyright',
    }
})

-- Extend default capabilities
lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)
-- Automatically setup LSP servers from mason
mason_config.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({})
    end,
})
-- individually configure lua_ls
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace",
            },
            diagnostics = {
                -- Fix undefined global 'vim'
                globals = {'vim',}
            },
            workspace = {
					checkThirdParty = false,
            },
        }
    }
})
-- configure pyright
lspconfig.pyright.setup({
    settings = {
        python = {
            analysis = {
                diagnosticMode = "workspace",
                diagnosticSeverityOverrides = {
                    reportGeneralTypeIssues = "warning",
                    reportImplicitOverride = "warning",
                    reportImplicitStringConcatenation = "information",
                    reportImportCycles = "information",
                    reportIncompatibleMethodOverride = "warning",
                    reportIncompatibleVariableOverride = "warning",
                    reportMissingParameterType = "information",
                    reportMissingTypeStubs = "information",
                    reportOverlappingOverload = "warning",
                    reportUnnecessaryComparison = "information",
                    reportUnnecessaryContains = "information",
                    reportUnnecessaryTypeIgnoreComment = "information",
                    reportUnusedFunction = "warning",

                },
            },
        },
        pyright = {
        },
    },
})

-- Mappings
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = {buffer = true}
            vim.keymap.set(mode, lhs, rhs, opts)
        end
        -- hover info under cursor
        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        -- jump to definition
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        -- jump to declaration
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        -- jump to type definition
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        -- list all implementations
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        -- lists all references 
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        -- displays function signature info
        bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
        -- renames all references to word under cursor
        bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
        -- selects code action available at cursor position
        bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
        -- shows diagnostic in floating window
        bufmap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<cr>')
        -- go to previous diagnostic
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        -- go to next diagnostic
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    end,
})

