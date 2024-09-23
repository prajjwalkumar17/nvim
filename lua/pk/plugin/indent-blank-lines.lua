local highlight = {
    "RainbowYellow",
}

local hooks = require "ibl.hooks"
vim.opt.listchars = {
    eol = "↴",
}
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
end)

require("ibl").setup {
  exclude ={
    filetypes = {
        "terminal",
        "aerial",
        "dashboard",
        "NvimTree",
        "help",
        "dapui_scopes",
        "dapui_breakpoints",
        "dapui_stacks",
        "dapui_watches",
        "dap-repl",
        "httpResult",
        "nvimd",
        "w3m",
        "haskell"
    }
  },
  indent = { highlight = highlight }
}

vim.g.indent_blankline_use_treesitter = false
