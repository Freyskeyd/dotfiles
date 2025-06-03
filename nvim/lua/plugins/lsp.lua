return {
    -- LSP

    {
        'dhruvasagar/vim-table-mode',
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            { "barreiroleo/ltex-extra.nvim" },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/nvim-cmp' },
            { 'L3MON4D3/LuaSnip' },

            -- 'hood/popui.nvim',
            {
                'j-hui/fidget.nvim',
                event = 'VeryLazy',
            },
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                lsp_zero.buffer_autoformat()

                local opts = { buffer = bufnr }
                vim.keymap.set("n", "<leader>ra", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("n", "gdt", "<cmd>vsp | lua vim.lsp.buf.definition()<CR>", opts)
            end)
            local filetypes =
                require('mason').setup({})
            require('mason-lspconfig').setup({
                -- Replace the language servers listed here
                -- with the ones you want to install
                ensure_installed = { 'lua_ls', 'rust_analyzer', 'taplo' },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,

                    -- this is the "custom handler" for `rust_analyzer`
                    -- noop is an empty function that doesn't do anything
                    rust_analyzer = lsp_zero.noop,
                },
            })

            require("lspconfig").ltex.setup {
                capabilities = lsp_zero.get_capabilities(),
                on_attach = function(client, bufnr)
                    -- rest of your on_attach process.
                    require("ltex_extra").setup {
                        init_check = true,
                        path = vim.fn.expand("$XDG_CONFIG_HOME/ltex/")
                    }
                end,
                cmd = { "/opt/homebrew/bin/ltex-ls" },
                filetypes = {
                    "gitcommit",
                    "markdown",
                    "rust",
                    "lua",
                },
                autostart = false,
                settings = {
                    ltex = {
                        enabled = {
                            "gitcommit",
                            "markdown",
                            "rust",
                            "lua",
                        },
                        checkFrequency = 'save',
                        additionalRules = { enablePickyRules = true },
                        ['ltex-ls'] = {
                            path = "/opt/homebrew/bin/ltex-ls",
                        },
                    },
                },
            }

            lsp_zero.format_on_save({
                format_opts = {
                    async = false,
                    timeout_ms = 10000,
                },
                servers = {
                    ['rust_analyzer'] = { 'rust' },
                }
            })
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
        },
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
    },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
    },
    {
        "chrisgrieser/nvim-lsp-endhints",
        event = "LspAttach",
        opts = {}, -- required, even if empty
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^4",
        dependencies = {
            'mfussenegger/nvim-dap',
            "nvim-lua/plenary.nvim",
            'VonHeikemen/lsp-zero.nvim',
        },
        ft = { "rust" },
        config = function()
            local lsp_zero = require('lsp-zero')
            local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb"

            local cfg = require("rustaceanvim.config")
            vim.g.rustaceanvim = {
                -- DAP configuration
                dap = {
                    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
                },
                tools = {
                    float_win_config = {
                        border = 'rounded'
                    },
                    hover_actions = {
                        auto_focus = true,
                    },
                    reload_workspace_from_cargo_toml = true,
                },
                server = {
                    capabilities = lsp_zero.get_capabilities(),
                    default_settings = {
                        -- rust-analyzer language server configuration
                        ["rust-analyzer"] = {
                            rustfmt = {
                                extraArgs = { "+nightly" },
                            },
                        },
                    },
                }
            }

            local bufnr = vim.api.nvim_get_current_buf()

            vim.keymap.set(
                "n",
                "K",
                function()
                    vim.cmd.RustLsp { 'hover', 'actions' }
                end,
                { silent = true, buffer = bufnr }
            )
            for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
                local default_diagnostic_handler = vim.lsp.handlers[method]
                vim.lsp.handlers[method] = function(err, result, context, config)
                    if err ~= nil and err.code == -32802 then
                        return
                    end
                    return default_diagnostic_handler(err, result, context, config)
                end
            end
            --
            -- vim.keymap.set(
            --     "n",
            --     "<leader>a",
            --     function()
            --         vim.cmd.RustLsp('codeAction')
            --     end,
            --     { silent = true, buffer = bufnr }
            -- )
        end,
        keys = {
            { "<leader>rc", "<cmd>RustLsp openCargo<cr>",   desc = "Open Cargo" },
            { "<leader>rs", "<cmd>LspStart<cr>",            desc = "LspStart" },
            { "<leader>rR", "<cmd>LspRestart<cr>",          desc = "LspRestart" },
            { "<leader>rS", "<cmd>LspStop<cr>",             desc = "LspStop" },
            { "<leader>rr", "<cmd>RustLsp runnables<cr>",   desc = "Rust runables" },
            { "<leader>rt", "<cmd>RustLsp testables<cr>",   desc = "Rust tests" },
            { "<leader>rd", "<cmd>RustLsp debuggables<cr>", desc = "Rust debuggables" },
            { "<leader>a",  "<cmd>RustLsp codeAction<cr>",  desc = "Rust code actions" },
        },
    }
}
