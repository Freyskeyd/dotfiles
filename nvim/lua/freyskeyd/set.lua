local opt = vim.opt

opt.clipboard = 'unnamedplus'

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.hlsearch = false
opt.incsearch = true

opt.list = true
opt.listchars:append "eol:⤶"

opt.clipboard = 'unnamedplus'

opt.cmdheight = 0

local hooks = require("ibl.hooks")

hooks.register(
	hooks.type.WHITESPACE,
	hooks.builtin.hide_first_space_indent_level
)
