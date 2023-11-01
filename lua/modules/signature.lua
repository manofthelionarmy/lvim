local M = {}

-- NOTE: this plugin doesn't affect preselection. Selection works weirdly
M.cfg = {
  hint_prefix = "🙈 ",
  max_height = 10,
  max_width = 60,
  bind = true,
  toggle_key = "<C-x>",
  toggle_key_flip_floatwin_setting = false,
  always_trigger = false,
  -- floating_window_off_x = 1, -- adjust float windows x position.
  -- floating_window_above_cur_line = false,
  -- floating_window_off_y = 2,
  -- zindex = 49,
  -- support for function is only availabe in main
  -- floating_window_off_y = function()                 -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
  --   local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
  --   local pumheight = vim.o.pumheight
  --   local winline = vim.fn.winline()                 -- line number in the window
  --   local winheight = vim.fn.winheight(0)
  --   local delta = 4

  --   -- window top
  --   if winline - 1 < pumheight then
  --     return pumheight - delta
  --   end

  --   -- window bottom
  --   if winheight - winline < pumheight then
  --     return -pumheight + delta
  --   end
  --   return 0
  -- end,
  floating_window = false, -- disable to ensure it's not auto toggled by accident
  -- fix_pos = true
}

return M
