-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup({
  lightbulb = {
    enable = true,
    enable_in_insert = false,
    sign = true,            -- shows lightbulb sign in signcolumn
    virtual_text = true,    -- shows 💡 as virtual text next to code
    debounce = 50,
  },
  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  definition = {
    edit = "<CR>",
  },
  ui = {
    colors = {
      normal_bg = "#022746",
    },
  },
})
