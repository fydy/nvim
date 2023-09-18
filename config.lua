--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.js", "*.lua", "*.py" }
lvim.colorscheme = "lunaperche"
lvim.transparent_window = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
local dap = require('dap')
-- DAP Python
dap.adapters.python = {
    type = 'executable';
    command = '/data/data/com.termux/files/usr/bin/python';
    --args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
            return '/data/data/com.termux/files/usr/bin/python'
        end;
    },
}

-- lvim.builtin.which_key.mappings["y"] = { "<cmd>w !python<CR>", "执行当前python文件" }
lvim.builtin.which_key.mappings["y"] = { "<cmd>:RunFile<CR>", "执行当前文件" }
lvim.builtin.which_key.mappings["t"] = {
    name = "Diagnostics",
    j = { "<cmd>w !node<CR>", "执行js文件" },
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

lvim.builtin.which_key.mappings["S"] = {
    name = "Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
lvim.keys.normal_mode['<C-v>'] = ':w !python'
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
-- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
-- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"
lvim.builtin.lualine.options.theme = "gruvbox"
local custom_gruvbox = require "lualine.themes.gruvbox_dark"
custom_gruvbox.insert.b = { fg = custom_gruvbox.insert.a.bg, gui = "bold" }
custom_gruvbox.visual.b = { fg = custom_gruvbox.visual.a.bg, gui = "bold" }
custom_gruvbox.replace.b = { fg = custom_gruvbox.replace.a.bg, gui = "bold" }
custom_gruvbox.command.b = { fg = custom_gruvbox.command.a.bg, gui = "bold" }

lvim.builtin.lualine.options.theme = custom_gruvbox
lvim.builtin.lualine.style = "default" -- or "none"
-- lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.sections.lualine_c = { "diff" }
-- no need to set style = "lvim"
local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_y = {
    components.spaces,
    components.location
}




-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings
lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree
--lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.auto_install = false

lvim.builtin.treesitter.ignore_install = { "markdown" }

lvim.builtin.treesitter.textobjects = {
    select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["at"] = "@class.outer",
            ["it"] = "@class.inner",
            ["ac"] = "@call.outer",
            ["ic"] = "@call.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["a/"] = "@comment.outer",
            ["i/"] = "@comment.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["as"] = "@statement.outer",
            ["is"] = "@scopename.inner",
            ["aA"] = "@attribute.outer",
            ["iA"] = "@attribute.inner",
            ["aF"] = "@frame.outer",
            ["iF"] = "@frame.inner",
        },
    },
}

-- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
    "jsonls",
    "pyright",
--    "jedi_language_server",
    "tsserver",
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        }
    }
}
-- change UI setting of `LspInstallInfo`
-- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
-- uninstall_server = "d",
--    toggle_server_expand = "o",
-- }

-- @usage disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false

-- configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
local opts = {} -- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("pyright", opts)

-- remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- `:LvimInfo` lists which server(s) are skipped for the current filetype
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
    return server ~= "emmet_ls"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", filetypes = { "python" } },
    --{ command = "isort", filetypes = { "python" } },
    {
        -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "prettier",
        -- @usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--print-with", "100" },
        -- @usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "typescript", "typescriptreact" },
    },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "flake8", filetypes = { "python" } },
    {
        -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "shellcheck",
        -- @usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--severity", "warning" },
    },
    {
        command = "codespell",
        -- @usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "javascript", "python" },
    },
}

lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "frecency")
    pcall(telescope.load_extension, "neoclip")
    -- any other extensions loading
end
-- Additional Plugins
lvim.plugins = {
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
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                window = {
                    width = 30,
                },
                buffers = {
                    follow_current_file = true,
                },
                filesystem = {
                    follow_current_file = true,
                    filtered_items = {
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_by_name = {
                            "node_modules"
                        },
                        never_show = {
                            ".DS_Store",
                            "thumbs.db"
                        },
                    },
                },
            })
        end
    },
    -- lazy.nvim
    {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    }, 
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
    },
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({})
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',    -- optional
        }
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            })
        end,
    },
    -- lsp
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "^1", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    {
        'nvim-telescope/telescope.nvim', version = '0.1.1',
        -- or                              , branch = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- Indent line
    { 'lukas-reineke/indent-blankline.nvim', lazy = true },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "TroubleToggle",
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    -- Tag viewer
    { 'preservim/tagbar', lazy = true },
    { 'preservim/nerdcommenter', lazy = true },
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
    {
        "mrjones2014/nvim-ts-rainbow",
    },
    -- LSP
    { 'neovim/nvim-lspconfig', lazy = true },

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

    -- 自动补全括号
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        dependencies = 'hrsh7th/nvim-cmp',
        config = function()
            require('nvim-autopairs').setup {}
        end,
    },

    {
        'fagci/runfile.nvim', 
        config = function()
            require('runfile').setup({
                mappings = {
                    ['zsh'] = 'zsh {f} {a}'
                }
            })
        end,
    },
    -- 自动关闭标签
    {
        'windwp/nvim-ts-autotag',
        event = 'InsertEnter',
        dependencies = 'hrsh7th/nvim-cmp',
        opts = {
            filetypes = { 'py', 'javascriptreact', 'typescriptreact', 'html', 'vue', 'tsx', 'jsx' },
        },
    },
    {
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        config = true,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                             '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
                hide_cursor = true, -- Hide cursor while scrolling
                stop_eof = true, -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil, -- Default easing function
                pre_hook = nil, -- Function to run before the scrolling animation starts
                post_hook = nil, -- Function to run after the scrolling animation ends
            })
        end
    },
    {
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = {
                    "gitcommit", "gitrebase", "svn", "hgcommit",
                },
                lastplace_open_folds = true,
            })
        end,
    },
    {
        "kevinhwang91/nvim-bqf",
        event = { "BufRead", "BufNew" },
        config = function()
            require("bqf").setup({
                auto_enable = true,
                preview = {
                    win_height = 12,
                    win_vheight = 12,
                    delay_syntax = 80,
                    border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
                },
                func_map = {
                    vsplit = "",
                    ptogglemode = "z,",
                    stoggleup = "",
                },
                filter = {
                    fzf = {
                        action_for = { ["ctrl-s"] = "split" },
                        extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                    },
                },
            })
        end,
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        lazy = true,
        config = function()
            require("persistence").setup {
                dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
                options = { "buffers", "curdir", "tabpages", "winsize" },
            }
        end,
    },
    {
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup()
        end,
    },

    -- 多光标
    {
        'mg979/vim-visual-multi',
        event = 'VeryLazy',
    },
}
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.json", "*.jsonc" },
    -- enable wrap mode for json files only
    command = "setlocal wrap",
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "zsh",
    callback = function()
        -- let treesitter use bash highlight for zsh files as well
        require("nvim-treesitter.highlight").attach(0, "bash")
    end,
})
-- reload "user.options"
-- reload "user.keymaps"
-- reload "user.plugins"
-- reload "user.colorscheme"
-- reload "user.cmp"
-- reload "user.lsp"
-- reload "user.telescope"
-- reload "user.gitsigns"
-- reload "user.treesitter"
-- reload "user.autopairs"
-- reload "user.comment"
-- reload "user.nvim-tree"
-- reload "user.bufferline"
-- reload "user.lualine"
-- reload "user.toggleterm"
-- reload "user.project"
-- reload "user.impatient"
-- reload "user.indentline"
-- reload "user.alpha"
-- reload "user.whichkey"
-- reload "user.autocommands"
-- reload "user.toggleterm"
-- reload "user.whichkey"
-- reload "user.custom"
