local keymap = vim.keymap

keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')
keymap.set('n', '<A-k>', '<C-y>')
keymap.set('n', '<A-j>', '<C-e>')

-- Gitsigns
keymap.set('n', '<leader>gn', '<cmd>Gitsigns next_hunk<cr>', { desc = 'Next hunk' })
keymap.set('n', '<leader>gp', '<cmd>Gitsigns prev_hunk<cr>', { desc = 'Previous hunk' })

-- Neotree
keymap.set('n', '<leader>e', '<cmd>Neotree right toggle<cr>', { desc = 'Neotree toggle' })
keymap.set('n', '<leader>o', '<cmd>Neotree right reveal toggle<cr>', { desc = 'Neotree reveal' })

-- Create a session with mini.sessions
keymap.set('n', '<leader>Sw', '<Cmd>lua MiniSessions.write(vim.fn.input("Session Name > "))<CR>')

EnableTransparency = false

vim.keymap.set('n', '<leader>ub', function()
  if EnableTransparency == true then
    EnableTransparency = false
  else
    EnableTransparency = true
  end
  local odp = require 'onedarkpro'
  odp.setup {
    options = {
      transparency = EnableTransparency,
    },
  }
  vim.cmd.colorscheme 'onedark'
end, { desc = 'Toggle transparency' })
