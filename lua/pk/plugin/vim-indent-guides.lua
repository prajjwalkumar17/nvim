local setup, vim_indent= pcall(require, "vim-indent-guides")
if not setup then
  return
end


vim_indent.setup {
    -- Disable automatic color generation
    indent_colors = false,
    -- Set custom colors for odd and even indent levels
    even_colors = { bg = "blue", ctermbg = 1 },
    odd_colors = { bg = "red", ctermbg = 1 }
}
