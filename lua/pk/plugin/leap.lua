local setup, leap= pcall(require, "leap.nvim")
if not setup then
  return
end

leap.add_default_mappings(true)
leap.setup()
