:set nocompatible
:filetype off

" Pathogen to manage packages/plugins
exec pathogen#infect()

" misc
:autocmd!
:set t_Co=256
:syntax on
:filetype plugin on
:filetype plugin indent on
:set viminfo='100,\"50,:20
:set formatoptions=croql
:set autowrite
:set textwidth=100
:set bs=2
set so=7
let mapleader = ","
let g:mapleader = ","
set hidden
set wildmenu
set wildignore=*/generated/*,.git,*.pyc,.svn,*.jar,*.class,*.un~,*.swp,*.swo
set undofile

set background=dark
let g:zenburn_high_Contrast = 1
let g:zenburn_old_Visual = 1
colorscheme zenburn

" ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column --smart-case --ignore-dir=war --ignore-dir=release"
:nnoremap <silent> <Leader>a :Ack 

" fugitive
:nnoremap <silent> <Leader>gd :Gdiff<cr>
:nnoremap <silent> <Leader>gl :Glog<cr>
:nnoremap <silent> <Leader>gs :Gstatus<cr>
:nnoremap <silent> <Leader>gb :Gblame<cr>
:nnoremap <silent> <Leader>gc :Gcommit<cr>
:nnoremap <silent> <Leader>GC :Git svn dcommit<cr>
:nnoremap <silent> <Leader>GR :Git svn rebase<cr>:CommandTFlush<cr>
:nnoremap <silent> <Leader>amend :Git commit --amend<cr>
:nnoremap <silent> <Leader>stash :Git stash<cr>
:nnoremap <silent> <Leader>pop :Git stash pop<cr>

" Gist
let g:gist_clip_command = 'xclip -selection clipboard'


" JDK switching
:nnoremap <silent> <Leader>jdk6 :let $JAVA_HOME = '/usr/lib/jvm/java-6-openjdk-i386'<cr>
:nnoremap <silent> <Leader>jdk7 :let $JAVA_HOME = '/usr/lib/jvm/java-7-openjdk-i386'<cr>

" gundo
:nnoremap <silent> <leader>gun :GundoToggle<cr>

" Command-T
nnoremap <silent> <Leader><Leader> :CommandT<CR>
nnoremap <silent> <Leader>ctf :CommandTFlush<CR>
let g:CommandTAcceptSelectionSplitMap=['<C-g>', '<C-o>']
let g:CommandTMaxFiles=1000000

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

" UtilSnip
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"] 
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" paren matching
:set showmatch
:set matchtime=1
hi MatchParen ctermbg=63

" title string
"set titlestring=vim\ %<%F%(\ %)%m%h%w%=%l/%L-%P
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
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

" Java building
autocmd BufRead *.java set makeprg=ant\ -q
autocmd BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

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
autocmd BufRead *.java nnoremap <silent> <Leader>o o@Override<esc>

" window navigation
:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-l> :wincmd l<CR>

" mouse
:set mouse=nv
:set mousehide

""""""""""""""""""""""""""""""""""""""""
" keymappings
""""""""""""""""""""""""""""""""""""""""

" Scratch
:nnoremap <silent> <Leader>s :Sscratch<cr>

" YankRing
:nnoremap <silent> <Leader>yr :YRShow<cr>
:let g:yankring_history_file='.yankring_history'

":cmap bc Bclose
:map <silent> <leader>w :set cursorline<cr>:sleep 250m<cr>:set nocursorline<cr>
:map <F5> :set paste!<cr>
:map <F6> :set spell!<cr>
:map <Leader>h :set hlsearch!<cr>
:map <F8> :set wrap!<cr>

" NERDTree
:map <C-I> :NERDTreeToggle<cr>

:map <C-Tab> :tabnext<cr>
:map <C-S-Tab> :tabprev<cr>

" Status line
set statusline=%t%m%r%h%w\ [%{&ff}\ \|\ %04l,%04v\ (%p%%)\ \|\ lines:\ %L]\ %{fugitive#statusline()}
set laststatus=2
"hi StatusLine cterm=none ctermfg=15 ctermbg=11
"hi StatusLineNC cterm=none ctermfg=0 ctermbg=11

" current/cursor line
hi CursorLine cterm=none ctermbg=15
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
"hi Folded ctermfg=27 ctermbg=232

" vim-outliner
" TODO - try to switch back to old FT? 
"  let old_ft=:filetype 
:map <F12> :set ft=vo_base<cr>

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
hi LongLines term=standout ctermfg=red cterm=underline
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

" Sets build variables for Apache ant
fu! SetAnt()
	set makeprg=ant\ -q
	set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
endfu

" Sets build variables for Apache maven
fu! SetMaven()
	set makeprg=mvn\ -q
	set efm=%E\[ERROR\]\ %f:[%l\\,%c]\ error:\ %m,%-G%.%#
endfu

" omnicomplete (javacomplete)
imap <Nul> <Space>
let NERDTreeWinSize=42
let NERDTreeHighlightCursorline=0

""""" Autocommands 
:au FileType xhtml,htm,html,dtd,xml,xml2,xsd,ant set shiftwidth=2 tabstop=2

" Laszlo javascript highlighting
:au BufRead,BufNewFile *.lzx call TextEnableCodeSnip( 'javascript', '<!\[CDATA\[', '\]\]>', 'SpecialComment' )

" trailing space highlighting
:au BufWinEnter,BufRead,BufNewFile *.java,*.c,*.cpp,*.js,*.html,*.htm,*.xml,*.lzx let w:m1=matchadd( 'Error', '\s\{2,}$', -1)
:au BufWinEnter,BufRead,BufNewFile *.java,*.c,*.cpp,*.js,*.py :call CodeInit()

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

" DETECT FILE CHANGED, DAMMIT 
:au CursorHold *.java,*.c,*.cpp,*.js,*.html,*.htm,*.xml,*.py,*.less,*.css checktime " check file timestamp after inactivity for a while 
:au CursorHoldI *.java,*.c,*.cpp,*.js,*.html,*.htm,*.xml,*.py,*.less,*.css checktime " check file timestamp after inactivity for a while 
:au CursorMoved *.java,*.c,*.cpp,*.js,*.html,*.htm,*.xml,*.py,*.less,*.css checktime " check file timestamp after moving 
:au CursorMovedI *.java,*.c,*.cpp,*.js,*.html,*.htm,*.xml,*.py,*.less,*.css checktime " check file timestamp after moving 
:au InsertEnter *.java,*.c,*.cpp,*.js,*.html,*.htm,*.xml,*.py,*.less,*.css checktime " check file timestamp after entering insert mode 
:au FocusGained *.java,*.c,*.cpp,*.js,*.html,*.htm,*.xml,*.py,*.less,*.css checktime " check file timestamp after gaining focus (usually doesn't work) 
:au WinEnter *.java,*.c,*.cpp,*.js,*.html,*.htm,*.xml,*.py,*.less,*.css checktime " check file timestamp after entering insert mode

" multimon support
source ~/.vim/bundle/vim-multiple-monitors/multimonitor.vim

" session management
function! MakeSession()
  if ! exists("v:servername")
  	return
  endif
  let b:sessiondir = $HOME . "/.vim/sessions"
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/' . v:servername
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  if ! exists("v:servername")
  	return
  endif
  let b:sessiondir = $HOME . "/.vim/sessions"
  let b:sessionfile = b:sessiondir . "/" . v:servername
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

au VimEnter * nested :call LoadSession()
au VimLeave * :call MakeSession()
