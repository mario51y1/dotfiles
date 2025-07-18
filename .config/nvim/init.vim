"plugin stuff
call plug#begin()

Plug 'rebelot/kanagawa.nvim'                                        " Color scheme
Plug 'norcalli/nvim-colorizer.lua'                                  " see colors when defining them on files, for example #aabbff
Plug 'lukas-reineke/indent-blankline.nvim'                          " Show indent lines
Plug 'kyazdani42/nvim-tree.lua'                                     " File iew like vscode
Plug 'nvim-lualine/lualine.nvim'                                    " Status line
Plug 'windwp/nvim-autopairs'                                        " Auto write pairs
Plug 'folke/todo-comments.nvim'                                     " TODO highlighting
Plug 'tpope/vim-fugitive'                                           " GIT integration and stuff
Plug 'dstein64/vim-startuptime'
Plug 'folke/trouble.nvim'                                           " Errors and warnigns list
" Plug 'taketwo/vim-ros'                                              " ROS package

Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'                                       " Markdown Syntax

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'                                        " Auxiliar LUA functions, for telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }            " File finding 


Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}         " Syntax highlighting using treesitter
" Plug 'neoclide/coc.nvim', {'branch': 'release'}                     " Code completion 
Plug 'numToStr/Comment.nvim'                                        " Toggle coments using keybindings

Plug 'nvim-tree/nvim-web-devicons'                                 " optional, for file icons

Plug 'mechatroner/rainbow_csv'
" Plug 'vimwiki/vimwiki'                                              " Vim Wiki
Plug 'lervag/vimtex'

Plug 'neovim/nvim-lspconfig'                                        " Default/basic LSP configs

" Completion stuff
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Snippets with nvim-cmp
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'


" Plug 'github/copilot.vim'
Plug 'zbirenbaum/copilot.lua'
Plug 'zbirenbaum/copilot-cmp'

Plug 'olimorris/codecompanion.nvim'                                   " IA Companion

Plug 'lewis6991/gitsigns.nvim'                                       " Git signs

Plug 'olacin/telescope-gitmoji.nvim'

Plug 'RRethy/vim-illuminate'                                          " Mark all instances of current word in file

" MD preview, needs node.js
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'MeanderingProgrammer/render-markdown.nvim'


call plug#end()


" Avoid SSL CERT error
let g:copilot_proxy_strict_ssl = v:false

" By default, disable line wrapping for Markdown Preview
set nowrap

set nocompatible
set encoding=UTF-8
set termguicolors
set showmatch               " show matching 

set rtp+=/opt/homebrew/opt/fzf

set ignorecase              " case insensitive 
set mouse=a                 " middle-click paste with 

set hlsearch                " highlight search 
set incsearch               " incremental search
set hidden
vnoremap <C-c> "*y          " ctrl-c saves to cliboard in visual mode 

au BufNewFile,BufRead *.py
    \ set tabstop=4               " number of columns occupied by a tab 
    \ set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
    \ set expandtab               " converts tabs to white space
    \ set shiftwidth=4            " width for autoindents
    \ set autoindent              " indent a new line the same amount as the line just typed
    \ set fileformat=unix
    \ set foldmethod=indent
let g:python3_host_prog = '/usr/bin/python3'

au BufReadPost *.launch set syntax=xml                      " ros launch files
au BufReadPost *.razortemplate set syntax=yaml

au BufReadPost *.tf set filetype=hcl
autocmd BufEnter *.html :set ft=html
" au BufReadPost *.html set filetype=htmldjango.html

set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set shiftwidth=2
" Move 1 more lines up or down in normal and visual selection modes.
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim


" let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-yaml', 'coc-pyright', 'coc-snippets','coc-docker','coc-sql','coc-clangd','coc-sh', 'coc-xml', 'coc-powershell']

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
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" Nvimtree commands shortucts
nnoremap <leader>tt <cmd>NvimTreeFocus<cr>

lua require('plugins')
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

" inoremap <silent><expr> <TAB>
"   \ coc#pum#visible() ? coc#_select_confirm() :
"   \ coc#expandableOrJumpable() ?
"   \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ coc#refresh()

" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" 
" " Make <CR> to accept selected completion item or notify coc.nvim to format
" " <C-g>u breaks current undo, please make your own choice.
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" let g:coc_snippet_next = '<tab>'
" 
" nmap <leader>qf  <Plug>(coc-fix-current)

" COC CONF END 
" ---------------------------------------------------


:command Gitmoji lua require('telescope').extensions.gitmoji.gitmoji()

nnoremap <leader>xx <cmd>TroubleToggle<cr>
" nmap <silent> <leader>xx <cmd>call coc#rpc#request('fillDiagnostics', [bufnr('%')])<CR><cmd>Trouble loclist<CR>`
au filetype vimwiki silent! iunmap <buffer> <Tab>

"" Customize color
autocmd ColorScheme * hi CocMenuSel ctermbg=237 guibg=#13354A
colorscheme kanagawa
" This line has to be after colorscheme or it will be replaced
lua vim.cmd[[highlight IndentBlanklineContextChar guifg=#A3D4D6 gui=nocombine]]
