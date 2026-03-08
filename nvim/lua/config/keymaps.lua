local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Remap , as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

keymap("n", "<leader>2", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>3", ":NvimTreeFindFile<CR>", opts)
keymap("n", "<leader>rc", ':execute "set rtp+=" . getcwd()<CR>', opts)


vim.keymap.set("n", "<leader>dr", require'dap'.continue, { noremap = true })
vim.keymap.set('n', '<leader>db', require"dap".toggle_breakpoint, { noremap = true })

vim.keymap.set('n', '<leader>dc', require"dap".continue, { noremap = true })
vim.keymap.set('n', '<leader>do', require"dap".step_over, { noremap = true })
vim.keymap.set('n', '<leader>di', require"dap".step_into, { noremap = true })
vim.keymap.set('n', '<leader>rc', require"dap".reverse_continue, { noremap = true })


vim.keymap.set('n', '<leader>dw', function()
  local widgets = require"dap.ui.widgets"
  widgets.hover()
end)

vim.keymap.set('n', '<leader>df', function()
  local widgets = require"dap.ui.widgets"
  widgets.centered_float(widgets.frames)
end)


-- desc = 'Launch Lua adapter',
vim.keymap.set('n', '<leader>dl', function() 
  require"osv".launch({port = 8086}) 
end, { noremap = true })

