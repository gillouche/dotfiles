return {

    -- SchemaStore provides access to many JSON/YAML schemas (including Kubernetes CRDs)
    {
        "b0o/SchemaStore.nvim",
    },

    -- YAML language server
    {
        "neovim/nvim-lspconfig",
        dependencies = { "b0o/SchemaStore.nvim" },
        config = function()
            local schemastore = require("schemastore")

            -- Use the new recommended setup
            require("lspconfig").yamlls.setup({
                settings = {
                    yaml = {
                        schemas = schemastore.yaml.schemas(),
                        validate = true,
                        format = { enable = true },
                        hover = true,
                        completion = true,
                        customTags = {
                            "!Base64", "!Cidr", "!And", "!Equals", "!Not", "!Or",
                            "!If", "!Not", "!FindInMap", "!Ref", "!Sub",
                        },
                    },
                },
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
}
