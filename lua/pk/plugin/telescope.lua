-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- compat shim for newer nvim-treesitter
local parsers_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if parsers_ok and not parsers.ft_to_lang and vim.treesitter
  and vim.treesitter.language and vim.treesitter.language.get_lang then
  parsers.ft_to_lang = vim.treesitter.language.get_lang
end

local highlight_ok, highlight = pcall(require, "nvim-treesitter.highlight")
if highlight_ok and not highlight.is_enabled then
  -- fallback for older nvim-treesitter APIs
  highlight.is_enabled = function()
    return true
  end
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    -- avoid treesitter API mismatch in previewer
    preview = {
      treesitter = false,
    },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
  },
})

-- telescope.load_extension("fzf")
