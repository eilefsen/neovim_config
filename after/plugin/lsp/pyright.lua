lspconfig = require('lspconfig')

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
