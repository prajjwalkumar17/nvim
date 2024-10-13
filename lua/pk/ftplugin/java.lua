-- Java Language Server configuration.
-- Locations:
-- 'nvim/ftplugin/java.lua'.
-- 'nvim/lang-servers/intellij-java-google-style.xml'

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- local jdtls_ok, jdtls = pcall(require, "jdtls")
-- if not jdtls_ok then
--   vim.notify "JDTLS not found, install with `:LspInstall jdtls`"
--   return
-- end
--
-- local lspconfig_status, lspconfig = pcall(require, "lspconfig")
-- if not lspconfig_status then
--   return
-- end
--
-- local jdtls_path = vim.fn.stdpath('data') .. "/mason/packages/jdtls"
-- local path_to_lsp_server = jdtls_path .. "/config_linux"
-- local path_to_plugins = jdtls_path .. "/plugins"
-- local path_to_jar = path_to_plugins .. "/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar"
-- local lombok_path = jdtls_path .. "/lombok.jar"
-- local extendedClientCapabilities = jdtls.extendedClientCapabilities
-- extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
-- local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
-- local root_dir = require("jdtls.setup").find_root(root_markers)
-- if root_dir == "" then
--   return
-- end
--
-- local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--
-- Main Config
-- local config = {
--   -- The command that starts the language server
--   -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
--   cmd = {
--     '/usr/lib/jvm/java-21-openjdk-amd64/bin/java',
--     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--     '-Dosgi.bundles.defaultStartLevel=4',
--     '-Declipse.product=org.eclipse.jdt.ls.core.product',
--     '-Dlog.protocol=true',
--     '-Dlog.level=ALL',
--     '-javaagent:' .. lombok_path,
--     '-Xms1g',
--     '--add-modules=ALL-SYSTEM',
--     '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--     '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--     '-jar', path_to_jar,
--     '-configuration', path_to_lsp_server,
--     '-data',
--     vim.fn.expand('~/.cache/jdtls-workspace/') .. workspace_dir,
--   },
--
--   root_dir = root_dir,
--  -- root_dir = function(fname)
--  --      return lspconfig.util.root_pattern('gradlew', '.git', 'mvnw')(fname) or vim.fn.getcwd()
--  --    end,
--   -- Here you can configure eclipse.jdt.ls specific settings
--   -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--   -- for a list of options
--   capabilities = capabilities,
--   settings = {
--     java = {
--       home = '/usr/lib/jvm/java-21-openjdk-amd64',
--       eclipse = {
--         downloadSources = true,
--       },
--       configuration = {
--         updateBuildConfiguration = "interactive",
--         runtimes = {
--           {
--             name = "JavaSE-21",
--             path = "/usr/lib/jvm/java-21-openjdk-amd64",
--           }
--         }
--       },
--       maven = {
--         downloadSources = true,
--       },
--       implementationsCodeLens = {
--         enabled = true,
--       },
--       referencesCodeLens = {
--         enabled = true,
--       },
--       references = {
--         includeDecompiledSources = true,
--       },
--       format = {
--         enabled = true,
--         settings = {
--           url = vim.fn.stdpath "config" .. "/plugin/lang-servers/intellij-java-google-style.xml",
--           profile = "GoogleStyle",
--         },
--       },
--
--     },
--     signatureHelp = { enabled = true },
--     completion = {
--       favoriteStaticMembers = {
--         "org.hamcrest.MatcherAssert.assertThat",
--         "org.hamcrest.Matchers.*",
--         "org.hamcrest.CoreMatchers.*",
--         "org.junit.jupiter.api.Assertions.*",
--         "java.util.Objects.requireNonNull",
--         "java.util.Objects.requireNonNullElse",
--         "org.mockito.Mockito.*",
--       },
--       importOrder = {
--         "java",
--         "javax",
--         "com",
--         "org"
--       },
--     },
--     extendedClientCapabilities = extendedClientCapabilities,
--     sources = {
--       organizeImports = {
--         starThreshold = 9999,
--         staticStarThreshold = 9999,
--       },
--     },
--     codeGeneration = {
--       toString = {
--         template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
--       },
--       useBlocks = true,
--     },
--   },
--
--   flags = {
--     allow_incremental_sync = true,
--   },
--   init_options = {
--     bundles = {},
--   },
-- }
-- config['on_attach'] = function(client, bufnr)
--   require'keymaps'.map_java_keys(bufnr);
--   require "lsp_signature".on_attach({
--     bind = true, -- This is mandatory, otherwise border config won't get registered.
--     floating_window_above_cur_line = false,
--     padding = '',
--     handler_opts = {
--       border = "rounded"
--     }
--   }, bufnr)
-- end
--
-- -- This starts a new client & server,
-- -- or attaches to an existing client & server depending on the `root_dir`.
-- require('jdtls').start_or_attach(config)
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
  vim.notify "JDTLS not found, install with `:LspInstall jdtls`"
  return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

-- local root_dir = function(fname)
--   local pattern = lspconfig.util.root_pattern('gradlew', '.git', 'mvnw')
--   return pattern(fname) or vim.loop.cwd()
-- end

local config = {
  cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.level=ALL',
        '-Xmx1G',
        '-jar',
        '/home/hangsai/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
        '-configuration',
        '/home/hangsai/.local/share/nvim/mason/packages/jdtls/config_linux/',
        '-data',
        vim.fn.expand('~/.cache/jdtls-workspace/') .. workspace_dir,
    },
    root_dir  = root_dir,
    capabilities = capabilities,
    settings = {
        java = {
          eclipse = {
            downloadSources = true,
          },
          configuration = {
            updateBuildConfiguration = "interactive",
          },
          maven = {
            downloadSources = true,
          },
          implementationsCodeLens = {
            enabled = true,
          },
          referencesCodeLens = {
            enabled = true,
          },
          references = {
            includeDecompiledSources = true,
          }
        },
       signatureHelp = { enabled = true },
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*",
            },
          },
       contentProvider = { preferred = "fernflower" },
          extendedClientCapabilities = extendedClientCapabilities,
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
          codeGeneration = {
            toString = {
              template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            },
            useBlocks = true,
          },
        },
    flags = {
      allow_incremental_sync = true,
    },
  }
config['on_attach'] = function(client, bufnr)
  require'keymaps'.map_java_keys(bufnr);
  require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    floating_window_above_cur_line = false,
    padding = '',
    handler_opts = {
      border = "rounded"
    }
  }, bufnr)
end

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

 -- local keymap = vim.keymap -- for conciseness
 --  local opts = { noremap = true, silent = true}   -- set keybinds
 --
 --  keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
 --  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
 --  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
 --  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
 --  keymap.set("n","gr","<cmd>lua vim.lsp.buf.references()<cr>",opts)
 --  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
 --  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
 --  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
 --  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
 --  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
 --  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
 --  keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- hover around

