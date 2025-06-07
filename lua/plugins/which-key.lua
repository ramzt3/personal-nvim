return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        delay = 0,
        icons = {
            mappings = vim.g.have_nerd_font,
        },
        spec = {
            { "<leader>f", group = "[f]ind" },
            { "<leader>e", group = "mini" },
            { "<leader>p", group = "todo toggle" },
            { "<leader>t", group = "tabs" },
            { "<leader>w", group = "sessions" },
            { "<leader>x", group = "trouble diagnostics" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
