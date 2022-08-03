"plugin stuff
call plug#begin()
Plug 'rebelot/kanagawa.nvim'                                        " Color scheme
Plug 'norcalli/nvim-colorizer.lua'                                  " see colors when defining them on files, for example #aabbff
Plug 'lukas-reineke/indent-blankline.nvim'                          " Show indent lines
Plug 'kyazdani42/nvim-tree.lua'                                     " File iew like vscode
Plug 'nvim-lualine/lualine.nvim'                                    " Status line
Plug 'windwp/nvim-autopairs'                                        " Auto write pairs

Plug 'nvim-lua/plenary.nvim'                                        " Auxiliar LUA functions, for telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }            " File finding 

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}         " Syntax highlighting using treesitter

Plug 'neoclide/coc.nvim', {'branch': 'release'}                     " Code completion 
Plug 'numToStr/Comment.nvim'                                        " Toggle coments using keybindings

Plug 'ryanoasis/vim-devicons'                                       " File icons
Plug 'kyazdani42/nvim-web-devicons'                                 " optional, for file icons
call plug#end()

set encoding=UTF-8
set termguicolors
set showmatch               " show matching 

set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 

set hlsearch                " highlight search 
set incsearch               " incremental search
set hidden
au BufNewFile,BufRead *.py
    \ set tabstop=4               " number of columns occupied by a tab 
    \ set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
    \ set expandtab               " converts tabs to white space
    \ set shiftwidth=4            " width for autoindents
    \ set autoindent              " indent a new line the same amount as the line just typed
    \ set fileformat=unix
    \ set foldmethod=indent
let g:python3_host_prog = '/usr/bin/python3'

set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set shiftwidth=4

set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim

let g:pymode_options_max_line_length = 94 
set noswapfile              " disable creating swap file

"fold key moved to space
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
nnoremap <space> za
set foldlevelstart=99

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" ---------------------------------------------------
" COC CONF START
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
let g:coc_snippet_next = '<tab>'

" COC CONF END 
" ---------------------------------------------------

lua require('plugins')
colorscheme kanagawa
" This line has to be after colorscheme or it will be replaced
lua vim.cmd[[highlight IndentBlanklineContextChar guifg=#A3D4D6 gui=nocombine]]


