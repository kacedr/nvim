return {
    {
        "github/copilot.vim",
        lazy = false,
    },
    { "tpope/vim-sleuth" },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end,
    },
    -- CodeCompanion (the chat interface that uses Copilot)
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "github/copilot.vim",
        },
        config = function()
            require("codecompanion").setup({
                strategies = {
                    chat = {
                        adapter = "copilot",
                    },
                    inline = {
                        adapter = "copilot",
                    },
                    agent = {
                        adapter = "copilot",
                    },
                },
                opts = {
                    log_level = "DEBUG", -- Enable debug logging
                },
            })
        end,
        cmd = {
            "CodeCompanion",
            "CodeCompanionChat",
            "CodeCompanionActions",
            "CodeCompanionToggle",
            "CodeCompanionAdd",
        },
        keys = {
            { "<leader>cc", "<cmd>CodeCompanionChat<cr>",    desc = "CodeCompanion Chat" },
            { "<leader>ca", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
            { "<leader>ct", "<cmd>CodeCompanionToggle<cr>",  desc = "CodeCompanion Toggle" },
            { "<leader>ci", "<cmd>CodeCompanion<cr>",        mode = "v",                    desc = "CodeCompanion Inline" },
        },
    },
    -- Your other plugins...
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup({})
        end,
    },
    {
        "airblade/vim-gitgutter",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    insert = "<C-g>s",
                    insert_line = "<C-g>S",
                    normal = "ys",
                    normal_cur = "yss",
                    normal_line = "yS",
                    normal_cur_line = "ySS",
                    visual = "<leader>S",
                    visual_line = "<leader>SS",
                    delete = "ds",
                    change = "cs",
                    change_line = "cS",
                },
            })
        end,
    },
    {
        "Wansmer/treesj",
        keys = { "<space>m", "<space>j", "<space>s" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesj").setup({})
        end,
    },
    {
        "amitds1997/remote-nvim.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("remote-nvim").setup({})
        end,
    },
    {
        "rmagatti/auto-session",
        lazy = false,
        config = function()
            require("auto-session").setup({
                suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
                -- log_level = 'debug',
            })
        end,
    },
    {
        "ggandor/leap.nvim",
        event = "VeryLazy",
        config = function()
            require("leap").create_default_mappings()
        end,
    },
    {
        "echasnovski/mini.ai",
        version = false,
        event = "VeryLazy",
        config = function()
            require("mini.ai").setup({})
        end,
    },
    {
        "echasnovski/mini.icons",
        version = false,
        config = function()
            require("mini.icons").setup()
        end,
    },
    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.10.0") == 1,
        config = function()
            require("ts-comments").setup({})
        end,
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
            require("zen-mode").setup({
                window = {
                    backdrop = 0.95,
                    width = 120,
                    height = 1,
                    options = {
                        signcolumn = "no",
                        number = false,
                        relativenumber = false,
                        cursorline = false,
                        cursorcolumn = false,
                        foldcolumn = "0",
                        list = false,
                    },
                },
                plugins = {
                    options = {
                        enabled = true,
                        ruler = false,
                        showcmd = false,
                        laststatus = 0,
                    },
                    twilight = { enabled = true },
                    gitsigns = { enabled = false },
                    tmux = { enabled = false },
                },
            })
        end,
    },
}
