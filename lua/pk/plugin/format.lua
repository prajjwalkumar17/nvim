local setup, fmt = pcall(require, "lsp-format")
if not setup then
  return
end

local on_attach = function(client)
    require("lsp-format").on_attach(client)
end

fmt.setup({
  server = {
    on_attach = on_attach
  },
})
