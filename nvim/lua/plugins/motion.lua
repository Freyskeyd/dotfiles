return {
    -- Neovim motions on speed!
    { 'ggandor/leap.nvim',      config = function() require('leap').add_default_mappings() end },
    {
        'ggandor/flit.nvim',
        config = function()
            require('flit').setup {
                keys = { f = 'f', F = 'F', t = 't', T = 'T' },
                -- A string like "nv", "nvo", "o", etc.
                labeled_modes = "nvo",
                multiline = true,
                -- Like `leap`s similar argument (call-specific overrides).
                -- E.g.: opts = { equivalence_classes = {} }
                opts = {}
            }
        end
    },
}
