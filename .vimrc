set nu
syn enable
set background=dark

set ruler

set tabstop=4
set expandtab
set copyindent
set preserveindent
set softtabstop=4
set shiftwidth=4

set splitbelow
set splitright

"Add side divider to attempt to keep under 80 columns
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=232 guibg=#2c2d27

"Fix tab complete coloring
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
hi Error ctermbg=NONE ctermfg=131 guibg=NONE guifg=#af5f5f cterm=reverse gui=reverse

"Macro to show whitespace characters
set listchars=tab:>-,trail:-
nnoremap <Leader>w :set list!<CR>

" Enable plugins
" autocmd FileType python delimitMate
" autocmd FileType python compiler pylint

call pathogen#infect()


filetype plugin indent on
