return {

    -- TreeSitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { 'lua', 'toml' },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,

    },

    {
        'Freyskeyd/nvim-treesitter-context',
        dependencies = { "nvim-treesitter" },
        config = function()
            require('treesitter-context').setup({
                multiline_threshold = 1,
            })
        end
    },

    -- autoclose tags in html, jsx only
    {
        'windwp/nvim-ts-autotag',
        ft = { "html", "javascriptreact" },
        dependencies = { "nvim-treesitter" },
        config = function()
            local present, autotag = pcall(require, "nvim-ts-autotag")

            if present then
                autotag.setup()
            end
        end,
    },

    { 'windwp/nvim-autopairs' },

    {
        'm4xshen/autoclose.nvim',
        config = function()
            require("autoclose").setup({})
        end
    },
}
