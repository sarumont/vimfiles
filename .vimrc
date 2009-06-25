" misc
:set t_Co=256
:syntax on
:filetype on
:set viminfo='20,\"50
:set formatoptions=croql
:set autowrite
:set textwidth=100
:set nocompatible
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
:set noexpandtab
"if $USER == "richard"
    ":set expandtab
"else 
"endif

" Java shit
let java_allow_cpp_keywords=1
let java_highlight_all=1
let java_minlines=50

" JDK highlights
:hi javaNumber ctermfg=198
:hi javaC_JavaLang ctermfg=229
:hi javaR_JavaLang ctermfg=229
:hi javaLangObject ctermfg=252

" custom classes
:hi imClass ctermfg=229
:hi imExceptions ctermfg=204
:hi memVars ctermfg=243

"
" FG on these isn't necessarily correct - and the BG sucks with a /* */ or javadoc comment
"
"hi javaComment ctermfg=4 ctermbg=234
"hi javaCommentStar ctermfg=4 ctermbg=234
"hi javaLineComment ctermfg=4 ctermbg=234
"hi javaDocComment ctermfg=4 ctermbg=234
"hi javaCommentTitle ctermfg=4 ctermbg=234
"hi javaDocTags ctermfg=4 ctermbg=234
"hi javaDocParam ctermfg=4 ctermbg=234
"hi javaDocSeeTag ctermfg=4 ctermbg=234
"hi javaDocSeeTagParam ctermfg=4 ctermbg=234

:set softtabstop=4
:set noexpandtab

" misc
set wildmenu
:autocmd FileType xhtml,htm,html,dtd,xml,xml2,ant set shiftwidth=2 tabstop=2

" mouse
:set mouse=nv
:set mousehide

" keymappings

" easy comments
vnoremap  :s/^/\/\//
vnoremap  :s/^\/\///

":cmap bc Bclose
:map <F5> :set paste!<cr>
:map <F6> :set spell!<cr>
:map <F7> :set hlsearch!<cr>
:map <F8> :set wrap!<cr>

set laststatus=0

" NERDTree
:map <C-K> :NERDTreeToggle<cr>

:map <C-Tab> :tabnext<cr>
:map <C-S-Tab> :tabprev<cr>

" Status line
:set statusline=%F%m%r%h%w\ [%{&ff}\ \|\ %04l,%04v\ (%p%%)\ \|\ lines:\ %L]
:set laststatus=2
:hi StatusLine ctermfg=black ctermbg=181
:hi StatusLineNC ctermfg=black ctermbg=243

" tags
set tags=~/.tags

" folding 
"set nofen
"set fdl=1
function! JavaFold()
 setl foldmethod=syntax
 setl foldlevelstart=1
 syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
 syn match foldImports /\(\n\?import.\+;\n\)\+/ transparent fold

 function! FoldText()
   return substitute(getline(v:foldstart), '{.*', '{...}', '')
 endfunction
 setl foldtext=FoldText()
endfunction
"au FileType java call JavaFold()
"au FileType java setl fen
"hi Folded ctermfg=238 ctermbg=234


" vim-outliner
" TODO - try to switch back to old FT? 
"  let old_ft=:filetype 
:map <F12> :set ft=vo_base<cr>


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
:hi Search term=standout ctermfg=yellow cterm=underline,bold
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

filetype plugin indent on
