return {
    {
        'folke/todo-comments.nvim',
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        cmd = { "TodoLocList", "TodoQuickFix", "TodoTelescope", "TodoTrouble" },
        config = function()
            require("todo-comments").setup {}
        end
    },
    {
        'folke/todo-comments.nvim',
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        cmd = { "TodoLocList", "TodoQuickFix", "TodoTelescope", "TodoTrouble" },
        config = function()
            require("todo-comments").setup {}
        end
    },
}
