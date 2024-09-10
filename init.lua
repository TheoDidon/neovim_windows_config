-- Plugins using vim-plug (you need vim-plug installed first)
vim.cmd([[
  call plug#begin('~/AppData/Local/nvim/plugged')

  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'lervag/vimtex'
  Plug 'navarasu/onedark.nvim'

  call plug#end()
]])

-- Load the OneDark theme
require('onedark').setup {
  style = 'dark' -- Options: 'dark', 'darker', 'cool', 'warm', 'warmer', 'light'
}
require('onedark').load()

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

-- Set backspace to work normally
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- VimTex settings
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'sumatrapdf'
vim.g.vimtex_view_sumatrapdf_exe = 'C:\\Users\\theod\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\SumatraPDF.lnk'
vim.g.vimtex_view_sumatrapdf_options = '-reuse-instance'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_quickfix_mode = 0

