" misc
:set t_Co=256
:syntax on
:filetype on
:set viminfo='20,\"50
:set formatoptions=croql
:set autowrite
:set nocompatible
:set textwidth=100
:set nohlsearch
:set incsearch
:set showmatch
:set matchtime=1
:set bs=2

" title string
set titlestring=vim\ %<%F%(\ %)%m%h%w%=%l/%L-%P
set titlelen=70
if &term == "screen"
	set t_ts=k
	set t_fs=\
endif
if &term == "screen" || &term == "xterm" 
	set title
endif

" Indention
set autoindent
filetype plugin indent on

" tab spacing
:set shiftwidth=4
:set tabstop=4
:set softtabstop=4
:set noexpandtab
"if $USER == "richard"
    ":set expandtab
"else 
"endif

" SQL shit
let g:omni_sql_no_default_maps = 1

" Java shit
let java_allow_cpp_keywords=1
let java_highlight_all=1
let java_minlines=50

" JDK highlights
:hi javaNumber ctermfg=198
:hi javaC_JavaLang ctermfg=229
:hi javaR_JavaLang ctermfg=229
:hi javaLangObject ctermfg=252
:hi javaStatement ctermfg=202
:hi javaExceptions ctermfg=124
:hi javaConditional ctermfg=127
:hi javaRepeat ctermfg=127
:hi javaScopeDecl ctermfg=41
:hi javaType ctermfg=35

" custom classes
:hi imClass ctermfg=229
:hi imExceptions ctermfg=204
:hi memVars ctermfg=243

" window navigation
:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-l> :wincmd l<CR>

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

" misc
set wildmenu
:autocmd FileType xhtml,htm,html,dtd,xml,xml2,xsd,ant set shiftwidth=2 tabstop=2

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
:map <C-I> :NERDTreeToggle<cr>

:map <C-Tab> :tabnext<cr>
:map <C-S-Tab> :tabprev<cr>

" Status line
:set statusline=%t%m%r%h%w\ [%{&ff}\ \|\ %04l,%04v\ (%p%%)\ \|\ lines:\ %L]
:set laststatus=2
:hi StatusLine cterm=none ctermfg=186 ctermbg=236
:hi StatusLineNC cterm=none ctermfg=108 ctermbg=236


" current/cursor line
if v:version > 700
	"set cursorline
	"hi CursorLine cterm=none ctermbg=233
endif

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

" Function for enabling embedded syntax highlighting.  Usage: 
"	:call TextEnableCodeSnip( 'javascript', '<!\[CDATA\[', '\]\]>', 'SpecialComment' )
"
function! TextEnableCodeSnip( filetype, start, end, textSnipHl ) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

" Laszlo javascript highlighting
au BufRead,BufNewFile *.lzx call TextEnableCodeSnip( 'javascript', '<!\[CDATA\[', '\]\]>', 'SpecialComment' )

au BufWinEnter,BufRead,BufNewFile *.java,*.c,*.cpp,*.js,*.html,*.htm,*.xml,*.lzx let w:m1=matchadd( 'Error', '\s\{2,}$', -1)
"au BufWinEnter,BufRead,BufNewFile *.java,*.c,*.cpp,*.js,*.html,*.htm,*.xml,*.lzx set noexpandtab
au BufWinEnter,BufRead,BufNewFile *.java,*.c,*.cpp,*.js :exec CodeInit()

fu! CodeInit()
	set noexpandtab
	set shiftwidth=4
	set tabstop=4
	set softtabstop=4
endfu

" JavaBrowser
au VimEnter * let JavaBrowser_Ctags_Cmd="/usr/local/bin/exctags"
au VimEnter * let Javabrowser_Use_Icon=1

" omnicomplete (javacomplete)
imap <Nul> <Space>
autocmd Filetype java let g:vjde_lib_path='/home/sarumont/nuvos/nuvos.jar'
autocmd Filetype art set expandtab

"define :HighlightLongLines command to highlight the offending parts of
"lines that are longer than the specified length (defaulting to 80)

command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
function! s:HighlightLongLines(width)
	let targetWidth = a:width != '' ? a:width : 99
	if targetWidth > 0
		exec 'match Todo /\%>' . (targetWidth) . 'v/'
	else
		echomsg "Usage: HighlightLongLines [natural number]"
	endif
endfunction
:map <F4> :HighlightLongLines<cr>

let NERDTreeWinSize=42
