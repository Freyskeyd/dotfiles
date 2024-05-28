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

opt.termguicolors = true
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50
opt.colorcolumn = "80"

opt.clipboard = 'unnamedplus'

-- opt.cmdheight = 0

