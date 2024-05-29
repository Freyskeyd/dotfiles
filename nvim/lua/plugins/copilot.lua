return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = false,
                    debounce = 75,
                    keymap = {
                        accept = "<C-/>",
                        accept_word = false,
                        accept_line = false,
                        prev = "<C-,>",
                        next = "<C-.>",
                        dismiss = false,
                    },
                },
            })
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "zbirenbaum/copilot.lua" },
        event = "InsertEnter",
        config = function()
            require("copilot_cmp").setup()
        end
    },

}
