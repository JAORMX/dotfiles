
set title

" Turn on the WiLd menu
set wildmenu

set smartindent
set smarttab

"set shiftwidth=4 softtabstop=4
set tabstop=4 shiftwidth=4 expandtab
set incsearch ignorecase hlsearch


" Color trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Search options
set ignorecase
set smartcase
set hlsearch

" Mouse
set mouse=a

" line numbers
set number

" File encodings
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" Terminal colors
set t_Co=256
syntax on

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

autocmd BufNewFile,BufRead *.json set ft=javascript

" Pathogen plugin
execute pathogen#infect()

" 80 character line
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set colorcolumn=80

" line wrap
set tw=79

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" Delete trailing whitespace using <F5>
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
