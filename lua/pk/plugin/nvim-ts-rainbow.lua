local setup, tsr= pcall(require, "p00f/nvim-ts-rainbow")
if not setup then
  return
end
tsr.setup({
})

vim.g.rainbow_active = true
