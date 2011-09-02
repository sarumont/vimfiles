:filetype off
" Pathogen to manage packages/plugins
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags() # being called in update_bundles

" misc
:autocmd!
:set t_Co=256
:syntax on
:filetype plugin indent on
:set viminfo='100,\"50,:20
:set formatoptions=croql
:set autowrite
:set nocompatible
:set textwidth=100
:set bs=2

" fugitive
:nnoremap <silent> <Leader>gd :Gdiff<cr>
:nnoremap <silent> <Leader>gl :Glog<cr>
:nnoremap <silent> <Leader>gs :Gstatus<cr>
:nnoremap <silent> <Leader>gb :Gblame<cr>
:nnoremap <silent> <Leader>gc :Gcommit<cr>
:nnoremap <silent> <Leader>GC :Git svn dcommit<cr>

" Search
:set nohlsearch
:set incsearch
:set ignorecase
:set smartcase

" MultipleSearch
:nmap <C-_> :Search 
:nmap <C-Bslash> :SearchReset<cr>
:let g:MultipleSearchColorSequence="232,232,232,232"
:let g:MultipleSearchTextColorSequence="51,105,199,228"

" paren matching
:set showmatch
:set matchtime=1

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

:map <Leader>a :silent !screener.sh<CR>;

" Java building
autocmd BufRead *.java set makeprg=/compat/i386/usr/local/bin/ant\ -q
autocmd BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

" nuvos building
:map <Leader>nn :make -f ~/dev/nuvos/build.xml<CR>
:map <Leader>nc :make -f ~/dev/nuvos/core/build.xml<CR>
:map <Leader>ns :make -f ~/dev/nuvos/swa/build.xml<CR>
:map <Leader>ng :make -f ~/dev/nuvos/gwt/build.xml<CR>
:map <Leader>no :make -f ~/dev/nuvos/oo/build.xml<CR>
:map <Leader>nnc :make -f ~/dev/nuvos/build.xml clean<CR>:make -f ~/dev/nuvos/build.xml<cr>
:map <Leader>ncc :make -f ~/dev/nuvos/core/build.xml clean<CR>:make -f ~/dev/nuvos/core/build.xml<cr>
:map <Leader>nsc :make -f ~/dev/nuvos/swa/build.xml clean<CR>:make -f ~/dev/nuvos/swa/build.xml<cr>
:map <Leader>ngc :make -f ~/dev/nuvos/gwt/build.xml clean<CR>:make -f ~/dev/nuvos/gwt/build.xml<cr>
:map <Leader>noc :make -f ~/dev/nuvos/oo/build.xml clean<CR>:make -f ~/dev/nuvos/oo/build.xml<cr>

" ThinkTank building
:map <Leader>tt :make -f ~/dev/thinktank/build.xml<CR>
:map <Leader>tc :make -f ~/dev/thinktank/common/build.xml<CR>
:map <Leader>tl :make -f ~/dev/thinktank/client/build.xml<CR>
:map <Leader>td :make -f ~/dev/thinktank/docserver/build.xml<CR>
:map <Leader>ts :make -f ~/dev/thinktank/server/build.xml<CR>
:map <Leader>tu :make -f ~/dev/thinktank/ui/build.xml<CR>
:map <Leader>tm :make -f ~/dev/thinktank/manager/build.xml<CR>
:map <Leader>ttc :make -f ~/dev/thinktank/build.xml clean<CR>:make -f ~/dev/thinktank/build.xml<cr>
:map <Leader>tcc :make -f ~/dev/thinktank/common/build.xml clean<CR>:make -f ~/dev/thinktank/common/build.xml<cr>
:map <Leader>tdc :make -f ~/dev/thinktank/docserver/build.xml clean<CR>:make -f ~/dev/thinktank/docserver/build.xml<cr>
:map <Leader>tlc :make -f ~/dev/thinktank/client/build.xml clean<CR>:make -f ~/dev/thinktank/client/build.xml<cr>
:map <Leader>tsc :make -f ~/dev/thinktank/server/build.xml clean<CR>:make -f ~/dev/thinktank/server/build.xml<cr>
:map <Leader>tuc :make -f ~/dev/thinktank/ui/build.xml clean<CR>:make -f ~/dev/thinktank/ui/build.xml<cr>
:map <Leader>tmc :make -f ~/dev/thinktank/manager/build.xml clean<CR>:make -f ~/dev/thinktank/manager/build.xml<cr>

" easy quickfix nav
:map <Leader>e :cn<cr>zz<cr>:set cursorline<cr>:sleep 100m<cr>:set nocursorline<cr>:cc<cr>
:map <Leader>p :cp<cr>
:map <Leader>l :clist<cr>

:cmap bk BookmarkToRoot 

" Don't use Ex mode, use Q for formatting
map Q gq

" tab spacing
:set shiftwidth=4
:set tabstop=4
:set softtabstop=4
:set noexpandtab

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
:hi memVars ctermfg=247

" Diff highlights
:hi DiffAdd ctermbg=31
:hi DiffText ctermbg=196
:hi DiffChange ctermbg=141
:hi DiffDelete ctermbg=237

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

" mouse
:set mouse=nv
:set mousehide

" keymappings

" easy comments
vnoremap  :s/^/\/\//
vnoremap  :s/^\/\///

" Scratch
:nnoremap <silent> <Leader>s :Sscratch<cr>

" YankRing
:nnoremap <silent> <Leader>yr :YRShow<cr>
:let g:yankring_history_file='.yankring_history'

" Mappings to switch PWD between codebases for git-vim
:nnoremap <silent> <Leader>cdn :cd ~/dev/nuvos<cr>
:nnoremap <silent> <Leader>cdtt :cd ~/dev/thinktank<cr>

":cmap bc Bclose
:map <silent> <leader>w :set cursorline<cr>:sleep 250m<cr>:set nocursorline<cr>
:map <F5> :set paste!<cr>
:map <F6> :set spell!<cr>
:map <Leader>h :set hlsearch!<cr>
:map <F8> :set wrap!<cr>
:map <F9> o@nuvos.system.annotations.GwtSafe

" NERDTree
:map <C-I> :NERDTreeToggle<cr>

:map <C-Tab> :tabnext<cr>
:map <C-S-Tab> :tabprev<cr>

" Status line
set statusline=%t%m%r%h%w\ [%{&ff}\ \|\ %04l,%04v\ (%p%%)\ \|\ lines:\ %L]\ %{fugitive#statusline()}
set laststatus=2
hi StatusLine cterm=none ctermfg=186 ctermbg=236
hi StatusLineNC cterm=none ctermfg=240 ctermbg=234

" current/cursor line
hi CursorLine cterm=none ctermbg=243
set nocursorline

" tags
set tags=~/.tags

" folding 
set nofen
"set fdl=1
"set foldmethod=indent
"set foldlevelstart=1
"set foldlevel=1
"set foldminlines=5
"function! JavaFold()

	"setl foldmethod=syntax
	"setl foldlevelstart=1

	"syn clear javaBraces
	"syn clear javaDocComment

	"" set up folding for brace-delimited blocks, javadoc and imports
	"syn region javaBraces start="{" end="}" transparent fold
	"syn region javaDocComment start="/\*\*" end="\*/" keepend contains=javaCommentTitle,@javaHtml,javaDocTags,javaDocSeeTag,javaTodo,@Spell fold
	"syn match foldImports /\(\n\?import.\+;\n\)\+/ transparent fold

	"" add number of lines folded to the fold's text
	"function! Num2S(num, len)
		"let filler = "                                                            "
		"let text = '' . a:num
		"return strpart(filler, 1, a:len - strlen(text)) . text
	"endfunction

	"function! FoldText()
		"let sub = substitute(getline(v:foldstart), '/\*\|\*/\|{{{\d\=', '', 'g')
		"let diff = v:foldend - v:foldstart + 1
		"return  '+' . v:folddashes . '[' . Num2S(diff,3) . ']' . sub
	"endfunction
	"setl foldtext=FoldText()

"endfunction
""au FileType java call JavaFold()
"au FileType java setl fen
hi Folded ctermfg=27 ctermbg=232

" vim-outliner
" TODO - try to switch back to old FT? 
"  let old_ft=:filetype 
:map <F12> :set ft=vo_base<cr>

""""""""""
" Colors "
""""""""""
" visual mode selection
":hi Visual ctermfg=237 ctermbg=249
:hi Visual ctermbg=18

" search and incremental search colors
:hi clear Search
:hi Search term=standout ctermfg=yellow cterm=underline,bold
:hi clear IncSearch
:hi IncSearch term=standout ctermfg=yellow term=underline cterm=underline

" Matching Parenthesis highlighting
:hi MatchParen ctermbg=242
:hi Pmenu ctermfg=white ctermbg=234
:hi PmenuSel ctermfg=white ctermbg=33

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

"define :HighlightLongLines command to highlight the offending parts of
"lines that are longer than the specified length (defaulting to 80)
:hi LongLines term=standout ctermfg=red cterm=underline
fu! s:HighlightLongLines(width)
	let targetWidth = a:width != '' ? a:width : 100
	if targetWidth > 0
		exec 'match LongLines /\%>' . (targetWidth) . 'v/'
	else
		echomsg "Usage: HighlightLongLines [natural number]"
	endif
endfunction

fu! CodeInit()
	set noexpandtab
	set shiftwidth=4
	set tabstop=4
	set softtabstop=4
	call s:HighlightLongLines(100)
endfu

" omnicomplete (javacomplete)
imap <Nul> <Space>
let NERDTreeWinSize=42
let NERDTreeHighlightCursorline=0

""""" Autocommands 

:au Filetype java let g:vjde_lib_path='/home/sarumont/nuvos/nuvos.jar'
:au Filetype art set expandtab
:au FileType xhtml,htm,html,dtd,xml,xml2,xsd,ant set shiftwidth=2 tabstop=2

" Laszlo javascript highlighting
:au BufRead,BufNewFile *.lzx call TextEnableCodeSnip( 'javascript', '<!\[CDATA\[', '\]\]>', 'SpecialComment' )

" trailing space highlighting
:au BufWinEnter,BufRead,BufNewFile *.java,*.c,*.cpp,*.js,*.html,*.htm,*.xml,*.lzx let w:m1=matchadd( 'Error', '\s\{2,}$', -1)

:au BufWinEnter,BufRead,BufNewFile *.java,*.c,*.cpp,*.js,*.py :call CodeInit()

" JavaBrowser
:au VimEnter * let JavaBrowser_Ctags_Cmd="/usr/local/bin/exctags"
:au VimEnter * let Javabrowser_Use_Icon=1

" lesscss
au BufNewFile,BufRead *.less set filetype=less


" When editing a file, always jump to the last cursor position
:au BufReadPost *
			\ if &ft == 'gitcommit' |
			\   exe "normal! gg" |
			\   exe "startinsert" |
			\ elseif line("'\"") > 1 && line ("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

" fluffing Uwe/Tara code
:vnoremap <leader>fr :s/\([0-9A-Za-z]\))/\1 )/<cr>
:vnoremap <leader>fl :s/(\([0-9A-Za-z]\)/( \1/<cr>
:vnoremap <leader>fa :s/(\([0-9A-Za-z\, ."]\+\))/( \1 )/<cr>

" eclim
set cot=menu
