-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- deete single character without copying into register
keymap.set("n", "x", '"_x')
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- window resizing
keymap.set("n","<C-up>", "<cmd>resize +1<cr>")
keymap.set("n","<C-down>", "<cmd>resize -1<cr>")
keymap.set("n","<C-left>", "<cmd>vertical resize -1<cr>")
keymap.set("n","<C-right>", "<cmd>vertical resize +1<cr>")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- Tagbar
keymap.set("n","<F8>", ":TagbarToggle<CR>")

-- Cmdline
keymap.set("n","<leader>b", ":FineCmdline<CR>")

-- Indent lines
keymap.set("n", "<leader>if", ":IndentGuidesToggle<CR>")

-- Toggleterm
keymap.set("n","<leader>t",":ToggleTerm direction=horizontal<CR>")
keymap.set("n","<leader>,",":ToggleTermToggleAll<CR>")
keymap.set("n","<leader>x",":ToggleTerm size=10 direction=float<CR>")

-- Nvim dap
keymap.set("n","<leader>db",":DapToggleBreakpoint<CR>") --Add breakpoint
keymap.set("n","<leader>dr",":DapContinue<CR>") --Continue the debugger

-- RunJavaCode
keymap.set("n", "<leader>mn", ":w<CR>:!java %:p<CR>")
keymap.set("n", "<leader>mn", ":w<CR>:terminal java %<CR>", { noremap = true, silent = true })

-- FormatJavaCode
keymap.set("n", "<leader>fm", ":!powershell -Command \"java -jar 'C:\\Users\\Hangsai\\AppData\\Local\\nvim\\lua\\pk\\plugin\\lsp\\google-java-format-1.19.1-all-deps.jar' -i '%:p'<CR>")

--gotoPreview
keymap.set(
	"n",
	"gpd",
	[[<cmd>lua require('goto-preview').goto_preview_definition()<cr>]],
	{ desc = "preview definition" }
)
keymap.set(
	"n",
	"gpt",
	[[<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>]],
	{ desc = "preview type definition" }
)
keymap.set(
	"n",
	"gpi",
	[[<cmd>lua require('goto-preview').goto_preview_implementation()<cr>]],
	{ desc = "preview implementation" }
)
keymap.set(
	"n",
	"gQ",
	[[<cmd>lua require('goto-preview').close_all_win()<cr>]],
	{ desc = "close all previews" }
)
keymap.set(
	"n",
	"gpr",
	[[<cmd>lua require('goto-preview').goto_preview_references()<cr>]],
	{ desc = "preview references" }
)


keymap.set("n", "<leader>l", "<cmd>lua vim.lsp.buf.hover()<cr>")

-- Keep Visual Mode selections when indenting
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- Clipboard support
--keymap.set("v", "<leader>y", "\"+y")
-- keymap.set("v", "<leader>y", "\"+yg_")
-- keymap.set("v", "<leader>y", "\"+yg_")
-- keymap.set("v", "<leader>y", "\"+yg_")

-- nnoremap("<leader>p", "\"+p")
-- nnoremap("<leader>P", "\"+P")

-- Toggle between buffers
keymap.set("n", "<leader><leader>", "<C-^>")

--DiffView
keymap.set("n", "<leader>gt", ":DiffviewOpen<CR>")
keymap.set("n", "<leader>gq", ":DiffviewClose<CR>") -- toggle file explorer

--Barbar Tabs
-- Move to previous/next
keymap.set('n', '<leader>,', '<Cmd>BufferPrevious<CR>')
keymap.set('n', '<leader>.', '<Cmd>BufferNext<CR>')
-- Re-order to previous/next
keymap.set('n', '<leader>;', '<Cmd>BufferMovePrevious<CR>')
keymap.set('n', '<leader>', '<Cmd>BufferMoveNext<CR>')
-- Goto buffer in position...
keymap.set('n', '<leader>1', '<Cmd>BufferGoto 1<CR>')
keymap.set('n', '<leader>2', '<Cmd>BufferGoto 2<CR>')
keymap.set('n', '<leader>3', '<Cmd>BufferGoto 3<CR>')
keymap.set('n', '<leader>4', '<Cmd>BufferGoto 4<CR>')
keymap.set('n', '<leader>5', '<Cmd>BufferGoto 5<CR>')
keymap.set('n', '<leader>6', '<Cmd>BufferGoto 6<CR>')
keymap.set('n', '<leader>7', '<Cmd>BufferGoto 7<CR>')
keymap.set('n', '<leader>8', '<Cmd>BufferGoto 8<CR>')
keymap.set('n', '<leader>9', '<Cmd>BufferGoto 9<CR>')
keymap.set('n', '<leader>0', '<Cmd>BufferLast<CR>')
-- Pin/unpin buffer
keymap.set('n', '<leader>bp', '<Cmd>BufferPin<CR>')
-- Close buffer
keymap.set('n', '<leader>c', '<Cmd>BufferClose<CR>')
keymap.set('n','<leader>bc','<Cmd>BufferCloseAllButPinned<CR>') --close all but pinned

-- flash
keymap.set(
	"n",
	"<leader>mm",
	[[<cmd>lua require('flash').jump()<cr>]],
	{ desc = "flash jump" }
)
keymap.set(
	"n",
	"<leader>mn",
	[[<cmd>lua require('flash').treesitter()<cr>]],
	{ desc = "flash jump" }
)
keymap.set(
	"n",
	"<leader>m,",
	[[<cmd>lua require('flash').treesitter_search()<cr>]],
	{ desc = "flash jump" }
)
-- harpoon
keymap.set('n', '<leader>hx', require('harpoon.mark').add_file)
keymap.set('n', '<leader>hn', require('harpoon.ui').nav_next)
keymap.set('n', '<leader>hp', require('harpoon.ui').nav_prev)
keymap.set('n', '<leader>hm', [[<cmd>Telescope harpoon marks<cr>]])

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>Gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>Gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>Gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>Gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- flash
keymap.set(
	"n",
	"<leader>mm",
	[[<cmd>lua require('flash').jump()<cr>]],
	{ desc = "flash jump" }
)
keymap.set(
	"n",
	"<leader>mn",
	[[<cmd>lua require('flash').treesitter()<cr>]],
	{ desc = "flash jump" }
)
keymap.set(
	"n",
	"<leader>m,",
	[[<cmd>lua require('flash').treesitter_search()<cr>]],
	{ desc = "flash jump" }
)
-- harpoon
keymap.set('n', '<leader>hx', require('harpoon.mark').add_file)
keymap.set('n', '<leader>hn', require('harpoon.ui').nav_next)
keymap.set('n', '<leader>hp', require('harpoon.ui').nav_prev)
keymap.set('n', '<leader>hm', [[<cmd>Telescope harpoon marks<cr>]])
