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
}, {})
