return require("lazy").setup({

    -- SchemaStore provides access to many JSON/YAML schemas (including Kubernetes CRDs)
    {
        "b0o/SchemaStore.nvim",
    },

    -- YAML language server
    {
        "neovim/nvim-lspconfig",
        dependencies = { "b0o/SchemaStore.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            local schemastore = require("schemastore")

            lspconfig.yamlls.setup({
                settings = {
                    yaml = {
                        -- Use SchemaStore for Kubernetes & CRDs
                        schemas = schemastore.yaml.schemas(),
                        validate = true,          -- enable validation
                        format = { enable = true }, -- formatting
                        hover = true,             -- documentation on hover
                        completion = true,        -- autocompletion
                        -- Helm templates support
                        customTags = {
                            "!Base64", "!Cidr", "!And", "!Equals", "!Not", "!Or",
                            "!If", "!Not", "!FindInMap", "!Ref", "!Sub",
                        },
                    },
                },
                -- Treat Helm templates (.tpl) as YAML for LSP
                filetypes = { "yaml", "helm" },
            })
        end,
    },

    -- autoformat yaml on save
    {
        "stevearc/conform.nvim",
        opts = function(_, opts)
            opts.formatters_by_ft = opts.formatters_by_ft or {}
            opts.formatters_by_ft.yaml = { "prettierd" }
        end,
    },
})