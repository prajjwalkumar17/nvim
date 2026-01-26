-- Check if the plugin is available
local tagbar_present, tagbar = pcall(require, "tagbar")

-- If the plugin is not available, exit
if not tagbar_present then
  return
end

-- Setup Tagbar
tagbar.setup {
  -- Configure your options here
}

-- Optionally, you can set a key mapping to toggle Tagbar
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })
