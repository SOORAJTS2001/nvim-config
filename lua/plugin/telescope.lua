local builtin = require('telescope.builtin')
local telescope_state = require('telescope.state')
local last_search = nil

require('telescope').load_extension('fzf')

function search_with_cache()
    if last_search == nil then
        builtin.live_grep()

        local cached_pickers = telescope_state.get_global_key "cached_pickers" or {}
        last_search = cached_pickers[1]
    else
        builtin.resume({ picker = last_search })
    end
end

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})

--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
