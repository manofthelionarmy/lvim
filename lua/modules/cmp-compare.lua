local M = {}
-- Got it from here:
-- https://github.com/tjdevries/config_manager/blob/78608334a7803a0de1a08a9a4bd1b03ad2a5eb11/xdg_config/nvim/after/plugin/completion.lua#L138
local function tjs_compare(entry1, entry2)
  local _, entry1_under = entry1.completion_item.label:find "^_+"
  local _, entry2_under = entry2.completion_item.label:find "^_+"
  entry1_under = entry1_under or 0
  entry2_under = entry2_under or 0
  if entry1_under > entry2_under then
  return false
  elseif entry1_under < entry2_under then
  return true
  end
end

local cmp = require('cmp')
-- found this on reddit, this really helped me :)
local compare = require('cmp.config.compare')
local comparators = {
  -- compare.score_offset, -- not good at all
  -- compare.order, -- Put order first, preselect selects first in alphanumeric order
  compare.offset,
  compare.exact,
  compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
  tjs_compare,
  -- compare.locality,
  -- NOTE: disable recently_used
  -- compare.recently_used, -- disable this
  -- compare.scopes, -- what?
  -- compare.sort_text,
  -- compare.kind,
  -- compare.sort_text,
  -- compare.length, -- useless
  compare.order,
}

M.comparators = comparators
return M
