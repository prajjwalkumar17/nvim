local oldworld_status, oldworld = pcall(require, "oldworld")
if not oldworld_status then
  return
end

oldworld.setup({
   highlight_overrides = {
        Comment = { bg = "#3342FF" }
    }

})
