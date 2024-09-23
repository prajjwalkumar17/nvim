local ok, notify = pcall(require, 'notify')
if not ok then
    return
end

-- Set up nvim-notify
notify.setup({
    stages = 'fade_in_slide_out',
    background_colour = 'FloatShadow', -- Adjust background color as needed
    icons = {
        ERROR = '',
        WARN = '',
        INFO = '',
        HINT = '',
        DEBUG = ''
    },
})

vim.notify = require('notify')
local plugin = "Welcome hangsai😈"

vim.notify("This journey begins :)", "error", {
  title = plugin,
  on_open = function()
    local timer = vim.loop.new_timer()
    timer:start(1000, 0, function()
      vim.notify({ "Everything looks perfect", "we can start now....." }, "warn", {
        title = "código espartanos ⚔",
        timeout = 3000,
        on_close = function()
        end,
      })
    end)
  end,
})

