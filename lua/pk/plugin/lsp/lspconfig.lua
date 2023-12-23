-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
local home = os.getenv('HOME')
local jdtls = pcall(require, "jdtls")
if not lspconfig_status then
  return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end


local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n","gr","<cmd>lua vim.lsp.buf.references()<cr>",opts)
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- hover around
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

  keymap.set("n", "<leader>la", "<Cmd>lua require(\'jdtls\').organize_imports()<CR>", opts) -- see outline on right hand side

end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

-- Adding JDTLS (java language server)
local capabilities_1 = vim.lsp.protocol.make_client_capabilities()
capabilities_1 = require('cmp_nvim_lsp').default_capabilities(capabilities)
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
lspconfig["jdtls"].setup({
  cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.level=ALL',
        '-Xmx1G',
        '-jar',
        'C:\\Users\\Hangsai\\AppData\\Local\\nvim\\lua\\pk\\plugin\\jdt-language-server-1.9.0-202203031534\\plugins\\org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration',
        'C:\\Users\\Hangsai\\AppData\\Local\\nvim\\lua\\pk\\plugin\\jdt-language-server-1.9.0-202203031534\\config_win\\',
        '-data',
        vim.fn.expand('~/.cache/jdtls-workspace') .. workspace_dir,
    },
   root_dir = function(fname)
      return lspconfig.util.root_pattern('gradlew', '.git', 'mvnw')(fname) or vim.fn.getcwd()
    end,
    capabilities = capabilities_1
  })

