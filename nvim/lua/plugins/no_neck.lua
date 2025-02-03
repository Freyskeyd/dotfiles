return {
    {
        "shortcuts/no-neck-pain.nvim",
        version = "*",
        dependencies = { 'MeanderingProgrammer/render-markdown.nvim' },
        config = function()
            require("no-neck-pain").setup({
                autocmds = {
                    enableOnVimEnter = true,
                    enableOnTabEnter = false,
                    reloadOnColorSchemeChange = false,
                },
                buffers = {
                    setNames = true,
                    colors = {
                        blend = -0.2,
                    },
                    scratchPad = {
                        enabled = true,
                        pathToFile = "./scratch.md"
                    },
                    bo = {
                        filetype = 'markdown',
                    },
                    wo = {
                        fillchars = 'eob: ',
                    },
                    right = {
                        enabled = false,
                    },
                },
                integrations = {
                },
            })
        end
    }
}
