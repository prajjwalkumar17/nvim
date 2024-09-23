-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
--
-- Define the formatOnKeyPress function as a global function
_G.formatOnKeyPress = function()
    vim.cmd("FormatWriteLock")
    require("lint").try_lint()
end

require('formatter').setup{
  -- Enable or disable logging
  logging = false,
  -- Set the log level
  -- log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
  javascript = {
      require("formatter.filetypes.javascript").prettier
    },
  typescript = {
      require("formatter.filetypes.typescript").prettier
    },
    javascriptreact = {
      require("formatter.filetypes.javascript").prettier
    },
    typescriptreact = {
      require("formatter.filetypes.typescript").prettier
    },
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

-- Set the keymap to trigger the formatOnKeyPress function
vim.api.nvim_set_keymap("n", "<leader>fmm", ":lua formatOnKeyPress()<CR>", { noremap = true, silent = true })

-- for autoformat
--
-- Set up autocmd using the function
-- vim.cmd([[
--     augroup FormatOnWrite
--         autocmd!
--         autocmd BufWritePost * lua formatOnKeyPress()
--     augroup END
-- ]])
--
-- vim.api.nvim_create_autocmd({"BufWritePost"},{
--   command = "FormatWriteLock"
-- })
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })
