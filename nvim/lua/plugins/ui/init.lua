local lualine = require("plugins.ui.lualine")
local ibl = require("plugins.ui.ibl")

return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            {
                'linrongbin16/lsp-progress.nvim',
                config = function()
                    require('lsp-progress').setup()
                end
            }
        },
        config = lualine.config
    },

    'tpope/vim-sleuth',

    {
        'lukas-reineke/indent-blankline.nvim',
        config = ibl.config
    },

    {
        'rmehri01/onenord.nvim',
        config = function()
            local colors = require("onenord.colors").load()

            require("onenord").setup({
                custom_highlights = {
                    Include = { fg = colors.blue },
                },
            })
        end
    },
    {
        'hood/popui.nvim',
        dependencies = {
            'rmehri01/onenord.nvim',
        },
        config = function()
            vim.ui.select = require "popui.ui-overrider"
            vim.ui.input = require "popui.input-overrider"
            vim.g.popui_border_style = "rounded"
            vim.g.popui_border_style = "double"
            vim.api.nvim_set_keymap("n", ",d", ':lua require"popui.diagnostics-navigator"()<CR>',
                { noremap = true, silent = true })
        end
    },

    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                background_colour = "#000000",
            })
        end,
    },
}
