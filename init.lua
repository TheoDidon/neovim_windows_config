-- Charger lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "\\lazy\\lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Dernière version stable
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Configurer lazy.nvim
require("lazy").setup({
    'tpope/vim-sensible',
    'tpope/vim-surround',
    'vim-airline/vim-airline',
    'rafi/awesome-vim-colorschemes',
    {
        'lervag/vimtex',
        ft = 'tex',

    },
    {
        'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup {
                style = 'warmer' -- Options: 'dark', 'darker', 'cool', 'warm', 'warmer', 'light'
            }
            require('onedark').load()
        end,
    },
    {
        'wolandark/vim-live-server',
        ft = 'html',
        cmd = { "LiveServerStart", "LiveServerStop" },
        build = "npm install -g live-server",
    },
    {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
    },
})


-- Classic sets
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.errorbells = false
vim.opt.ffs = 'unix,dos,mac'
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.wrap = false
vim.opt.shiftround = true

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

-- Ignore compatibility with vi
vim.opt.compatible = false

-- Leader definition
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remaps
vim.api.nvim_set_keymap('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>"', 'viw<esc>a"<esc>bi"<esc>lel', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>\'', 'viw<esc>a\'<esc>bi\'<esc>lel', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>(', 'viw<esc>a)<esc>bi(<esc>lel', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>[', 'viw<esc>a]<esc>bi[<esc>lel', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>{', 'viw<esc>a}<esc>bi{<esc>lel', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>v', '<c-v>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>;', 'A;<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<cr>', 'o<esc>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', 'kj', '<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<c-u>', '<Esc>viwUea', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<esc>', '<Nop>', { noremap = true, silent = true })

-- Operator-pending mappings
vim.api.nvim_set_keymap('o', 'in(', ':<c-u>normal! f(vi(<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'in[', ':<c-u>normal! f[vi[<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'in{', ':<c-u>normal! f{vi{<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'in>', ':<c-u>normal! f>lvf<h<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'in"', ':<c-u>normal! f"vi"<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'in\'', ':<c-u>normal! f\'vi\'<cr>', { noremap = true, silent = true })

-- Abbreviations
vim.cmd([[iabbrev @@ theo.didon@gmail.com]])

-- Autocommands
vim.cmd([[
autocmd BufWritePre,BufRead *.html,*.css,*.js,*.c,*.cpp,*.py normal gg=G
autocmd Filetype c,cpp,javascript,css nnoremap <leader>c I//<esc>
autocmd Filetype c,cpp,javascript,css nnoremap <leader>uc I<esc>lxx<esc>
autocmd Filetype python nnoremap <leader>c I#<esc>
autocmd Filetype python nnoremap <leader>uc I<esc>lx<esc>
]])

-- C/C++ autocmds
vim.cmd([[
autocmd Filetype c,cpp nnoremap <leader>inc i#include ""<esc>i
autocmd Filetype c,cpp nnoremap <leader>INC i#include <><esc>i
autocmd Filetype c,cpp iabbrev iost #include <iostream>
autocmd Filetype c,cpp iabbrev ivec #include <vector>
autocmd Filetype c,cpp iabbrev ndef #ifndef
autocmd Filetype c,cpp iabbrev def #define
autocmd Filetype c,cpp nnoremap printf iprintf("\n");<esc>hhhhi
autocmd Filetype cpp iabbrev cout std::cout <<
autocmd Filetype cpp iabbrev cin std::cin >>
autocmd Filetype cpp iabbrev cerr std::cerr
autocmd Filetype cpp iabbrev endl << std::endl;
autocmd Filetype cpp iabbrev str std::string
autocmd Filetype cpp iabbrev vector std::vector<
autocmd Filetype cpp iabbrev fstr std::fstream
autocmd Filetype cpp iabbrev imath #include <cmath>
autocmd Filetype c iabbrev iost #include <stdio.h>
autocmd Filetype c iabbrev std #include <stdlib.h>
autocmd Filetype c iabbrev imath #include <math.h>
autocmd Filetype c iabbrev istr #include <string.h>
autocmd Filetype c inoremap wmain int main(int argc, char* argv[]){<cr><cr><cr>return 0;<cr>}
]])

-- Python autocmds
vim.cmd([[
autocmd Filetype python iabbrev npy import numpy as np
autocmd Filetype python iabbrev pandas import pandas as pd
autocmd Filetype python iabbrev seab import seaborn as sb
]])

-- Javascript autocmd
vim.cmd([[
autocmd Filetype javascript iabbrev log console.log(
]])

-- Html autocmd
vim.cmd([[
autocmd Filetype html nnoremap <leader>d i<div class=""><cr><cr></div><esc>k
autocmd Filetype html nnoremap <leader>p i<p><cr><cr></p><esc>k
autocmd Filetype html nnoremap <leader>h i<!DOCTYPE html><cr><html><cr><head><cr><meta charset="UTF-8"><cr><meta name="viewport" content="width=device-width, initial-scale=1.0"><cr><title>Document</title><cr></head><cr><body><cr><cr></body><cr></html><esc>
autocmd Filetype html nnoremap <leader>link i<link href="changeme" rel="changeme"><esc>
]])

-- Set backspace to work normally
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- VimTex settings
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'general'
vim.g.vimtex_view_general_viewer = 'C:\\Users\\theod\\AppData\\Local\\Programs\\MiKTeX\\miktex\\bin\\x64\\texworks.exe'
vim.g.vimtex_quickfix_mode = 0

-- Telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

