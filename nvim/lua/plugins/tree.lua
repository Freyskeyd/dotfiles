return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local function my_on_attach(bufnr)
                local api = require "nvim-tree.api"

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- custom mappings
                vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
                vim.keymap.set('n', '<C-t>', api.tree.toggle, opts('Toggle tree'))
            end


            -- pass to setup along with your other options
            require("nvim-tree").setup {
                view = {
                    float = {
                        enable = true
                    }
                },
                git = {
                    enable = true,
                },
                renderer = {
                    icons = {
                        show = {
                            git = false
                        }
                    }
                },

                on_attach = my_on_attach,
            }

            local api = require "nvim-tree.api"
            vim.keymap.set('n', '<C-t>', function() api.tree.toggle({ find_file = true, focus = true }) end,
                { remap = true, silent = true })
        end,
    },
}
