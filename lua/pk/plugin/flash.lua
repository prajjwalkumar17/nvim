local status, flash = pcall(require, "flash")
if not status then
  return
end

flash.setup({
  modes = {
    char = {
      enabled = false,
    },
  },
})
