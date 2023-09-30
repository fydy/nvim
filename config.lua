--[[
lvim is the global options object
ii=11
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
lvim.builtin.illuminate.active = false
lvim.builtin.bufferline.active = false
lvim.builtin.terminal.persist_mode = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.breadcrumbs.active = true

vim.opt.showtabline = 0

local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 100,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  laststatus = 3,
  showcmd = false,
  ruler = false,
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4,       -- set number column width to 2 {default 4}
  signcolumn = "yes",    -- always show the sign column, otherwise it would shift the text each time
  wrap = false,          -- display lines as one long line
  scrolloff = 0,
  sidescrolloff = 8,
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  title = true,
  titleold = vim.split(os.getenv("SHELL") or "", "/")[3],
  -- colorcolumn = "80",
  -- colorcolumn = "120",
}
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.opt.fillchars.eob = " "
-- vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
-- vim.opt.fillchars = vim.opt.fillchars + "vertright: "
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append {
  stl = " ",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end


-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
-- setup debug adapter

lvim.builtin.dap.active = true
--local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
--pcall(function()
--    require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
--end)
--
---- setup testing
--require("neotest").setup({
--    adapters = {
--        require("neotest-python")({
--            -- Extra arguments for nvim-dap configuration
--            -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
--            dap = {
--                justMyCode = false,
--                console = "integratedTerminal",
--            },
--            args = { "--log-level", "DEBUG", "--quiet" },
--            runner = "pytest",
--        })
--    }
--})

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
local dap = require('dap')
-- DAP Python
dap.adapters.python = {
  type = 'executable',
  command = '$(which python)',
  --args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return '$(which python)'
    end,
  },
}

-- lvim.builtin.which_key.mappings["y"] = { "<cmd>w !python<CR>", "执行当前python文件" }
-- lvim.builtin.which_key.mappings["y"] = { "<cmd>:RunFile<CR>", "执行当前文件" }
lvim.builtin.which_key.mappings["y"] = { "<cmd>lua run_code()<CR>", "运行文件" }
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
  q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
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

--require('toggleterm').setup {
require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 8
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  highlights = {
    -- highlights which map to a highlight group name and a table of it's values
    -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    Normal = {
      link = 'Normal'
    },
    NormalFloat = {
      link = 'Normal'
    },
    FloatBorder = {
      -- guifg = <VALUE-HERE>,
      -- guibg = <VALUE-HERE>,
      link = 'FloatBorder'
    },
  },
  insert_mappings = true,   -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true,      -- if set to true (default) the previous terminal mode will be remembered
  --size = 15,
  open_mapping = '<F1>',
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved', -- single/double/shadow/curved
    width = math.floor(0.7 * vim.fn.winwidth(0)),
    height = math.floor(0.8 * vim.fn.winheight(0)),
    winblend = 4,
  },

}

local run_command_table = {
  ['asm'] = 'nasm -f elf64 % -o %:r.o && ld %:r.o -o %:r && ./%:r && rm %:r.o',
  ['cpp'] = 'g++ -g -Wall % -o %:r && ./%:r',
  ['c'] = 'gcc -g -Wall % -o %:r && ./%:r',
  ['python'] = 'python %',
  ['lua'] = 'lua %',
  ['java'] = 'cd %:h && javac *.java && java %:t:r',
  ['zsh'] = 'zsh %',
  ['sh'] = 'sh %',
  ['rust'] = 'rustc % && ./%:r',
  ['go'] = 'go run %',
  ['javascript'] = 'node %'
}

local debug_command_table = {
  ['cpp'] = 'g++ -g % -o %:r && gdb ./%:r',
  ['c'] = 'gcc -g % -o %:r && gdb ./%:r',
}

local extra = 'printf \"\\\\n\\\\033[0;33mPlease Press ENTER to continue \\\\033[0m\"; read'
local Terminal = require('toggleterm.terminal').Terminal

function expand_symbol_resolver(cmd)
  local mod = string.byte("%")
  local space = string.byte(" ")
  local col = string.byte(":")
  local i = 1
  local expanded_cmd = ""
  while i <= #cmd do
    if cmd:byte(i) == mod then
      local j = i + 1
      while cmd:byte(j) == col and cmd:byte(j + 1) ~= space and j <= #cmd do
        j = j + 2
      end
      expanded_cmd = expanded_cmd .. vim.fn.expand(string.sub(cmd, i, j - 1))
      i = j
    end
    expanded_cmd = expanded_cmd .. string.sub(cmd, i, i)
    i = i + 1
  end

  return expanded_cmd
end

-- To run file run :Run or just press <F5>
function run_code()
  if (run_command_table[vim.bo.filetype]) then
    local expanded_cmd = expand_symbol_resolver(run_command_table[vim.bo.filetype])
    local runcmd = expanded_cmd .. "; " .. extra
    local runterm = Terminal:new({ cmd = runcmd, direction = "horizontal" })
    runterm:toggle()
  else
    print("\nFileType not supported\n")
  end
end

-- To run file run :Debug
function debug_code()
  if (debug_command_table[vim.bo.filetype]) then
    local expanded_cmd = expand_symbol_resolver(debug_command_table[vim.bo.filetype])
    local runcmd = expanded_cmd .. "; " .. extra
    local debugterm = Terminal:new({ cmd = runcmd, direction = "horizontal" })
    debugterm:toggle()
  else
    print("\nFileType not supported\n")
  end
end

local function strsplit(inputstr)
  local t = {}
  for str in string.gmatch(inputstr, "([^\",\"]+)") do
    table.insert(t, str)
  end
  return t
end


-- Use the following function to update the execution command of a filetype temporarly
-- Usage :RunUpdate  --OR-- :RunUpdate filetype
-- If no argument is provided, the command is going to take the filetype of active buffer
function update_command_table(type, filetype)
  local command

  if (filetype == "") then
    filetype = vim.bo.filetype
  else
    filetype = string.sub(filetype, 2, -2)
  end

  filetype = strsplit(filetype)[1]

  if (type == 'run') then
    if (run_command_table[filetype]) then
      command = vim.fn.input(string.format("Update run command of filetype (%s): ", filetype),
        run_command_table[filetype], 'file')
    else
      command = vim.fn.input(string.format("Add new run command of filetype (%s): ", filetype))
    end
    if (#command ~= 0) then
      run_command_table[filetype] = command
      print("  Updated!")
    end
  end

  if (type == 'debug') then
    if (debug_command_table[filetype]) then
      command = vim.fn.input(string.format("Update debug command of filetype (%s): ", filetype),
        debug_command_table[filetype], 'file')
    else
      command = vim.fn.input(string.format("Add new debug command of filetype (%s): ", filetype))
    end
    if (#command ~= 0) then
      debug_command_table[filetype] = command
      print("  Updated!")
    end
  end
end

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
lvim.builtin.nvimtree.active = true -- NOTE: using neo-tree
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
lvim.builtin.telescope.defaults.mappings.i = {
  ["<esc>"] = require('telescope.actions').close,
}

lvim.builtin.telescope.defaults = {
  mappings = {
    i = {
      ["<esc>"] = require('telescope.actions').close,
    }
  },
  vimgrep_arguments = {
    "rg",
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case",
  },
  prompt_prefix = "   ",
  selection_caret = "  ",
  entry_prefix = "  ",
  initial_mode = "insert",
  selection_strategy = "reset",
  sorting_strategy = "ascending",
  layout_strategy = "horizontal",
  layout_config = {
    horizontal = {
      prompt_position = "top",
      preview_width = 0.7,
      results_width = 0.8,
    },
    vertical = {
      mirror = false,
    },
    width = 0.95,
    height = 0.92,
    preview_cutoff = 120,
  },
  file_sorter = require("telescope.sorters").get_fuzzy_file,
  file_ignore_patterns = { "node_modules" },
  generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
  path_display = { "truncate" },
  winblend = 0,
  border = {},
  borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  color_devicons = true,
  use_less = true,
  set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
  file_previewer = require("telescope.previewers").vim_buffer_cat.new,
  grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
  qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  -- Developer configurations: Not meant for general override
  buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
}
-- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  -- "jsonls",
  "pyright",
  --    "jedi_language_server",
  "tsserver",
  -- "lua-language-server",
}
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "shfmt", filetypes = { "sh", "zsh", "bash" } },
}

vim.filetype.add {
  extension = {
    zsh = "zsh",
  },
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "bashls" })

local lsp_manager = require "lvim.lsp.manager"

lsp_manager.setup("lua_ls", {
  filetypes = { "lua" },
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
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
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
      -- disable until lualine loads
      vim.opt.laststatus = 0
    end,
    opts = function()
      -- miasma colors
      local colors = {
        bg = "#222222",
        black = "#1c1c1c",
        grey = "#666666",
        red = "#685742",
        green = "#5f875f",
        yellow = "#B36D43",
        blue = "#78824B",
        magenta = "#bb7744",
        cyan = "#C9A554",
        white = "#D7C483",
      }

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width_first = function()
          return vim.fn.winwidth(0) > 80
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 70
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }
      -- auto change color according to neovims mode
      local mode_color = {
        n = colors.red,
        i = colors.green,
        v = colors.blue,
        [""] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.yellow,
        Rv = colors.yellow,
        cv = colors.yellow,
        ce = colors.yellow,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.red,
        t = colors.red,
      }
      -- config
      local config = {
        options = {
          -- remove default sections and component separators
          component_separators = "",
          section_separators = "",
          theme = {
            -- setting defaults to statusline
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
          },
        },
        sections = {
          -- clear defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          -- clear for later use
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          -- clear defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          -- clear for later use
          lualine_c = {},
          lualine_x = {},
        },
      }

      -- insert active component in lualine_c at left section
      local function active_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- insert inactive component in lualine_c at left section
      local function inactive_left(component)
        table.insert(config.inactive_sections.lualine_c, component)
      end

      -- insert active component in lualine_x at right section
      local function active_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      -- insert inactive component in lualine_x at right section
      local function inactive_right(component)
        table.insert(config.inactive_sections.lualine_x, component)
      end

      -- dump object contents
      local function dump(o)
        if type(o) == 'table' then
          local s = ''
          for k, v in pairs(o) do
            if type(k) ~= 'number' then
              k = '"' .. k .. '"'
            end
            s = s .. dump(v) .. ','
          end
          return s
        else
          return tostring(o)
        end
      end

      -- active left section
      active_left({
        function()
          local icon
          local ok, devicons = pcall(require, 'nvim-web-devicons')
          if ok then
            icon = devicons.get_icon(vim.fn.expand('%:t'))
            if icon == nil then
              icon = devicons.get_icon_by_filetype(vim.bo.filetype)
            end
          else
            if vim.fn.exists('*WebDevIconsGetFileTypeSymbol') > 0 then
              icon = vim.fn.WebDevIconsGetFileTypeSymbol()
            end
          end
          if icon == nil then
            icon = ''
          end
          return icon:gsub("%s+", "")
        end,
        color = function()
          return { bg = mode_color[vim.fn.mode()], fg = colors.white }
        end,
        padding = { left = 1, right = 1 },
        separator = { right = "▓▒░" },
      })
      active_left({
        "filename",
        cond = conditions.buffer_not_empty,
        color = function()
          return { bg = mode_color[vim.fn.mode()], fg = colors.white }
        end,
        padding = { left = 1, right = 1 },
        separator = { right = "▓▒░" },
        symbols = {
          modified = "󰶻 ",
          readonly = " ",
          unnamed = " ",
          newfile = " ",
        },
      })
      active_left({
        "branch",
        icon = "",
        color = { bg = colors.blue, fg = colors.black },
        padding = { left = 0, right = 1 },
        separator = { right = "▓▒░", left = "░▒▓" },
      })

      -- inactive left section
      inactive_left({
        function()
          return ''
        end,
        cond = conditions.buffer_not_empty,
        color = { bg = colors.black, fg = colors.grey },
        padding = { left = 1, right = 1 },
      })
      inactive_left({
        "filename",
        cond = conditions.buffer_not_empty,
        color = { bg = colors.black, fg = colors.grey },
        padding = { left = 1, right = 1 },
        separator = { right = "▓▒░" },
        symbols = {
          modified = "",
          readonly = "",
          unnamed = "",
          newfile = "",
        },
      })

      -- active right section
      active_right({
        function()
          local clients = vim.lsp.get_active_clients()
          local clients_list = {}
          for _, client in pairs(clients) do
            if (not clients_list[client.name]) then
              table.insert(clients_list, client.name)
            end
          end
          local lsp_lbl = dump(clients_list):gsub("(.*),", "%1")
          return lsp_lbl:gsub(",", ", ")
        end,
        icon = " ",
        color = { bg = colors.green, fg = colors.black },
        padding = { left = 1, right = 1 },
        cond = conditions.hide_in_width_first,
        separator = { right = "▓▒░", left = "░▒▓" },
      })

      active_right({
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " " },
        colored = false,
        color = { bg = colors.magenta, fg = colors.black },
        padding = { left = 1, right = 1 },
        separator = { right = "▓▒░", left = "░▒▓" },
      })
      active_right({
        "searchcount",
        color = { bg = colors.cyan, fg = colors.black },
        padding = { left = 1, right = 1 },
        separator = { right = "▓▒░", left = "░▒▓" },
      })
      active_right({
        "location",
        color = { bg = colors.red, fg = colors.white },
        padding = { left = 1, right = 0 },
        separator = { left = "░▒▓" },
      })
      active_right({
        function()
          local cur = vim.fn.line(".")
          local total = vim.fn.line("$")
          return string.format("%2d%%%%", math.floor(cur / total * 100))
        end,
        color = { bg = colors.red, fg = colors.white },
        padding = { left = 1, right = 1 },
        cond = conditions.hide_in_width,
        separator = { right = "▓▒░" },
      })
      active_right({
        "o:encoding",
        fmt = string.upper,
        cond = conditions.hide_in_width,
        padding = { left = 1, right = 1 },
        color = { bg = colors.blue, fg = colors.black },
      })
      active_right({
        "fileformat",
        fmt = string.lower,
        icons_enabled = false,
        cond = conditions.hide_in_width,
        color = { bg = colors.blue, fg = colors.black },
        separator = { right = "▓▒░" },
        padding = { left = 0, right = 1 },
      })

      -- inactive right section
      inactive_right({
        "location",
        color = { bg = colors.black, fg = colors.grey },
        padding = { left = 1, right = 0 },
        separator = { left = "░▒▓" },
      })
      inactive_right({
        "progress",
        color = { bg = colors.black, fg = colors.grey },
        cond = conditions.hide_in_width,
        padding = { left = 1, right = 1 },
        separator = { right = "▓▒░" },
      })
      inactive_right({
        "fileformat",
        fmt = string.lower,
        icons_enabled = false,
        cond = conditions.hide_in_width,
        color = { bg = colors.black, fg = colors.grey },
        separator = { right = "▓▒░" },
        padding = { left = 0, right = 1 },
      })
      --
      return config
    end,
  },
  { "krshrimali/nvim-autorunner" },
  { 'akinsho/toggleterm.nvim',   version = "*", config = true },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim" },
    cmd = "Mason",
    config = function()
      local mason_dap = require("mason-nvim-dap")
      mason_dap.setup({
        ensure_installed = {
          "bash",
          "cppdbg",
          "js",
          "node2",
          "php",
          "python",
        },
        auto_update = false,
        run_on_start = false,
        automatic_setup = true,
      })
      mason_dap.setup_handlers {}
    end,

  },
  --{
  --  "ray-x/lsp_signature.nvim",
  --  event = "BufRead",
  --  config = function()
  --   require "lsp_signature".on_attach()
  --  end,
  --},
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },
  { "christianchiarulli/telescope-tabs", branch = "chris" },
  { "lunarvim/colorschemes",             lazy = true, },
  --{
  --    "NvChad/nvim-colorizer.lua",
  --    require("colorizer").setup {
  --        filetypes = { "*" },
  --        user_default_options = {
  --            RGB = true, -- #RGB hex codes
  --            RRGGBB = true, -- #RRGGBB hex codes
  --            names = true, -- "Name" codes like Blue or blue
  --            RRGGBBAA = false, -- #RRGGBBAA hex codes
  --            AARRGGBB = false, -- 0xAARRGGBB hex codes
  --            rgb_fn = false, -- CSS rgb() and rgba() functions
  --            hsl_fn = false, -- CSS hsl() and hsla() functions
  --            css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  --            css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
  --            -- Available modes for `mode`: foreground, background,  virtualtext
  --            mode = "background", -- Set the display mode.
  --            -- Available methods are false / true / "normal" / "lsp" / "both"
  --            -- True is same as normal
  --            tailwind = false, -- Enable tailwind colors
  --            -- parsers can contain values used in |user_default_options|
  --            sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
  --            virtualtext = "■",
  --            -- update color values even if buffer is not focused
  --            -- example use: cmp_menu, cmp_docs
  --            always_update = false
  --        },
  --        -- all the sub-options of filetypes apply to buftypes
  --        buftypes = {},
  --    }
  --},
  --{
  --  "Manas140/run.nvim",
  --  config = function()
  --    require('run').setup()
  -- require("run").setup {
  --  ui = {
  --    gap = 0.5,
  -- border = "[none|single|double|rounded|solid|shadow]",
  --    border = solid,
  --    border_cl = "Comment", -- provide a highlight
  --    bg = "Normal",         -- provide a highlight
  --  },
  --  cmd = {
  -- variables, $path for entire path, $dir for current dir, $name for name without extention
  --    filetype = "command $path $dir $name",
  --  },
  -- }
  --  end,
  --},
  -- { 'michaelb/sniprun', build = 'sh ./install.sh'},
  {
    "michaelb/sniprun",
    event = 'VeryLazy',
    build = "bash ./install.sh",
    config = function()
      -- HACK: https://michaelb.github.io/sniprun/sources/README.html#usage
      require("sniprun").setup {
        live_mode_toggle = "enable",
        display = {
          "Classic",     --# display results in the command-line  area
          "VirtualText", --# display ok results as virtual text (multiline is shortened)
          "Terminal",
        },
        live_display = { "VirtualText", "Terminal" },
      }
    end,
  },
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
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
      })
    end,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
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
      'nvim-tree/nvim-web-devicons',     -- optional
    }
  },

  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 90,   -- width of the Zen window
        height = 0.9, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          signcolumn = "no",      -- disable signcolumn
          number = false,         -- disable number column
          relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          list = false, -- disable whitespace characters
        },
      },
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = false,               -- disables the ruler text in the cmd line area
          showcmd = false,             -- disables the command in the last line of the screen
        },
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = true }, -- disables git signs
        tmux = { enabled = true },     -- disables the tmux statusline
        -- this will change the font size on kitty when in zen mode
        -- to make this work, you need to set the following kitty options:
        -- - allow_remote_control socket-only
        -- - listen_on unix:/tmp/kitty
        kitty = {
          enabled = false,
          font = "+4", -- font size increment
        },
        -- this will change the font size on alacritty when in zen mode
        -- requires  Alacritty Version 0.10.0 or higher
        -- uses `alacritty msg` subcommand to change font size
        alacritty = {
          enabled = true,
          font = "22", -- font size
        },
        -- this will change the font size on wezterm when in zen mode
        -- See alse also the Plugins/Wezterm section in this projects README
        wezterm = {
          enabled = false,
          -- can be either an absolute font size or the number of incremental steps
          font = "+4", -- (10% increase per step)
        },
      },
    },
  },
  --{
  --    "nvim-neotest/neotest-python",
  --    dependencies = {
  --        "nvim-lua/plenary.nvim",
  --        "nvim-treesitter/nvim-treesitter",
  --        "antoinemadec/FixCursorHold.nvim",
  --        "nvim-neotest/neotest",
  --    },
  --    event = "VeryLazy",
  --    config = function()
  --        require("neotest").setup({
  --            adapters = {
  --                require("neotest-python")({
  --                    dap = { justMyCode = false },
  --                }),
  --            },
  --        })
  --    end,
  --},
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "css",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "tsx",
        "vim",
        "yaml",
        "dockerfile",
        "python",
      },
    },
  },

  -- For the transparent background in Lazyvim
  {
    "folke/tokyonight.nvim",
    lazy = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- Nvim-Notify
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#2E3440",
      stages = "static",
      timeout = 1500,
    },
    --  }
    -- lazy = {
    --     background_colour = "#000000",
    --   },
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
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
    'nvim-telescope/telescope.nvim',
    version = '0.1.1',
    -- or                              , branch = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- Indent line
  { 'lukas-reineke/indent-blankline.nvim', lazy = true },
  {
    "folke/trouble.nvim",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
    cmd = "TroubleToggle",
  },
  {
    "folke/neodev.nvim",
    ft = 'lua',
  },
  {
    'ThePrimeagen/harpoon',
    event = 'VeryLazy'
  },
  {
    'ThePrimeagen/refactoring.nvim',
    event = 'VeryLazy',
  },
  -- { 'preservim/vimux' },
  { 'ibhagwan/fzf-lua' },
  {
    "RRethy/vim-illuminate",
    lazy = true
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  -- Tag viewer
  { 'preservim/tagbar',        lazy = true },
  { 'preservim/nerdcommenter', lazy = true },
  -- Autopair
  { -- override nvim-autopairs plugin
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      -- run default AstroNvim config
      require "plugin.configs.nvim-autopairs" (plugin, opts)
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
      require("colorizer").setup({ "css", "scss", "html", "javascript", "python" }, {
        RGB = true,          -- #RGB hex codes
        RRGGBB = true,       -- #RRGGBB hex codes
        RRGGBBAA = true,     -- #RRGGBBAA hex codes
        rgb_fn = true,       -- CSS rgb() and rgba() functions
        hsl_fn = true,       -- CSS hsl() and hsla() functions
        css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = 'background', -- Set the display mode.
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
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
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
--reload "user.runner"
--reload "plug_config.telescope"

-- vim.cmd('command! Run :lua run_code()')
-- vim.cmd('command! Debug :lua debug_code()')

-- vim.cmd('command! -nargs=* RunUpdate :lua update_command_table("run", \'<f-args>\')')
-- vim.cmd('command! -nargs=* DebugUpdate :lua update_command_table("debug", \'<f-args>\')')
