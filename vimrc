syntax on
set tabstop=4
set smartindent
set softtabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set incsearch
set laststatus=2
set number
set timeoutlen=200 ttimeoutlen=0
set noswapfile
set pastetoggle=<F3>
set cursorline
set scrolloff=8
set wildmode=longest,list,full
set colorcolumn=100
set noshowmode

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap S :%s//gc<Left><Left><Left>
nnoremap F :Vex<CR>
inoremap jj <Esc>

nnoremap <silent> ,<space> :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
nnoremap <silent> .<space> :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>

augroup WhiteSpace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_dirhistmax = 0

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = { 'colorscheme': 'onedark' }

if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
  augroup END
endif

colorscheme onedark
