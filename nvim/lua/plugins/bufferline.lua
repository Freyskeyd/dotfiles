return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'rmehri01/onenord.nvim'
        },
        config = function()
            require("bufferline").setup {}

            vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { silent = true })
            vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true })

            vim.keymap.set('n', '<leader>x', function()
                local buffer_id = vim.fn.bufnr()
                vim.cmd 'BufferLineCyclePrev'
                vim.cmd('bdelete ' .. buffer_id)
            end, { desc = 'Close current buffer and go to previous' })
        end
    },
}
