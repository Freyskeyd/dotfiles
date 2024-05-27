vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colors
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            {
                'linrongbin16/lsp-progress.nvim',
                config = function()
                    require('lsp-progress').setup()
                end,
            },
        },
        config = function()
            require('lualine').setup {
                options = {
                    theme = "onenord",
                    globalstatus = false,
                },

                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diagnostics' },
                    lualine_c = {
                        function()
                            require('lsp-progress').progress()
                        end
                    },
                    lualine_x = { 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                }
            }

            vim.api.nvim_create_augroup('lualine_augroup', { clear = true })
            vim.api.nvim_create_autocmd('User', {
                group = 'lualine_augroup',
                pattern = 'LspProgressStatusUpdated',
                callback = require('lualine').refresh,
            })
        end
    },

    {
        'VonHeikemen/fine-cmdline.nvim',
        dependencies = {
            { 'MunifTanjim/nui.nvim' }
        },
        config = function()
            require('fine-cmdline').setup({
                cmdline = {
                    enable_keymaps = true,
                    smart_history = true,
                    prompt = ':'
                },
                popup = {
                    position = {
                        row = '100%',
                        col = '0%',
                    },
                    size = {
                        width = '100%',
                    },
                    border = {
                        style = 'none',
                    },
                    win_options = {
                        winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
                    },
                },
                hooks = {
                    before_mount = function(input)
                        -- code
                    end,
                    after_mount = function(input)
                        -- code
                    end,
                    set_keymaps = function(imap, feedkeys)
                        -- code
                    end
                }
            })
        end
    },
    'tpope/vim-sleuth',
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            local options = {
                exclude = {
                    filetypes = {
                        "help",
                        "terminal",
                        "packer",
                        "lspinfo",
                        "TelescopePrompt",
                        "TelescopeResults",
                        "mason",
                        "",
                    },
                    buftypes = { "terminal" },
                },
            }

            require("ibl").setup(options)
        end
    },
    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/nvim-cmp' },
            { 'L3MON4D3/LuaSnip' },

            {
                'j-hui/fidget.nvim',
                event = 'VeryLazy',
            },
        },
        config = function()
            local lsp = require('lsp-zero').preset({})

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
                lsp.buffer_autoformat()
            end)

            require('mason').setup()
            local servers = { 'lua_ls' }

            require('mason-lspconfig').setup {
                ensure_installed = servers,
                handlers = {
                    lsp.default_setup

                }
            }

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            -- for _, lsp in ipairs(servers) do {
            --	require('lspconfig')[lsp].setup {
            --		on_attach = on_attach,
            --		capabilities = capabilities
            --	}
            -- }
        end,
    },

    -- UI
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

    -- TreeSitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { 'lua' },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,

    },
}, {})
