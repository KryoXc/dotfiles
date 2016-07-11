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

let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=232 guibg=#2c2d27

set listchars=tab:>-,trail:-

nnoremap <Leader>w :set list!<CR>


function! ConditionalPairMap(open, close)
    let line = getline('.')
    let col = col('.')
    if col < col('$') || stridx(line, a:close, col + 1) != -1
        return a:open
    else
        return a:open . a:close . repeat("\<left>", len(a:close))
    endif
endf

function! IgnoreClosingPairMap(close)
    if matchstr(getline('.'),'\%' . col('.') . 'c.') == a:close
        return "\<Right>"
    else
        return a:close . "\<Right>"
    endif
endf 


"remap Conditional Pair Mappings
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> [ ConditionalPairMap('[', ']')

"remap ignore Closing Brace Mappings
inoremap <expr> ) IgnoreClosingPairMap(')')
inoremap <expr> } IgnoreClosingPairMap('}')
inoremap <expr> ] IgnoreClosingPairMap(']')

"inoremap <expr> ) strpart(getline('.'),col('.')-1,1) ++ ")" ? "\<Right>" : ")"
