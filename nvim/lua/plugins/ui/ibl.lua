return {
    config = function()
        local options = {
            exclude = {
                filetypes = {
                    "help",
                    "terminal",
                    "packer",
                    "lspinfo",
                    "TelescopePrompt",
                    "TelescopeResults",
                    "mason",
                    "",
                },
                buftypes = { "terminal" },
            },
        }

        require("ibl").setup(options)

        local hooks = require("ibl.hooks")

        hooks.register(
            hooks.type.WHITESPACE,
            hooks.builtin.hide_first_space_indent_level
        )
    end
}
