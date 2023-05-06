-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
    rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  -- ensure these language parsers are installed
  ensure_installed = {
    "json",
    "javascript",
    "yaml",
    "html",
    "markdown",
    "markdown_inline",
    "bash",
    "lua",
    "vim",
    "toml",
    "rust",
    "dockerfile",
    "gitignore",
  },
  -- auto install above language parsers
  auto_install = true,
})
