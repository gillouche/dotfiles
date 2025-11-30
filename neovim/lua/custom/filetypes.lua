-- Treat .tpl files as Helm templates
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.tpl",
    callback = function()
        vim.bo.filetype = "helm"
    end,
})

