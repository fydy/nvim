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
lvim.builtin.which_key.mappings["y"] = { "<cmd>w !python<CR>", "执行当前python文件" }
lvim.builtin.which_key.mappings["t"] = {
    name = "Trouble",
    t = { "<cmd>w !node<CR>", "执行js文件" },
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
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
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.rainbow.enable = true
-- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
    "jsonls",
    "pyright",
    "jedi_language_server",
    "tsserver",
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
    { command = "isort", filetypes = { "python" } },
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
        lazy = true,
        config = function()
            require("dressing").setup({
                input = { enabled = false },
            })
        end,
    },
    {
        "nvim-neorg/neorg",
        lazy = true,
        ft = "norg", -- lazy-load on filetype
        config = true, -- run require("neorg").setup()
    },
    -- neovim motions on speed!

    {
        "phaazon/hop.nvim",
        lazy = true,
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
        end,
    },

    -- lightspeed
    -- jetpack codebase navigation
    -- For a more lightweight, easier-to-use alternative, check out the author's new, work-in-progress plugin, leap.nvim. Example config below.

    {
        "ggandor/lightspeed.nvim",
        lazy = true,
        event = "BufRead",
    },

    -- leap
    -- Neovim's answer to the mouse

    {
        "ggandor/leap.nvim",
        lazy = true,
        name = "leap",
        config = function()
            require("leap").add_default_mappings()
        end,
    },

    -- numb
    -- jump to the line

    {
        "nacro90/numb.nvim",
        lazy = true,
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            }
        end,
    },

    -- nvim-bqf
    -- better quickfix window

    {
        "kevinhwang91/nvim-bqf",
        lazy = true,
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

    -- nvim-spectre
    -- search and replace

    {
        "windwp/nvim-spectre",
        lazy = true,
        event = "BufRead",
        config = function()
            require("spectre").setup()
        end,
    },

    -- neo-tree
    -- neo-tree is a plugin to manage the file system and other tree like structures

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        lazy = true,
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

    -- After installing ensure to disable nvim-tree it in your config.lua using:
    -- ...
    -- lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree
    -- ...

    -- rnvimr
    -- ranger file explorer window

    {
        "kevinhwang91/rnvimr",
        lazy = true,
        cmd = "RnvimrToggle",
        config = function()
            vim.g.rnvimr_draw_border = 1
            vim.g.rnvimr_pick_enable = 1
            vim.g.rnvimr_bw_enable = 1
        end,
    },

    -- vim-matchup
    -- navigate and highlight matching words

    {
        "andymass/vim-matchup",
        lazy = true,
        event = "CursorMoved",
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    },

    -- enable treesitter integration
    -- lvim.builtin.treesitter.matchup.enable = true

    -- git-blame
    -- show git blame

    {
        "f-person/git-blame.nvim",
        lazy = true,
        event = "BufRead",
        config = function()
            vim.cmd "highlight default link gitblame SpecialComment"
            vim.g.gitblame_enabled = 0
        end,
    },

    -- gitlinker
    -- generate shareable file permalinks for several git web frontend hosts

    {
        "ruifm/gitlinker.nvim",
        event = "BufRead",
        config = function()
            require("gitlinker").setup {
                opts = {
                    -- remote = 'github', -- force the use of a specific remote
                    -- adds current line nr in the url for normal mode
                    add_current_line_on_normal_mode = true,
                    -- callback for what to do with the url
                    action_callback = require("gitlinker.actions").open_in_browser,
                    -- print the url after performing the action
                    print_url = false,
                    -- mapping to call url generation
                    mappings = "<leader>gy",
                },
            }
        end,
        lazy = true,
    },

    -- octo
    -- edit and review GitHub issues and pull requests

    {
        "pwntester/octo.nvim",
        lazy = true,
        config = function()
            require("octo").setup()
        end,
    },

    -- vim-fugitive
    -- git wrapper

    {
        "tpope/vim-fugitive",
        lazy = true,
        cmd = {
            "G",
            "Git",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "GRemove",
            "GRename",
            "Glgrep",
            "Gedit"
        },
        ft = { "fugitive" }
    },

    -- vim-gist
    -- create/edit Github gists

    {
        "mattn/vim-gist",
        event = "BufRead",

    },

    -- Treesitter
    -- nvim-ts-autotag
    -- autoclose and autorename html tag

    {
        "windwp/nvim-ts-autotag",

        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },

    -- nvim-ts-context-commentstring
    -- commentstring option based on the cursor location

    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "BufRead",

    },

    -- nvim-ts-rainbow
    -- rainbow parentheses

    {
        "mrjones2014/nvim-ts-rainbow",
        lazy = true,
    },

    -- After installing ensure to enable it in your config.lua using:

    -- ...
    -- lvim.builtin.treesitter.rainbow.enable = true
    -- ...

    -- playground
    -- view treesitter information

    {
        "nvim-treesitter/playground",
        event = "BufRead",
        lazy = true,
    },

    -- nvim-treesitter-context
    -- Show current function at the top of the screen when function does not fit in screen

    {
        "romgrk/nvim-treesitter-context",
        lazy = true,
        config = function()
            require("treesitter-context").setup {
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                throttle = true, -- Throttles plugin updates (may improve performance)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        'class',
                        'function',
                        'method',
                    },
                },
            }
        end
    },

    -- Colorschemes
    -- lsp-colors
    -- lsp diagnostics highlight groups for non lsp colorschemes

    {
        "folke/lsp-colors.nvim",
        event = "BufRead",
        lazy = true,
    },

    -- lush.nvim
    -- colorscheme creation aid

    {
        "rktjmp/lush.nvim",
        lazy = true,
    },

    -- nvim-colorizer
    -- color highlighter

    {
        "norcalli/nvim-colorizer.lua",
        lazy = true,
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

    -- LSP Enhancement
    -- cmp-tabnine
    -- TabNine completion engine for hrsh7th/nvim-cmp

    {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        event = "InsertEnter",
        lazy = true,
    },

    -- goto-preview
    -- previewing goto definition calls

    {
        "rmagatti/goto-preview",
        lazy = true,
        config = function()
            require('goto-preview').setup {
                width = 120; -- Width of the floating window
                height = 25; -- Height of the floating window
                default_mappings = false; -- Bind default mappings
                debug = false; -- Print debug information
                opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
                post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
                -- You can use "default_mappings = true" setup option
                -- Or explicitly set keybindings
                -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
                -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
                -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
            }
        end
    },


    -- lsp-rooter
    -- cwd to the project's root directory

    {
        "ahmedkhalf/lsp-rooter.nvim",
        lazy = true,
        event = "BufRead",
        config = function()
            require("lsp-rooter").setup()
        end,
    },

    -- lsp_signature.nvim
    -- hint when you type

    {
        "ray-x/lsp_signature.nvim",
        lazy = true,
        event = "BufRead",
        config = function()
            require "lsp_signature".on_attach()
        end,
    },

    -- symbols-outline.nvim
    -- a tree like view for symbols

    {
        "simrat39/symbols-outline.nvim",
        lazy = true,
        config = function()
            require('symbols-outline').setup()
        end
    },

    -- trouble.nvim
    -- diagnostics, references, telescope results, quickfix and location lists

    {
        "folke/trouble.nvim",
        lazy = true,
        cmd = "TroubleToggle",
    },

    -- Also define keybindings in config.lua

    -- lvim.builtin.which_key.mappings["t"] = {
    --   name = "Diagnostics",
    --   t = { "<cmd>TroubleToggle<cr>", "trouble" },
    --   w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    --   d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    --   q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    --   l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    --   r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
    -- },
    { "folke/which-key.nvim", lazy = true },

    {
        "nvim-neorg/neorg",
        -- lazy-load on filetype
        ft = "norg",
        -- options for neorg. This will automatically call `require("neorg").setup(opts)`
        opts = {
            load = {
                ["core.defaults"] = {},
            },
        },
    },

    {
        "dstein64/vim-startuptime",
        -- lazy-load on a command
        cmd = "StartupTime",
        -- init is called during startup. Configuration for vim plugins typically should be set in an init function
        init = function()
            vim.g.startuptime_tries = 10
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "InsertEnter",
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
        },
        config = function()
            -- ...
        end,
    },

    -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
    -- So for api plugins like devicons, we can always set lazy=true
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- you can use the VeryLazy event for things that can
    -- load later and are not important for the initial UI
    { "stevearc/dressing.nvim", event = "VeryLazy" },

    {
        "Wansmer/treesj",
        keys = {
            { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
        },
        opts = { use_default_keymaps = false, max_join_length = 150 },
    },

    {
        "monaqa/dial.nvim",
        -- lazy-load on keys
        -- mode is `n` by default. For more advanced options, check the section on key mappings
        keys = { "<C-a>", { "<C-x>", mode = "n" } },
    },

    -- local plugins need to be explicitly configured with dir
    { dir = "~/projects/secret.nvim" },
    
    -- local plugins can also be configure with the dev option.
    -- This will use {config.dev.path}/noice.nvim/ instead of fetching it from Github
    -- With the dev option, you can easily switch between the local and installed version of a plugin
    { "folke/noice.nvim", dev = true },
    -- General
    -- auto-save
    -- automatically saving your work whenever you make changes to it

    {
        "Pocco81/auto-save.nvim",
        lazy = true,
        config = function()
            require("auto-save").setup()
        end,
    },

    -- codi.vim
    -- interactive scratchpad for hackers

    {
        "metakirby5/codi.vim",
        lazy = true,
        cmd = "Codi",
    },
    -- glow.nvim
    -- preview markdown in neovim

    -- You must install glow globally
    -- https://github.com/charmbracelet/glow
    -- yay -S glow
    {
        "npxbr/glow.nvim",
        lazy = true,
        ft = { "markdown" }
        -- build = "yay -S glow"
    },

    -- markdown-preview.nvim
    -- preview markdown in the browser

    {
        "iamcco/markdown-preview.nvim",
        lazy = true,
        build = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 1
        end,
    },

    -- neoscroll
    -- smooth scrolling

    {
        "karb94/neoscroll.nvim",
        lazy = true,
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


    -- neuron
    -- next generation note-taking

    { "oberblastmeister/neuron.nvim", lazy = true, },

    -- nvim-lastplace
    -- pick up where you left off

    {
        "ethanholz/nvim-lastplace",
        lazy = true,
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

    -- persistence
    -- simple session management

    {
        "folke/persistence.nvim",
        lazy = true,
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
       -- module = "persistence",
        config = function()
            require("persistence").setup {
                dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
                options = { "buffers", "curdir", "tabpages", "winsize" },
            }
        end,
    },

    -- Also define keybindings in your config.lua

    --   lvim.builtin.which_key.mappings["S"]= {
    --     name = "Session",
    --     c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    --     l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    --     Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
    --   }

    -- todo-comments.nvim
    -- highlight and search for todo comments

    {
        "folke/todo-comments.nvim",
        lazy = true,
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },

    -- vim-cursorword
    -- underlines the word under the cursor

    {
        "itchyny/vim-cursorword",
        lazy = true,
        event = { "BufEnter", "BufNewFile" },
        config = function()
            vim.api.nvim_command("augroup user_plugin_cursorword")
            vim.api.nvim_command("autocmd!")
            vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
            vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
            vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
            vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
            vim.api.nvim_command("augroup END")
        end
    },


    -- vim-repeat
    -- enable repeating supported plugin maps with "."

    { "tpope/vim-repeat", lazy = true, },

    -- vim-sanegx
    -- open url with gx

    {
        "felipec/vim-sanegx",
        lazy = true,
        event = "BufRead",
    },

    -- vim-surround
    -- mappings to delete, change and add surroundings

    {
        "tpope/vim-surround",
        lazy = true,

        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },


    -- vim-wakatime
    -- metrics, insights, and time tracking automatically generated from your programming activity

    {
        "wakatime/vim-wakatime", lazy = true,
    },

    -- Once installed and synced, add your WakaTime API Key via :WakaTimeApiKey command

    -- Language specific

    -- vim-bundler
    -- lightweight support for ruby's bundler

    {
        "tpope/vim-bundler",
        lazy = true,
        cmd = { "Bundler", "Bopen", "Bsplit", "Btabedit" }
    },

    -- vim-rails
    -- edit ruby on rails applications

    {
        "tpope/vim-rails",
        lazy = true,
        cmd = {
            "Eview",
            "Econtroller",
            "Emodel",
            "Smodel",
            "Sview",
            "Scontroller",
            "Vmodel",
            "Vview",
            "Vcontroller",
            "Tmodel",
            "Tview",
            "Tcontroller",
            "Rails",
            "Generate",
            "Runner",
            "Extract"
        }
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
