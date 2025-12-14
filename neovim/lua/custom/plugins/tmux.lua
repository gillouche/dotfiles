return {
    {
        "christoomey/vim-tmux-navigator",
        config = function()
            vim.g.tmux_navigator_no_mappings = 1
            vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<CR>', { noremap = true, silent = true })
            vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<CR>', { noremap = true, silent = true })
            vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<CR>', { noremap = true, silent = true })
            vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<CR>', { noremap = true, silent = true })
            vim.keymap.set('t', '<C-h>', '<C-\\><C-n>:TmuxNavigateLeft<CR>', { noremap = true, silent = true })
            vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:TmuxNavigateDown<CR>', { noremap = true, silent = true })
            vim.keymap.set('t', '<C-k>', '<C-\\><C-n>:TmuxNavigateUp<CR>', { noremap = true, silent = true })
            vim.keymap.set('t', '<C-l>', '<C-\\><C-n>:TmuxNavigateRight<CR>', { noremap = true, silent = true })
        end,
    },
}
