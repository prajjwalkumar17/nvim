-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end
require 'nvim-treesitter.install'.prefer_git = false
require 'nvim-treesitter.install'.compilers = { 'clang' }
vim.g.rainbow_active = true
-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  -- enable brackets highlighter
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
 -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "lua", "vim", "vimdoc", "query", "rust", "java", "javascript"},
  -- auto install above language parsers
  auto_install = true,
})
