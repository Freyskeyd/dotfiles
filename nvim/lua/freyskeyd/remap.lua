local function termcodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.g.mapleader = ","

vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")
vim.keymap.set("v", ":", ":")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- Insert
-- go to  beginning and end
vim.keymap.set("i", "<C-b>", "<ESC>^i")
vim.keymap.set("i", "<C-e>", "<End>")

-- navigate within insert mode
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "jj", "<Esc>")

-- Normal

-- Escape
vim.keymap.set("n", "<ESC>", "<cmd> noh <CR>")
vim.keymap.set("n", "<C-c>", "<Esc>")

-- switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
vim.keymap.set("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
vim.keymap.set("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
vim.keymap.set("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
vim.keymap.set("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- new buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>")


-- Visual
vim.keymap.set("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
vim.keymap.set("v", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "<leader><leader", "<Esc>")

-- Visual Block
vim.keymap.set("v", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
vim.keymap.set("v", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
vim.keymap.set("v", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })

-- Terminal
vim.keymap.set("t", "<C-x>", termcodes "<C-\\><C-N>")
vim.keymap.set("t", "jk", termcodes "<C-\\><C-N>")
vim.keymap.set("t", "jj", termcodes "<C-\\><C-N>")
