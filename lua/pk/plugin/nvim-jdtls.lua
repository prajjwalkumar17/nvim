-- import nvim-jdtls plugin safely
local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end


jdtls.setup({
    
})
