local ok = pcall(require, "rainbow-delimiters")
if not ok then
  return
end

vim.g.rainbow_delimiters = vim.g.rainbow_delimiters or {}
