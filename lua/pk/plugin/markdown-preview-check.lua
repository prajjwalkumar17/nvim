-- Script to check if the browser is configured correctly
-- and provide debugging information

-- Create a simple markdown file for testing
vim.cmd([[
  function! CreateTestMarkdown()
    let test_file = tempname() . '.md'
    call writefile(['# Test Markdown', '', 'This is a test markdown file.'], test_file)
    execute 'edit ' . test_file
    return test_file
  endfunction
]])

-- Add a command to test the markdown preview
vim.cmd([[
  command! TestMarkdownPreview call CreateTestMarkdown() | MarkdownPreview
]])

-- Add a command to check browser configuration
vim.cmd([[
  command! CheckMarkdownPreviewBrowser echo "Browser setting: " . g:mkdp_browser
]])

-- Add a command to manually open a URL using xdg-open
vim.cmd([[
  command! -nargs=1 OpenURL !xdg-open <args>
]])

-- Add a test keybinding that uses xdg-open directly
local keymap = vim.keymap
keymap.set("n", "<leader>mpt", ":!xdg-open http://localhost:8080<CR>", { silent = true })

-- Advanced diagnostics command
vim.cmd([[
  command! MarkdownPreviewDiagnostics call s:DiagnoseMarkdownPreview()
  
  function! s:DiagnoseMarkdownPreview()
    echo "Checking markdown-preview.nvim configuration..."
    echo "-------------------------------------------------"
    echo "Node.js version: "
    silent !node --version
    echo "Yarn availability: "
    silent !which yarn
    echo "Plugin path: "
    echo globpath(&rtp, "plugin/markdown-preview.vim")
    echo "Browser setting: " . g:mkdp_browser
    echo "Echo URL setting: " . g:mkdp_echo_preview_url
    echo "-------------------------------------------------"
    echo "Done checking. Run :MarkdownPreview to test."
  endfunction
]])
