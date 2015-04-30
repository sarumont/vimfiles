" init {{{
set encoding=utf-8
set nocompatible
"}}}

" Pathogen {{{
filetype off
exec pathogen#infect('bundle/{}', 'bundle.local/{}')
"}}}

" misc {{{
autocmd!
set t_Co=256
filetype plugin on
set viminfo='100,\"50,:20
set formatoptions=croql
set autowrite
set textwidth=100
set bs=2
set so=7
let mapleader = ","
let g:mapleader = ","
set hidden
set wildmenu
set wildignore=*/generated/*,.git,*.pyc,.svn,*.jar,*.class,*.un~,*.swp,*.swo,*.png,*.jpg,*.ttf,*.woff,*/javadoc/*,*.gif,*.ogg,*.mp3,*.mp4
set undofile

" Don't use Ex mode, use Q for formatting
map Q gq

let g:yankring_history_file='.yankring_history'

let g:notes_directories = ['~/files/notes']

au CursorHold,CursorHoldI,WinEnter,BufWinEnter * checktime

" }}}

" Colors {{{
set background=dark
syntax enable
colorscheme jellybeans

hi CtrlPMatch ctermfg=green
hi CursorLine ctermbg=236
hi LongLines term=standout ctermfg=red cterm=underline
hi MatchParen ctermbg=63
hi Folded ctermbg=234 ctermfg=238
" }}}

" UI {{{
augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END
set showmatch
set matchtime=1

" title string
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
set titlelen=70
if &term == "screen"
	set t_ts=k
	set t_fs=\
endif
if &term == "screen" || &term == "xterm" 
	set title
endif
" }}}

" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" }}}

" Status line / powerline {{{
set statusline=%t%m%r%h%w\ [%{&ff}\ \|\ %04l,%04v\ (%p%%)\ \|\ lines:\ %L]\ %{fugitive#statusline()}
set laststatus=2
"hi StatusLine cterm=none ctermfg=15 ctermbg=11
"hi StatusLineNC cterm=none ctermfg=0 ctermbg=11

if has("unix")
	let s:uname = system("echo -n \"$(uname)\"")
	if s:uname == "Darwin"
		set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
	else
		set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
	endif
endif
set laststatus=2
"}}}

" Searching {{{
set nohlsearch
set incsearch
set ignorecase
set smartcase

let g:agprg="ag --nocolor --nogroup --column --smart-case"
" }}}

" Key mappings {{{
nnoremap <silent> <Leader><Leader> :CtrlP<cr>

nnoremap <silent> <Leader>a :Ag! 

map <leader>tl :TlistToggle<cr>

" git
nnoremap <silent> <Leader>gd :Gdiff<cr>
nnoremap <silent> <Leader>gl :Glog<cr>
nnoremap <silent> <Leader>gs :Gstatus<cr>
nnoremap <silent> <Leader>gb :Gblame<cr>
nnoremap <silent> <Leader>gc :Gcommit<cr>
nnoremap <silent> <Leader>GC :Git svn dcommit<cr>
nnoremap <silent> <Leader>GR :Git svn rebase<cr>:CommandTFlush<cr>
nnoremap <silent> <Leader>amend :Git commit --amend<cr>
nnoremap <silent> <Leader>stash :Git stash<cr>
nnoremap <silent> <Leader>pop :Git stash pop<cr>

" java
nnoremap <silent> <Leader>jdk6 :let $JAVA_HOME = '/usr/lib/jvm/java-6-oracle'<cr>
nnoremap <silent> <Leader>jdk7 :let $JAVA_HOME = '/usr/lib/jvm/java-7-oracle'<cr>
nnoremap <silent> <Leader>jdk8 :let $JAVA_HOME = '/usr/lib/jvm/java-8-oracle'<cr>

nnoremap <silent> <Leader>gun :GundoToggle<cr>

" Scratch
nnoremap <silent> <Leader>s :Sscratch<cr>

" vim-notes
nnoremap <silent> <Leader>d ^wiDONE <esc>

" YankRing
nnoremap <silent> <Leader>yr :YRShow<cr>

" Windows 
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

":cmap bc Bclose
if has("unix")
	let s:uname = system("echo -n \"$(uname)\"")
	if s:uname == "Darwin"
		nnoremap <silent> <Leader>pp :set paste<cr>$:r ! pbpaste <cr>:set nopaste<cr>$
	else
		nnoremap <silent> <Leader>pp :set paste<cr>$:r ! xclip -o<cr>:set nopaste<cr>$
		nnoremap <silent> <Leader>pv :set paste<cr>$:r ! xclip -selection clipboard -o<cr>:set nopaste<cr>$
	endif
endif

:map <F6> :set spell!<cr>
:map <Leader>h :set hlsearch!<cr>
:map <F8> :set wrap!<cr>

" NERDTree
:map <C-I> :NERDTreeToggle<cr>

:map <C-Tab> :tabnext<cr>
:map <C-S-Tab> :tabprev<cr>
" }}}

" Gist {{{
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_update_on_write = 2
" }}}

" Snippets {{{
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets", "local/snippets"] 
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}

" Quickfix {{{
:map <Leader>e :cn<cr>zz<cr>:cc<cr>zv
:map <Leader>p :cp<cr>
:map <Leader>l :clist<cr>
" }}}

" Indentation {{{
set autoindent
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
" }}}

" Java {{{
let java_allow_cpp_keywords=1
let java_highlight_all=1
let java_minlines=50
autocmd BufNewFile,BufRead *.java nnoremap <silent> <Leader>o o@Override<esc>
autocmd BufNewFile,BufRead *.java nnoremap <silent> <Leader>u o@author <C-R>=g:author_name<C-M><esc>
"}}}

" mouse {{{
:set mouse=nv
:set mousehide
"}}}

" Folding {{{
set foldmethod=syntax
set foldnestmax=10
set foldenable
set foldlevelstart=1
" }}}}

"define :HighlightLongLines command to highlight the offending parts of
"lines that are longer than the specified length (defaulting to 80)
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
	if exists("g:has_local_codeinit")
		call LocalCodeInit()
	endif
endfu

" Building {{{
" Sets build variables for Apache ant
fu! SetAnt()
	set makeprg=ant\ -e\ -q
	set efm=
				\%E%f:%l:\ error:\ %m,
				\%C%p^,
				\%C\ %#%m,
				\%-G%.%#
endfu

" Sets build variables for gradle
fu! SetGradle()
	set makeprg=gradle\ --daemon\ --quiet
	set efm=
				\%W%f:%l:\ warning:\ %m,
				\%E%f:%l:\ error:\ %m,
				\%C%p^,
				\%C\ %#%m,
				\%-G%.%#
endfu

" Sets build variables for Apache maven
fu! SetMaven()
	set makeprg=mvn\ -q
	set efm=
				\%W[WARNING]\ %f:[%l\\,%c]\ %m,
				\%E[ERROR]\ %f:[%l\\,%c]\ %m,
				\%C\ %#symbol:\ %.%#\ %m,
				\%Z\ %#location:\ %.%#,
				\%C[ERROR]\ symbol:\ %.%#\ %m,
				\%Z[ERROR]\ location:\ %.%#,
				\%C[ERROR]\ %#required:\ %#%m,
				\%Z[ERROR]\ found:\ %#%m,
				\%Z\ %#found:\ %#%m,
				\%-Z%.%#,
				\[ERROR]\ %f:[%l]\ %m,
				\%-G%.%#,
endfu
" }}}}

" omnicomplete (javacomplete)
imap <Nul> <Space>
let NERDTreeWinSize=42
let NERDTreeHighlightCursorline=0

" Autocommands {{{
"au FileType xhtml,htm,html,dtd,xml,xml2,xsd,ant set shiftwidth=2 tabstop=2
au FileType xjb set filetype=xml

" trailing space highlighting
au BufWinEnter,BufRead,BufNewFile *.java,*.c,*.cpp,*.js,*.html,*.htm,*.xml,*.lzx let w:m1=matchadd( 'Error', '\s\{2,}$', -1)
au BufWinEnter,BufRead,BufNewFile *.java,*.c,*.cpp,*.js :call CodeInit()

" lesscss
au BufNewFile,BufRead *.less set filetype=less

" When editing a file, always jump to the last cursor position
au BufReadPost *
			\ if &ft == 'gitcommit' || &ft == 'mail' |
			\   exe "normal! gg" |
			\   exe "startinsert" |
			\ elseif line("'\"") > 1 && line ("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif
"}}}


" session management {{{
set sessionoptions=blank,buffers,curdir,tabpages,winpos,folds
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

if ! has( "gui_running" )
	au VimEnter * nested :call LoadSession()
	au VimLeave * :call MakeSession()
endif
"}}}

" Building {{{
" Build the closest project to the current file with ant or maven
:map <leader>b :call Build(0)<cr>
:map <leader>clb :call Build(1)<cr>:call Build(0)<cr>
function! Build(clean)
	let l:dir = expand('%:p:h')
	let l:pom = l:dir . "/pom.xml"
	let l:ant = l:dir . "/build.xml"
	let l:gradle = l:dir . "/build.gradle"
	let l:gradle_settings = l:dir . "/settings.gradle"
	while ! filereadable(l:pom) && ! filereadable(l:ant) && ! filereadable(l:gradle) && ! filereadable(l:gradle_settings)
		let l:dir = fnamemodify(l:dir, ':h')
		if 1 == strlen(l:dir)
			echo "Could not find pom.xml, build.xml, build.gradle, or settings.gradle"
			return
		endif
		let l:pom = l:dir . "/pom.xml"
		let l:ant = l:dir . "/build.xml"
		let l:gradle = l:dir . "/build.gradle"
		let l:gradle_settings = l:dir . "/settings.gradle"
	endwhile

	if filereadable(l:pom)
		call SetMaven()
		let l:args = "-f " . l:pom 
	elseif filereadable(l:gradle_settings)
		call SetGradle();
		let l:args = "-b " . l:gradle_settings 
	elseif filereadable(l:gradle)
		call SetGradle();
		let l:args = "-b " . l:gradle 
	elseif filereadable(l:ant)
		call SetAnt();
		let l:args = "-s " . l:ant 
	endif

	if a:clean
		let l:args = l:args . " clean"
	endif
	exe "make " . l:args
endfunction
"}}}

" DelimitMate {{{
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
"}}}

"{{{ Variable definitions
if has("unix")
	let s:uname = system("echo -n \"$(uname)\"")
	if s:uname == "Darwin"
		let g:author_name = system("finger `whoami` | awk -F: '{ print $3 }' | head -n1 | sed 's/^ //'")
	else
		let g:author_name = system("getent passwd $USER | cut -d ':' -f 5 | cut -d ',' -f 1")
	endif
endif
"}}}
" vim:foldmethod=marker:foldlevel=0
