call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set t_Co=256

colorscheme wombat256

if has("gui_running")
    " Remove Toolbar
    set guioptions-=T
    set guifont=Dejavu\ Sans\ Mono\ 14
    colorscheme pyte
endif

cmap w!! %!sudo tee > /dev/null %
filetype plugin on
filetype plugin indent on
syntax enable


" Show invisible symbols
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>


" Default indentation level
set expandtab shiftwidth=4 softtabstop=4 tabstop=4

" Only do this part when compiled with support for autocommands
if has("autocmd")
    " Enable file type detection
    filetype on
    autocmd FileType c,cpp,slang setlocal expandtab shiftwidth=4 softtabstop=4
    autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
    autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Customisations based on house-style (arbitrary)
    autocmd FileType xhtml,html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

endif

