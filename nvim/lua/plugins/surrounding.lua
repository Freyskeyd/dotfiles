return {
    -- Surrounding helpers
    { "kylechui/nvim-surround", config = function() require("nvim-surround").setup() end },
    { 'numToStr/Comment.nvim',  config = function() require('Comment').setup() end },
}
