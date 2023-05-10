local status, telescope = pcall(require, "telescope")
if not status then
    return
end

local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        -- layout_strategy = "flex",
        -- layout_config = {
        -- 	flex = { flip_columns = 130 },
        -- },
        layout_strategy = "vertical",
        layout_config = {
            width = 0.85,
            height = 0.95,
        },
        mappings = {
            n = { ["q"] = actions.close },
            i = { ["<C-u>"] = false, ["<C-d>"] = false },
        },
        vimgrep_arguments = {
            "rg",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
    },
})

-- keymap
-- local keymap = require('utils.set_keymap')
-- local opts = { noremap = true, silent = true }

-- keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
-- keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], opts)
-- keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
-- keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)
-- keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], opts)
-- keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], opts)
-- keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
-- keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], opts)
-- keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opts)

-- keymap("n", "<leader>sf", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
-- keymap("n", "<leader>sg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
-- keymap("n", "<leader>sb", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
-- keymap("n", "<leader>sh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
lvim.builtin.telescope.defaults.file_ignore_patterns = {
    ".git/",
    "target/",
    "docs/",
    "vendor/*",
    "%.lock",
    "__pycache__/*",
    "%.sqlite3",
    "%.ipynb",
    "node_modules/*",
    -- "%.jpg",
    -- "%.jpeg",
    -- "%.png",
    "%.svg",
    "%.otf",
    "%.ttf",
    "%.webp",
    ".dart_tool/",
    ".github/",
    ".gradle/",
    ".idea/",
    ".settings/",
    ".vscode/",
    "__pycache__/",
    "build/",
    "env/",
    "gradle/",
    "node_modules/",
    "%.pdb",
    "%.dll",
    "%.class",
    "%.exe",
    "%.cache",
    "%.ico",
    "%.pdf",
    "%.dylib",
    "%.jar",
    "%.docx",
    "%.met",
    "smalljre_*/*",
    ".vale/",
    "%.burp",
    "%.mp4",
    "%.mkv",
    "%.rar",
    "%.zip",
    "%.7z",
    "%.tar",
    "%.bz2",
    "%.epub",
    "%.flac",
    "%.tar.gz",
}
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
    -- for input mode
    i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-b>"] = actions.results_scrolling_up,
        ["<C-f>"] = actions.results_scrolling_down,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<c-d>"] = require("telescope.actions").delete_buffer,

        -- ["<C-u>"] = actions.preview_scrolling_up,
        -- ["<C-d>"] = actions.preview_scrolling_down,

        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<Tab>"] = actions.close,
        ["<S-Tab>"] = actions.close,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-h>"] = actions.which_key, -- keys from pressing <C-h>
        ["<esc>"] = actions.close,
    },
    -- for normal mode
    n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<C-b>"] = actions.results_scrolling_up,
        ["<C-f>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.close,
        ["<S-Tab>"] = actions.close,
        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,
        ["q"] = actions.close,
        ["dd"] = require("telescope.actions").delete_buffer,
        ["s"] = actions.select_horizontal,
        ["v"] = actions.select_vertical,
        ["t"] = actions.select_tab,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
    },
}

lvim.builtin.telescope.pickers.live_grep = {
    theme = "dropdown",
}

lvim.builtin.telescope.pickers.grep_string = {
    theme = "dropdown",
}

lvim.builtin.telescope.pickers.find_files = {
    theme = "dropdown",
    previewer = false,
}

lvim.builtin.telescope.pickers.buffers = {
    theme = "dropdown",
    previewer = false,
    initial_mode = "normal",
}

lvim.builtin.telescope.pickers.planets = {
    show_pluto = true,
    show_moon = true,
}

lvim.builtin.telescope.pickers.colorscheme = {
    enable_preview = true,
}

lvim.builtin.telescope.pickers.lsp_references = {
    theme = "dropdown",
    initial_mode = "normal",
}

lvim.builtin.telescope.pickers.lsp_definitions = {
    theme = "dropdown",
    initial_mode = "normal",
}

lvim.builtin.telescope.pickers.lsp_declarations = {
    theme = "dropdown",
    initial_mode = "normal",
}

lvim.builtin.telescope.pickers.lsp_implementations = {
    theme = "dropdown",
    initial_mode = "normal",
}
--require('telescope').load_extension('fzf')
--require('telescope').load_extension('hop')
--require('telescope').load_extension('yabs')
require("telescope-tabs").setup {
    show_preview = false,
    close_tab_shortcut = "C-d",
    initial_mode = "normal",
    theme = "dropdown",
    -- Your custom config :^)
}
