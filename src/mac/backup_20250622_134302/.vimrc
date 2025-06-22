syntax on
filetype on
set noswapfile
set cursorline
set cursorcolumn
highlight CursorLine ctermbg=LightGray cterm=NONE
highlight CursorColumn ctermbg=LightGray cterm=NONE
set number
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set nobackup
set hlsearch
set showmatch
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
