require('leap').create_default_mappings()
require('leap').opts.highlight_unlabeled_phase_one_targets = true

-- This scrolls to to ensure we're at the center of the screen after we exit leap
vim.api.nvim_create_autocmd('User', {
  pattern = 'LeapLeave',
  command = 'normal! zz',
})
