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
    require("lazy").setup({
        {
            'tzachar/cmp-tabnine',
            build = './install.sh',
            dependencies = 'hrsh7th/nvim-cmp',
        } }),

    require('lazy').setup({
        { 'nvim-lua/plenary.nvim', lazy = true },
        { 'b0o/schemastore.nvim', lazy = true },
        { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
        { 'nvim-tree/nvim-web-devicons', lazy = true },
        {
            'itsuki0927/base46',
            config = function()
                local ok, base46 = pcall(require, 'base46')
                if ok then
                    base46.load_theme()
                end
            end,
        },

        {
            'NvChad/nvim-colorizer.lua',
            event = { 'CursorHold' },
            config = function()
                require('plugin-configs.colorizer')
            end,
        },

        {
            'nvim-treesitter/nvim-treesitter-textobjects',
            event = 'BufRead',
        },
        {
            'nvim-treesitter/nvim-treesitter',
            event = 'CursorHold',
            build = ':TSUpdate',
            config = function()
                require('plugin-configs.treesitter')
            end,
        },

        {
            'akinsho/bufferline.nvim',
            event = { 'BufNewFile', 'BufRead', 'TabEnter' },
            config = function()
                require('plugin-configs.bufferline')
            end,
            init = function()
                require('core.mappings').bufferline()
            end,
        },

        {
            'goolord/alpha-nvim',
            event = 'VimEnter',
            config = function()
                require('plugin-configs.alpha')
            end,
        },

        {
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
            config = function()
                require('plugin-configs.gitsigns')
            end,
        },

        {
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufRead',
            config = function()
                require('plugin-configs.blankline')
            end,
        },

        {
            'folke/todo-comments.nvim',
            event = 'BufRead',
            lazy = true,
            config = function()
                require('plugin-configs.todo_comments')
            end,
            init = function()
                require('core.mappings').todo_comments()
            end,
        },

        ------------------------------ UI ----------------------------------

        ------------------------------ 功能组件 ----------------------------------

        -- 目录树
        {
            'kyazdani42/nvim-tree.lua',
            cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
            config = function()
                require('plugin-configs.nvimtree')
            end,
            init = function()
                require('core.mappings').nvimtree()
            end,
        },

        -- lsp
        {
            'neovim/nvim-lspconfig',
            config = function()
                require('core.lsp')
            end,
        },

        -- 片段
        {
            'L3MON4D3/LuaSnip',
            event = 'InsertEnter',
            config = function()
                require('plugin-configs.luasnip')
            end,
        },

        -- 自动完成
        {
            'hrsh7th/nvim-cmp',
            event = 'VeryLazy',
            config = function()
                require('plugin-configs.cmp')
            end,
            dependencies = {
                'saadparwaiz1/cmp_luasnip',
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-nvim-lua',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-cmdline',
            },
        },

        -- 自动补全括号
        {
            'windwp/nvim-autopairs',
            event = 'InsertEnter',
            dependencies = 'hrsh7th/nvim-cmp',
            config = function()
                require('plugin-configs.autopairs')
            end,
        },

        -- 自动关闭标签
        {
            'windwp/nvim-ts-autotag',
            event = 'InsertEnter',
            dependencies = 'hrsh7th/nvim-cmp',
            opts = {
                filetypes = { 'javascriptreact', 'typescriptreact', 'html', 'vue', 'tsx', 'jsx' },
            },
        },

        -- 格式化
        {
            'mhartington/formatter.nvim',
            event = 'BufWrite',
            config = function()
                require('plugin-configs.formatter')
            end,
        },

        -- 注释
        {
            'numToStr/Comment.nvim',
            event = 'VeryLazy',
            dependencies = {
                'JoosepAlviste/nvim-ts-context-commentstring',
            },
            config = function()
                require('plugin-configs.comment')
            end,
            init = function()
                require('core.mappings').comment()
            end,
        },

        -- {
        --   'zbirenbaum/copilot.lua',
        --   cmd = 'Copilot',
        --   event = 'VimEnter',
        --   config = function()
        --     vim.defer_fn(function()
        --       require('copilot').setup()
        --     end, 100)
        --   end,
        --   opts = {
        --     suggestion = { enabled = false },
        --     panel = { enabled = false },
        --   },
        -- },
        --
        -- {
        --   'zbirenbaum/copilot-cmp',
        --   dependencies = 'zbirenbaum/copilot.lua',
        --   config = function()
        --     require('copilot_cmp').setup()
        --   end,
        -- },

        -- 输入提示函数参数
        {
            'ray-x/lsp_signature.nvim',
            event = 'VeryLazy',
            config = true,
            opts = {
                bind = true,
                doc_lines = 0,
                floating_window = true,
                fix_pos = true,
                hint_enable = true,
                hint_prefix = ' ',
                hint_scheme = 'String',
                hi_parameter = 'Search',
                max_height = 22,
                max_width = 120,
                handler_opts = {
                    border = 'single',
                },
                zindex = 200,
                padding = '',
            },
        },

        -- 几个文件之间快速跳转
        {
            'ThePrimeagen/harpoon',
            event = 'VeryLazy',
            config = function()
                require('plugin-configs.harpoon')
            end,
            init = function()
                require('core.mappings').harpoon()
            end,
        },

        -- 模糊搜索
        {
            'nvim-telescope/telescope.nvim',
            cmd = 'Telescope',
            config = function()
                require('plugin-configs.telescope')
            end,
            init = function()
                require('core.mappings').telescope()
            end,
        },

        --
        {
            'kylechui/nvim-surround',
            event = 'VeryLazy',
            config = true,
        },

        -- Markdown 预览
        {
            'iamcco/markdown-preview.nvim',
            ft = 'markdown',
            keys = {
                {
                    '<leader>mp',
                    ':MarkdownPreview <CR>',
                },
                {
                    '<leader>ms',
                    ':MarkdownPreviewStop <CR>',
                },
            },
            build = ':call mkdp#util#install()',
        },

        -- 快速跳转
        {
            'phaazon/hop.nvim',
            keys = {
                {
                    'f',
                    function()
                        require('hop').hint_char1({
                            direction = require('hop.hint').HintDirection.AFTER_CURSOR,
                            current_line_only = true,
                        })
                    end,
                },
                {
                    'F',
                    function()
                        require('hop').hint_char1({
                            direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
                            current_line_only = true,
                        })
                    end,
                },
                {
                    't',
                    function()
                        require('hop').hint_char1({
                            direction = require('hop.hint').HintDirection.AFTER_CURSOR,
                            current_line_only = true,
                            hint_offset = -1,
                        })
                    end,
                },
                {
                    'T',
                    function()
                        require('hop').hint_char1({
                            direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
                            current_line_only = true,
                            hint_offset = 1,
                        })
                    end,
                },
            },
            init = function()
                require('core.mappings').hop()
            end,
            config = function()
                require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
            end,
        },

        -- 多光标
        {
            'mg979/vim-visual-multi',
            event = 'VeryLazy',
        },

        -- 浮窗
        {
            'voldikss/vim-floaterm',
            cmd = { 'FloatermNew', 'FloatermToggle' },
            config = function()
                require('plugin-configs.floaterm')
            end,
            init = function()
                require('core.mappings').floaterm()
            end,
        },

        { -- Improve folding
            'kevinhwang91/nvim-ufo',
            event = 'VeryLazy',
            dependencies = { 'kevinhwang91/promise-async' },
            init = function()
                require('core.mappings').ufo()
            end,
            config = function()
                require('plugin-configs.ufo')
            end,
        },

        -- 不错的替换功能
        -- {
        --   'cshuaimin/ssr.nvim',
        --   keys = {
        --     {
        --       '<leader>sr',
        --       function()
        --         require('ssr').open()
        --       end,
        --       mode = { 'n', 'x' },
        --       desc = 'Structural Replace',
        --     },
        --   },
        --   opts = {
        --     border = 'single',
        --   },
        -- },

        --  ['simrat39/symbols-outline.nvim'] = {
        --    cmd = {
        --      'SymbolsOutline',
        --      'SymbolsOutlineOpen',
        --      'SymbolsOutlineClose',
        --    },
        --    config = function()
        --      require('symbols-outline').setup()
        --    end,
        --  },

        -- Git Diff
        -- {
        --   'sindrets/diffview.nvim',
        --   keys = {
        --     { '<leader>dv', ':DiffviewOpen<CR>' },
        --     { '<leader>dc', ':DiffviewClose<CR>' },
        --     { '<leader>dq', ':DiffviewClose<CR>:q<CR>' },
        --   },
        --   cmd = { 'DiffviewOpen', 'DiffviewClose' },
        -- },

        ------------------------------ 功能组件 ----------------------------------
    }, config)
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
