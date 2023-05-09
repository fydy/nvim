-- Additional Plugins
lvim.plugins = {
    "stevearc/dressing.nvim",
    "AckslD/swenv.nvim",
    "lunarvim/onedarker.nvim",
    "LunarVim/synthwave84.nvim",
    "roobert/tailwindcss-colorizer-cmp.nvim",
    "lunarvim/github.nvim",
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "mfussenegger/nvim-jdtls",
    "opalmay/vim-smoothie",
    "j-hui/fidget.nvim",
    "christianchiarulli/nvim-ts-autotag",
    "kylechui/nvim-surround",
    "christianchiarulli/harpoon",
    "MattesGroeger/vim-bookmarks",
    "NvChad/nvim-colorizer.lua",
    "ghillb/cybu.nvim",
    "moll/vim-bbye",
    "folke/todo-comments.nvim",
    "windwp/nvim-spectre",
    "f-person/git-blame.nvim",
    "ruifm/gitlinker.nvim",
    "mattn/vim-gist",
    "mattn/webapi-vim",
    "folke/zen-mode.nvim",
    "lvimuser/lsp-inlayhints.nvim",
    "lunarvim/darkplus.nvim",
    "lunarvim/templeos.nvim",
    "kevinhwang91/nvim-bqf",
    "is0n/jaq-nvim",
    -- "hrsh7th/cmp-emoji",
    "ggandor/leap.nvim",
    "nacro90/numb.nvim",
    "TimUntersberger/neogit",
    "sindrets/diffview.nvim",
    "simrat39/rust-tools.nvim",
    "olexsmir/gopher.nvim",
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
    "jose-elias-alvarez/typescript.nvim",
    "mxsdev/nvim-dap-vscode-js",
    "petertriho/nvim-scrollbar",
    "renerocksai/telekasten.nvim",
    -- 自动补全括号
    -- Autopair
    { -- override nvim-autopairs plugin
        "windwp/nvim-autopairs",
        config = function(plugin, opts)
            -- run default AstroNvim config
            require "plugin.configs.nvim-autopairs"(plugin, opts)
            -- require Rule function
            local Rule = require "nvim-autopairs.rule"
            local npairs = require "nvim-autopairs"
            npairs.add_rules {
                {
                    -- specify a list of rules to add
                    Rule(" ", " "):with_pair(function(options)
                        local pair = options.line:sub(options.col - 1, options.col)
                        return vim.tbl_contains({ "()", "[]", "{}" }, pair)
                    end),
                    Rule("( ", " )")
                            :with_pair(function()
                        return false
                    end)
                            :with_move(function(options)
                        return options.prev_char:match ".%)" ~= nil
                    end)
                            :use_key ")",
                    Rule("{ ", " }")
                            :with_pair(function()
                        return false
                    end)
                            :with_move(function(options)
                        return options.prev_char:match ".%}" ~= nil
                    end)
                            :use_key "}",
                    Rule("[ ", " ]")
                            :with_pair(function()
                        return false
                    end)
                            :with_move(function(options)
                        return options.prev_char:match ".%]" ~= nil
                    end)
                            :use_key "]",
                },
            }
        end,
    },
    -- Autocomplete
    {
        'hrsh7th/nvim-cmp',
        -- load cmp on InsertEnter
        event = 'InsertEnter',
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
        },
    },
    --"akinsho/toggleterm.nvim",

    -- "renerocksai/calendar-vim",
    {
        "saecki/crates.nvim",
        version = "v0.3.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup {
                null_ls = {
                    enabled = true,
                    name = "crates.nvim",
                },
            }
        end,
    },
    { "lunarvim/colorschemes", lazy = true, },
    {
        "stevearc/dressing.nvim",
        -- lazy = true,
        config = function()
            require("dressing").setup({
                input = { enabled = false },
            })
        end,
    },
    "MunifTanjim/nui.nvim",
    --"jackMort/ChatGPT.nvim",
    {
        "jinh0/eyeliner.nvim",
        config = function()
            require("eyeliner").setup {
                highlight_on_key = true,
            }
        end,
    },
    { "christianchiarulli/telescope-tabs", branch = "chris" },
    "monaqa/dial.nvim",
    --{
    --  "0x100101/lab.nvim",
    --  build = "cd js && npm ci",
    --},
    --{
    --  "zbirenbaum/copilot.lua",
    --  -- cmd = "Copilot",
    --  event = "InsertEnter",
    --},
    --{
    --  "zbirenbaum/copilot-cmp",
    --  after = { "copilot.lua" },
    --  config = function()
    --    require("copilot_cmp").setup()
    --  end,
    --},
    --{
    --  "tzachar/cmp-tabnine",
    --  event = "InsertEnter",
    --  build = "./install.sh",
    --},

    "MunifTanjim/nui.nvim",
    "Bryley/neoai.nvim",
    "mfussenegger/nvim-dap-python",
    {
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup()
        end,
    },

    --"nvim-neotest/neotest",
    --"nvim-neotest/neotest-python",
    -- {
    --   "folke/noice.nvim",
    --   event = "VimEnter",
    --   config = function()
    --     require("noice").setup()
    --   end,
    -- },

    -- https://github.com/jose-elias-alvarez/typescript.nvim
    -- "rmagatti/auto-session",
    -- "rmagatti/session-lens"
    -- "christianchiarulli/nvim-ts-rainbow",
    -- "karb94/neoscroll.nvim",
}
