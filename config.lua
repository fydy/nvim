----[[
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- `lvim` is the global options object
--]]
--
---- Enable powershell as your default shell
--vim.opt.shell = "pwsh.exe -NoLogo"
--vim.opt.shellcmdflag =
--  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
--vim.cmd [[
--		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
--		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
--		set shellquote= shellxquote=
--  ]]
--
---- Set a compatible clipboard manager
--vim.g.clipboard = {
--  copy = {
--    ["+"] = "win32yank.exe -i --crlf",
--    ["*"] = "win32yank.exe -i --crlf",
--  },
--  paste = {
--    ["+"] = "win32yank.exe -o --lf",
--    ["*"] = "win32yank.exe -o --lf",
--  },
--}
--
---- vim options
--vim.opt.shiftwidth = 2
--vim.opt.tabstop = 2
--vim.opt.relativenumber = true
--
---- general
--lvim.log.level = "info"
--lvim.format_on_save = {
--  enabled = true,
--  pattern = "*.lua",
--  timeout = 1000,
--}

reload "user.plugins"
reload "user.options"
reload "user.keymaps"
reload "user.autocommands"
reload "user.lsp"
reload "user.smoothie"
reload "user.harpoon"
reload "user.cybu"
--reload "user.neotest"
reload "user.surround"
reload "user.bookmark"
reload "user.todo-comments"
reload "user.jaq"
reload "user.fidget"
--reload "user.lab"
reload "user.git"
reload "user.zen-mode"
reload "user.inlay-hints"
reload "user.telescope"
reload "user.toggleterm"
reload "user.bqf"
reload "user.dial"
reload "user.numb"
reload "user.treesitter"
reload "user.neogit"
reload "user.colorizer"
reload "user.lualine"
reload "user.scrollbar"
-- -- reload "user.zk"
--reload "user.copilot"
--reload "user.chatgpt"
reload "user.whichkey"
reload "user.neoai"
reload "user.code_runner"
reload "user.snip"
-- lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

local opts = { noremap = true, silent = true }
-- For the description on keymaps, I have a function getOptions(desc) which returns noremap=true, silent=true and desc=desc. Then call: keymap(mode, keymap, command, getOptions("some randome desc")

local keymap = vim.keymap.set

keymap("n", "<left>", "<C-w>h", opts)
keymap("n", "<down>", "<C-w>j", opts)
keymap("n", "<up>", "<C-w>k", opts)
keymap("n", "<right>", "<C-w>l", opts)

keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)
