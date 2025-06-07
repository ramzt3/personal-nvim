return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },
    },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,                       -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,                           -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
                    },
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[f]ind [f]iles" })
        vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "[g]it [f]iles" })
        vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[o]ld [f]iles" })
        vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "[q]uick [f]ix" })
        vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[f]ind [s]elect' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[f]ind [K]eymaps' })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[f]ind [h]elp tags" })
        vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "buffers <leader><leader>" })

        -- Rip grep + Fzf
        vim.keymap.set("n", "<leader>sw", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        -- Slightly advanced example of overriding default behavior and theme
        vim.keymap.set("n", "<leader>/", function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "[/] Fuzzily search in current buffer" })

        vim.keymap.set("n", "<leader>sn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[S]earch [N]eovim files" })

        -- Find instance instance of current view being included
        vim.keymap.set("n", "<leader>sc", function()
            local filename_without_extension = vim.fn.expand("%:t:r")
            builtin.grep_string({ search = filename_without_extension })
        end, { desc = "Find current file: " })

        -- Grep current string (for when gd doesn't work)
        vim.keymap.set("n", "<leader>ss", function()
            builtin.grep_string({})
        end, { desc = "Find current string: " })

    end,
}
