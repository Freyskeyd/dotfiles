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
			-- 	require('lspconfig')[lsp].setup {
			-- 		on_attach = on_attach,
			-- 		capabilities = capabilities
			-- 	}
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
