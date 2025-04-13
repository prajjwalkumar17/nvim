-- Try to safely require markdown-preview
-- Note: markdown-preview doesn't have a Lua API, so we're just checking if the plugin is available
local is_installed = vim.fn.executable('markdown-preview.nvim') == 1

if not is_installed then
  -- The plugin is not available yet
  return
end

-- Set up markdown preview options
-- Vim global variables in Lua format

-- Make commands available for all filetypes
vim.g.mkdp_command_for_global = 1

-- Set up options
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_open_to_the_world = 0
vim.g.mkdp_open_ip = ''

-- Explicitly set browser path (update this with your browser path)
vim.g.mkdp_browser = '/usr/bin/firefox'  -- For Firefox
-- vim.g.mkdp_browser = '/usr/bin/google-chrome'  -- For Chrome
-- vim.g.mkdp_browser = '/usr/bin/brave'  -- For Brave

-- Echo the preview URL in command line so you can open it manually if needed
vim.g.mkdp_echo_preview_url = 1

vim.g.mkdp_browserfunc = ''
vim.g.mkdp_theme = 'dark'
vim.g.mkdp_filetypes = { 'markdown' }

-- Keymaps
local keymap = vim.keymap
keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { silent = true })
keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { silent = true })
keymap.set("n", "<leader>mt", ":MarkdownPreviewToggle<CR>", { silent = true })

-- Function to open URL in browser through the system's xdg-open
vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
vim.cmd([[
  function! OpenMarkdownPreview(url)
    execute "silent! !xdg-open " . a:url
  endfunction
]])
