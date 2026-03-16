local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end

return {
    {
        'catppuccin/nvim',
        priority = 1000,
        config = function()
            require('catppuccin').setup {
                flavour = 'macchiato',
            }
            vim.cmd('hi Directory guibg=NONE')
            vim.cmd('hi SignColumn guibg=NONE')
            vim.cmd.colorscheme 'catppuccin-macchiato'
            enable_transparency()
        end,
    },
    -- {
    --     "Mofiqul/vscode.nvim",
    --     name = 'vscode',
    --     config = function()
    --         vim.cmd.colorscheme "vscode"
    --         vim.cmd('hi Directory guibg=NONE')
    --         vim.cmd('hi SignColumn guibg=NONE')
    --         enable_transparency()
    --     end
    -- }
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         vim.cmd("colorscheme tokyonight-moon")
    --     end
    -- },
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         vim.cmd("colorscheme rose-pine")
    --     end
    -- },
}
