" misc
":set t_Co=256
:syntax on
:filetype on
:set viminfo='20,\"50
:set formatoptions=croql
:set autowrite
:set textwidth=80
:set nohlsearch
:set incsearch
:set title
:set showmatch
:set matchtime=1
:set bs=2

" Indention
:set autoindent
:filetype indent on 

" tab spacing
:set shiftwidth=4
:set tabstop=4
:set expandtab
":set tabstop=4
":set noexpandtab

:autocmd FileType xhtml,htm,html,xml,xml2,ant set shiftwidth=2 tabstop=2

" mouse
:set mouse=nv
:set mousehide

" easy comments
vnoremap  :s/^/\/\//
vnoremap  :s/^\/\///
 
" utility functions
:map <F5> :set paste!<cr>
:map <F6> :set spell!<cr>
:map <F7> :set hlsearch!<cr>
:map <F8> :set wrap!<cr>

" Java shit
let java_allow_cpp_keywords=1
let java_minlines=50

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif



""""""""""
" Colors "
""""""""""
" search and incremental search colors
:hi clear Search
:hi Search term=standout ctermfg=yellow term=underline cterm=underline
:hi clear IncSearch
:hi IncSearch term=standout ctermfg=yellow term=underline cterm=underline

" Matching Parenthesis highlighting
:hi MatchParen ctermbg=black
:hi Pmenu ctermbg=black
:hi PmenuSel ctermfg=black ctermbg=blue

" spell checking
:hi clear SpellBad
:hi SpellBad term=standout ctermfg=darkred term=underline cterm=underline
:hi clear SpellCap
:hi SpellCap term=standout ctermfg=lightgreen term=underline cterm=underline
:hi clear SpellRare
:hi SpellRare term=standout ctermfg=blue term=underline cterm=underline
:hi clear SpellLocal
:hi SpellLocal term=standout ctermfg=cyan term=underline cterm=underline

