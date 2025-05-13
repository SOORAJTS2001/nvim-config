require('rosh')
require('plugin')
vim.keymap.set('v', 'y', '"+y')  -- Copy to system clipboard
vim.keymap.set('n', 'p', '"+p')  -- Paste from clipboard
