local M = {}

-- NOTE: this plugin doesn't affect preselection. Selection works weirdly
M.cfg = {
  hint_prefix = "🙈 ",
  max_height = 10,
  max_width = 60,
  bind = true,
  -- toggle_key = "<C-x>",
  always_trigger = false,
  floating_window_off_x = 5, -- adjust float windows x position.
  -- floating_window_off_y = 2,
  -- zindex = 49,
  -- support for function is only availabe in main
  -- floating_window_off_y = function()                 -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
  --   local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
  --   local pumheight = vim.o.pumheight
  --   local winline = vim.fn.winline()                 -- line number in the window
  --   local winheight = vim.fn.winheight(0)

  --   -- window top
  --   if winline - 1 < pumheight then
  --     return pumheight
  --   end

  --   -- window bottom
  --   if winheight - winline < pumheight then
  --     return -pumheight
  --   end
  --   return 0
  -- end,
}

return M
