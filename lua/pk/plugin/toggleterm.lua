local setup, toggle= pcall(require, "toggleterm")
if not setup then
  return
end


toggle.setup({
  size=13,
  open_mapping = [[<c-\>]],
  shade_filetypes = {},
  autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  shading_factor = 10, -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
  start_in_insert = true,
  persist_size = true,
  shell = 'zsh',  -- Set the shell path to PowerShell
  direction = 'horizontal'
})
