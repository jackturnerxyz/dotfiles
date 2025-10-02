-- init.lua or lua/plugins.lua

-- Plugin manager setup (packer example)
require("packer").startup(function(use)
  use "wbthomason/packer.nvim"       -- packer manages itself
  use "junegunn/goyo.vim"            -- goyo for distraction-free mode
  use 'mattn/emmet-vim'
  use 'projekt0n/github-nvim-theme'
  use {'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }}
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
  use {
    'MeanderingProgrammer/render-markdown.nvim',
    as = 'render-markdown',
    after = { 'nvim-treesitter' },
    requires = { 'nvim-mini/mini.nvim' },
    opt = false }
end)

-- Keybindings for Goyo
vim.keymap.set("n", "<leader>gy", ":Goyo<CR>", { noremap = true, silent = true, desc = "Toggle Goyo" })

-- Optional: auto-center text when entering/leaving Goyo
vim.api.nvim_create_autocmd("User", {
  pattern = "GoyoEnter",
  callback = function()
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt.signcolumn = "no"
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "GoyoLeave",
  callback = function()
    vim.opt.wrap = false
    vim.opt.linebreak = false
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.signcolumn = "yes"
  end,
})
vim.cmd('colorscheme github_dark')
vim.opt.swapfile = false
vim.g.mapleader = " "

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = 'Telescope man pages' })

vim.keymap.set('n', '<leader>rm', '<cmd>RenderMarkdown buf_toggle<cr>')
require('lualine').setup()
