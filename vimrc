" File:        $HOME/.vim/vimrc
" Purpose:     Configuration file for VIM
" Author:      Leon Breedt <leon@obsidian.co.za> (Sat Jul 03 13:02:07 SAST 1999)
" Author:      G. Lejeune (Sat Jul 17 17:20:17 CET 2000)
" Author:      PRATZ Bernard <bernard@pratz.net>
" Last update: Mon Nov 24 17:15:48 GMT 2014

let mapleader = ","
set pastetoggle=<F3>

" vim plugins
runtime macros/justify.vim
runtime ftplugin/man.vim

" Bundles {{{

" for better synchronization, I have only:
"   ~/.vim/vimrc
"   ~/.vim/neobundle.vim
" and all the files specific to a machines are within:
"   ~/.local/vim/bundle
"   ~/.local/vim/swapfiles
"   ~/.local/vim/undofiles

" NeoBundle setup {{{
filetype off

set runtimepath+=~/.vim/neobundle.vim/
call neobundle#begin(expand('~/.local/vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" }}}

" Bundles

"" General bundles

" Bundle VimProc {{{

NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }
" }}}
" Bundle Unite {{{
NeoBundle 'Shougo/Unite.vim'
let g:unite_source_history_yank_enable = 1
"call unite#filters#matcher_default#use(['matcher_fuzzy']) " XXX not working
nnoremap <leader>bl :<C-u>Unite -buffer-name=buffers -start-insert buffer<cr>
nnoremap <leader>t  :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f  :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>bo  :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y  :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>

" }}}
" Bundle GrepCommands {{{
NeoBundle 'vim-scripts/GrepCommands'
nnoremap <leader>bg<space> :BufGrep<CR>
nnoremap <leader>bg :BufGrep //<Left>
" }}}
" bundle Airline {{{
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1 " I did compile the updated fonts!
NeoBundle 'bling/vim-airline'
" }}}
NeoBundle 'moll/vim-bbye'
NeoBundle 'godlygeek/tabular'
" vim commentary {{{
NeoBundle 'tpope/vim-commentary'
" }}}
NeoBundle 'tpope/vim-git'
" Bundle Fugitive {{{
NeoBundle 'tpope/vim-fugitive'
map <Leader>gw :Gwrite<CR>
map <Leader>gm :Grename<CR>
map <Leader>gb :Gblame<CR>

if has('gui_running')
  if has('macunix')
    command! CI !PWD=%:p:h gitx &
  elseif has('unix')
    command! CI !git-cola -r %:p:h &
  endif
  map <Leader>gc :CI<CR>
else
  map <Leader>gc :Gcommit<CR>
endif

" }}}
" Bundle GUndo {{{
NeoBundle 'sjl/gundo.vim'
nnoremap U :GundoToggle<CR>
" }}}
"NeoBundle 'vim-scripts/showmarks--Politz'
NeoBundle 'tomtom/quickfixsigns_vim'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'reinh/vim-makegreen'
" TaskList {{{
NeoBundle 'vim-scripts/TaskList.vim'
map <leader>T <Plug>TaskList
" }}}
" Bundle Syntastic {{{
NeoBundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_csslint_ignore="fallback-colors"
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol="✗"
let g:syntastic_style_warning_symbol="⚑"
let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['ruby', 'javascript'],
                               \ 'passive_filetypes': ['python', 'cpp', 'c'] }
map <Leader>CT :SyntasticToggleMode<CR>
" }}}
" Bundle vim-slime {{{
""" Plugin to send selection or paragraph to screen session
NeoBundle 'jpalardy/vim-slime'
let g:slime_paste_file = "$HOME/.local/vim/.slime_paste"
let g:slime_target = "screen"
" }}}
" Bundle Rainbow parentheses {{{
let g:rainbow_active = 1
let g:rainbow_operators = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'FireBrick3', 'Green1', 'DodgerBlue3', 'OrangeRed3', 'DeepPink3', 'SkyBlue3']
NeoBundle 'oblitum/rainbow'
" }}}
" Bundle CamelCaseMotion {{{
map <silent> -w <Plug>CamelCaseMotion_w
map <silent> -b <Plug>CamelCaseMotion_b
map <silent> -e <Plug>CamelCaseMotion_e
omap <silent> i_ <Plug>CamelCaseMotion_iw
xmap <silent> i_ <Plug>CamelCaseMotion_iw
omap <silent> i- <Plug>CamelCaseMotion_iw
xmap <silent> i- <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie
NeoBundle 'bkad/CamelCaseMotion'
" }}}

" Markdown bundles

" VIM Calendar {{{
NeoBundleLazy 'mattn/calendar-vim', {'autoload':{'filetypes':['markdown']}}
let g:calendar_keys = {'close': 'q', 'do_action': '<CR>', 'goto_today': 't', 'show_help': '?', 'redisplay': 'r', 'goto_next_month': '<', 'goto_prev_month': '>', 'goto_next_year': '+', 'goto_prev_year': '-'}
let g:calendar_monday = 1
let g:calendar_weeknm = 5
" }}}
" VIM Wiki {{{
NeoBundleLazy 'vimwiki/vimwiki', {'augroup': 'markdown'}
map <leader>ww :NeoBundleSource vimwiki<CR>:VimwikiIndex<CR>
let wiki_notes = {}
let wiki_notes.path = '~/Documents/Perso/Notes/'
let wiki_notes.html_path = '~/Documents/Perso/Notes/html/'
let wiki_notes.syntax = 'markdown'
let wiki_notes.ext = '.md'
let wiki_notes.auto_export = 1
let wiki_notes.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'latex': 'latex'}
let g:vimwiki_list = [wiki_notes]
let g:vimwiki_folding = 'syntax'
" let g:vimwiki_ext2syntax = {'.md': 'markdown',
"             \ '.mkd': 'markdown',
"             \ '.wiki': 'media'}
" }}}

" }}}

" Language specific bundles

NeoBundleLazy 'Shougo/unite-outline', {
    \ 'autoload': {
    \   'filetypes': ['c','cpp','javascript','python','ruby','java','zsh','bash','sh']
    \   }
    \ }
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}}
NeoBundleLazy 'derekwyatt/vim-scala', {'autoload':{'filetypes':['scala']}}
" NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
" Bundle YouCompleteMe {{{
NeoBundleLazy 'Valloric/YouCompleteMe', {
    \ 'build' : {
    \     'mac' : 'bash install.sh',
    \     'unix' : 'bash install.sh',
    \    },
    \ 'autoload': {
    \     'filetypes': ['c','cpp','javascript','python','ruby','java','zsh','bash','sh']
    \    },
    \ }

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<C>n']
let g:ycm_key_list_previous_completion = ['<C>-p']
nnoremap gsd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap gsD :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}
" Python {{{
NeoBundleLazy 'mkomitee/vim-gf-python', {'autoload':{'filetypes':['python']}}
" http://vimawesome.com/plugin/python-mode
" Bundle Python mode {{{
NeoBundleLazy 'klen/python-mode', {'autoload':{'filetypes':['python']}}
" :help ropevim.txt

augroup pythonmode
    au!
    au FileType python let g:pymode_doc = 1                                  "  Load show documentation plugin
    au FileType python let g:pymode_run = 1                                  "  Load run code plugin
    au FileType python let g:pymode_lint_checker = 'pyflakes,pep8'
    au FileType python let g:pymode_lint_ignore = 'E501,E121,E126,E127,E128' "  Skip errors and warnings (E.g. 'E501,W002', 'E2,W' (Skip all Warnings and Errors startswith E2) and etc..)
    au FileType python let g:pymode_lint_select = ''                         "  E.g. 'E4,W' Select errors and warnings
    au FileType python let g:pymode_lint_cwindow = 1                         "  Auto open cwindow if errors be finded
    au FileType python let g:pymode_lint_jump = 0                            "  Auto jump on first error
    au FileType python let g:pymode_lint_hold = 1                            "  Hold cursor in current window when quickfix is open
    au FileType python let g:pymode_lint_signs = 1                           "  Place error signs
    au FileType python let g:pymode_lint_minheight = 3                       "  Minimal height of pylint error window
    au FileType python let g:pymode_lint_maxheight = 6                       "  Maximal height of pylint error window
    au FileType python let g:pymode_rope = 1                                 "  Load rope plugin
    au FileType python let g:pymode_rope_auto_project = 1                    "  Auto create and open ropeproject
    au FileType python let g:pymode_rope_enable_autoimport = 1               "  Enable autoimport

    au FileType python let g:pymode_folding = 1                                       "  Enable python folding
    au FileType python let g:pymode_motion = 1
    au FileType python let g:pymode_virtualenv = 1                                    "  Auto fix vim python paths if virtualenv enabled
    au FileType python let g:pymode_paths = []                                        "  Additional python paths
    au FileType python let g:pymode_breakpoint = 1                                    "  Load breakpoints plugin
    au FileType python let g:pymode_utils_whitespaces = 1                             "  Autoremove unused whitespaces
    au FileType python let g:pymode_indent = 1                                        "  Enable pymode indentation
    au FileType python let g:pymode_options = 1                                       "  Set default pymode python options
    au FileType python let g:pymode_syntax = 1                                        "  Enable pymode's custom syntax highlighting
    au FileType python let g:pymode_syntax_all = 1                                    "  Enable all python highlightings
    au FileType python let g:pymode_syntax_print_as_function = 1                      "  Highlight 'print' as function
    au FileType python let g:pymode_syntax_indent_errors = g:pymode_syntax_all        "  Highlight indentation errors
    au FileType python let g:pymode_syntax_space_errors = g:pymode_syntax_all         "  Highlight trailing spaces
    au FileType python let g:pymode_syntax_string_formatting = g:pymode_syntax_all    "  Highlight string formatting
    au FileType python let g:pymode_syntax_string_format = g:pymode_syntax_all        "  Highlight str.format syntax
    au FileType python let g:pymode_syntax_string_templates = g:pymode_syntax_all     "  Highlight string.Template syntax
    au FileType python let g:pymode_syntax_doctests = g:pymode_syntax_all             "  Highlight doc-tests
    au FileType python let g:pymode_syntax_builtin_objs = g:pymode_syntax_all         "  Highlight builtin objects (__doc__, self, etc)
    au FileType python let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all        "  Highlight builtin functions
    au FileType python let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all "  Highlight exceptions
    au FileType python let g:pymode_syntax_slow_sync = 0                              "  For fast machines

    au FileType python " Auto generate global cache
    au FileType python let g:pymode_rope_autoimport_generate = 1
    au FileType python let g:pymode_rope_autoimport_underlineds = 0
    au FileType python let g:pymode_rope_codeassist_maxfixes = 10
    au FileType python let g:pymode_rope_sorted_completions = 1
    au FileType python let g:pymode_rope_extended_complete = 1
    au FileType python let g:pymode_rope_autoimport_modules = ["os","shutil","datetime","sys"]
    au FileType python let g:pymode_rope_confirm_saving = 1
    au FileType python let g:pymode_rope_global_prefix = "<C-x>p"
    au FileType python let g:pymode_rope_local_prefix = "<Leader>PR"
    au FileType python map <Leader>rh :help RopeKeys<CR>
    au FileType python let g:pymode_rope_vim_completion = 1
    au FileType python let g:pymode_rope_guess_project = 1
    au FileType python let g:pymode_rope_goto_def_newwin = ""
    au FileType python let g:pymode_rope_always_show_complete_menu = 0

    au FileType python let g:pymode_doc_key = '<leader>PK'                   "  Keyor show python documentation
    au FileType python let g:pymode_run_key = '<leader>PX'                   "  Key for run python code
    au FileType python let g:pymode_breakpoint_key = '<leader>PB'                     "  Key for set/unset breakpoint

    " au FileType python " rope
    " au FileType python map gd :RopeGotoDefinition<CR>
    " au FileType python map <leader>Pr :RopeRename<CR>

    " au FileType python " Execute the tests
    " au FileType python map <Leader>RTf <Esc>:Pytest file<CR>
    " au FileType python map <Leader>RTc <Esc>:Pytest class<CR>
    " au FileType python map <Leader>RTm <Esc>:Pytest method<CR>
    " au FileType python " cycle through test errors
    " au FileType python map <Leader>RTn <Esc>:Pytest next<CR>
    " au FileType python map <Leader>RTp <Esc>:Pytest previous<CR>
    " au FileType python map <Leader>RTe <Esc>:Pytest error<CR>
augroup END

"" }}} python-mode
" }}}
NeoBundleLazy 'kingbin/vim-arduino', {'autoload':{'filetypes':['arduino']}}
" Bundle Eclim (Java) {{{
NeoBundleLazy 'ervandew/eclim', {'autoload':{'filetypes':['java']}}
" 'open' on OSX will open the url in the default browser without issue
let g:EclimBrowser='open'
let g:EclimCompletionMethod = 'omnifunc'
" }}}

"

" NeoBundle Prologue {{{
call neobundle#end()

filetype plugin indent on     " required!

NeoBundleCheck

" }}}

""" }}}
" Editing behaviour {{{

" we use bash.. no no, I dont want
set shell=zsh

" suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set viminfo='10,\"100,:20,%,n~/.viminfo
set hlsearch
set nocompatible

" allow backspacing over everything in insert mode
set backspace=2
set so=4

" i use vim to code mostly, so autoindent makes sense
set autoindent

" definitely.  can't code without it
syntax on

" save before :make, :suspend, etc
set autowrite

" don't wrap lines by default.  makes sense on 80x25.
set nowrap
set textwidth=0
set formatoptions=qrn1
set colorcolumn=85
set list
set listchars=eol:¶,trail:~,extends:⫸,precedes:⫷,tab:▸\ ,nbsp:␣

" backups are for wimps!  they also leave files with ~ extensions all over.
set nobackup
set backupdir=~/.vim/

" write a .viminfo file, don't store more than 50 lines
set viminfo='20,\"50

" various options for a tab stop of 4 spaces.
" expand tabs to spaces.
set expandtab
set cinoptions=>4
set shiftwidth=4
set tabstop=4
set softtabstop=4

set shiftround
set smarttab

" stop beeping!
set noerrorbells

" show matching brackets
"set showmatch
"set matchtime=3
set matchpairs=(:),{:},[:],<:>,":",':',«:»,/*:*/,""":""",''':'''

" don't ignore case while searching
set noignorecase

" don't jump cursor around, stay in current column
set nostartofline

" search like emacs, show matches while searching
set incsearch

" yes.  allow magic patterns in searches
set magic

set joinspaces

set wildmenu
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

""" }}}
" Editor's interface {{{

set cursorline
set cursorcolumn
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn

" show partial command in status line
set showcmd

" different syntax highlighting look
set background=dark

" show ruler (line & column numbers)
set ruler

" always show status line, even when editing just one file
set laststatus=2

" show short messages.  lessens the changes of ever getting a 'hit-return'
" prompt
set shortmess=at    " show short messages

" display title in X - with screen this not useful, but sometimes, I launch it in a shell ;)
set title

" smoother output, we're not on a 1200 dialup :)
set ttyfast

" Line number
set nu

" Size of the fold column
set foldcolumn=1

" keep buffers alive when not selected
set hidden

set modelines=0

" swap files
set directory=~/.local/vim/swapfiles

" undo file
set undofile
set undodir=~/.local/vim/undofiles
set undolevels=2000
set history=200

"":help quickfix
"set makeprg=jikes -nowarn -Xstdout +E %
"set errorformat=%f:%l:%c:%*\d:%*\d:%*\s%m

""" }}}
" X11 interaction {{{

"" all my old favorites ;-)
"set guifont=Monospace\ 8
"set guifont=Courier\ 10\ Pitch\ 8 " Really tiny font, need good eyes or good screen or both ;)
"set guifont=DejaVu\ Sans\ Mono:h9.00
"set guifont=Andale\ Mono:h9

set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

highlight Cursor guifg=black guibg=white
highlight iCursor guifg=white guibg=steelblue
set guicursor=i-n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

if !has('gui_running')
  set nocursorcolumn
  " show which mode we're in
  set showmode
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
  set mouse=a
  set ttymouse=xterm
  set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P\ %{fugitive#statusline()}
  if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" || &term =~ "xterm"
    set t_Co=16
    set t_Sf=^[[3%dm
    set t_Sb=^[[4%dm
  endif
else
  if has('macunix')
    set guifont=Menlo\ for\ Powerline:h7
    set transparency=10
  else
    set guifont=Menlo\ for\ Powerline\ 10
  endif

  " show which mode we're in
  set noshowmode
  set t_Co=16
endif

    """ }}}
" Mappings {{{

" Yank current line in register y and run it as an ex command
nnoremap <Leader>!e "yyy@y
" Yank current line in register y and run it as a python command
nnoremap <Leader>!p "yyy:let @y=":py3 ".@y<CR>@y<CR>
" Yank current line in register y and run it as a ruby command
nnoremap <Leader>!r "yyy:let @y=":ru ".@y<CR>@y<CR>
" Yank current line in register y and run it as a shell command
nnoremap <Leader>!s "yyy:let @y=":!".@y<CR>@y<CR>

" Tune the cmdline with emacs mode
nmap \n :setlocal number!<CR>
nmap \p :set paste!<CR>
nmap \t2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap \t4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \t8 :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \T2 :set noexpandtab tabstop=2 softtabstop=2 shiftwidth=2<CR>
nmap \T4 :set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>
nmap \T8 :set noexpandtab tabstop=8 softtabstop=8 shiftwidth=8<CR>

nmap <Leader>gr :grep -r  .<left><left>
" nmap <leader>gv :vimgrep ** | copen <cr>
" nmap <leader>gv :Bgrep

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"map <Leader>, @:

nnoremap <Leader><SPACE> :bnext<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprev<CR>
"nmap <Leader>l :ls<CR>

nnoremap <Leader>ba :badd
" nmap <Leader>bd :bdel<CR>
"nmap <Leader>bd <Plug>Kwbd
nnoremap <Leader>bc :Bdelete<CR>
nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>b1 :b1<CR>
nnoremap <Leader>b2 :b2<CR>
nnoremap <Leader>b3 :b3<CR>
nnoremap <Leader>b4 :b4<CR>
nnoremap <Leader>b5 :b5<CR>
nnoremap <Leader>b6 :b6<CR>
nnoremap <Leader>b7 :b7<CR>
nnoremap <Leader>b8 :b8<CR>
nnoremap <Leader>b9 :b9<CR>
nnoremap <Leader>b0 :b0<CR>

" quickfix mappings
nnoremap <Leader>qn :cnext<CR>
nnoremap <Leader>qp :cprev<CR>
nnoremap <Leader>qo :copen<CR>
nnoremap <Leader>qc :cclose<CR>

" location mappings
nnoremap <Leader>ln :lnext<CR>
nnoremap <Leader>lp :lprev<CR>
nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>lc :lclose<CR>

"   Edit another file in the same directory as the current file
"   uses expression to extract path from current file's path
"  (thanks Douglas Potts) [obsoleted by Unite bundle]
"map <Leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>

map <Leader>ev :e ~/.vim/vimrc <CR>
map <Leader>em :e ~/.muttrc <CR>
map <Leader>ep :e ~/.procmailrc <CR>
map <Leader>ez :e ~/.zshrc<CR>

" split shortcuts
nnoremap <Leader>sh :split<CR>
nnoremap <Leader>sv :vsplit<CR>

" insert
iab YDATE <C-R>=strftime("%a %b %d %T %Z %Y")<CR>

nmap <Leader>LU 1G/Last update:\s*/e+1<CR>CYDATE<ESC>
nmap <Leader>LC 1G/Last change:\s*/e+1<CR>CYDATE<ESC>

" Compile the source
nnoremap <Leader>cp :w<CR>:set makeprg=g++ % -O<CR>:make<CR>
nnoremap <Leader>cc :w<CR>:set makeprg=gcc % -O<CR>:make<CR>
nnoremap <Leader>cl :update<CR>:set makeprg=pdflatex %<CR>:make<CR>
nnoremap <Leader>cm :w<CR>:set makeprg=make<CR>:make<CR>
"map <Leader>cc :!ctags -R -I --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" 1/4 of the screen movement
nnoremap <expr> zT 'zt'
" N.B. if flashes try with: winline()-winheight(0)/3 . <C-e>
" N.B. try nnoremap <expr> zt winline()-winheight(0)/3>0? winline()-winheight(0)/3 . '<C-e>' : winline()-1 . '<C-e>'
nnoremap <expr> zt 'zt' . winheight(0)/4 . '<c-y>'
nnoremap <expr> zB 'zb' . winheight(0)/4 . '<c-e>'

" Reselect pasted text
nnoremap <leader>v V`]

au FileType python set omnifunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview

" add sudo command
command! W w ! sudo tee % > /dev/null

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    let last_search_removed_from_history = histdel('s', -1)
    normal 'yz<CR>
    normal `z
  endif
endfunction

" mapping for stripping white spaces
nnoremap <leader>s<space> :call StripTrailingWhitespace()<CR>
"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>


" }}}
" AutoCommands {{{
filetype plugin on
filetype plugin indent on

if has("autocmd")
    " restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf
    au BufWinLeave * call clearmatches()

    " Markdown {{{
    " http://code.google.com/p/vimwiki/issues/detail?id=384
    au BufNewFile,BufRead *.md set filetype=markdown
    function! s:MDSettings()
        "inoremap <buffer> <Leader>n \note[item]{}<Esc>i
        noremap <buffer> <Leader>ch :!pandoc
                    \ --template ~/Documents/Templates/beamer.tpl
                    \ --from markdown "%" -t beamer -o "%<.pdf"<CR>
        noremap <buffer> <Leader>cl :!pandoc
                    \ --template ~/Documents/Templates/latex.tpl
                    \ --from markdown "%" -t latex -o "%<.pdf"<CR>
        noremap <buffer> <Leader>cL :!pandoc
                    \ --template ~/Documents/Templates/lettre.tpl
                    \ --from markdown "%" -t latex -o "%<.pdf"<CR>
        noremap <buffer> <Leader>ch :!pandoc
                    \ --template ~/Documents/Templates/html.tpl
                    \ --from markdown "%" -t html -o "%<.html"<CR>
        noremap <buffer> <Leader>cv :!qlmanage -p "%<.pdf" 2>&1 >/dev/null &<CR>
        noremap <buffer> <Leader>co :!open -a Preview "%<.pdf" 2>&1 >/dev/null &<CR>
    endfunction

    augroup markdown
      au!
      au CursorHold *.md update
      " for markdown texts: adds a line of = under h1 titles
      au FileType markdown nnoremap <leader>h1 yypVr=
      au FileType markdown nnoremap <leader>h2 yypVr-
    augroup END
    " }}}
    " Mail {{{
    augroup mail
      au!
      "au BufRead /tmp/mutt* source /home/guyzmo/.vim/after/ftplugin/yaposting.vim
    augroup END
    " }}}
    " Shell files {{{
    augroup shell
      au!
      au BufWritePost *.sh :!chmod u+x <afile>
      au FileType markdown set noswapfile
      au BufWritePost * if getline(1) =~ "^#!/bin/[a-z]*sh" | silent !chmod u+x <afile> | endif
      au BufEnter *.sh if getline(1) == "" | :call setline(1, "#!/bin/sh") | endif
      au BufEnter *.sh let g:is_posix = 1
      au FileType markdown nmap <C-]> <Plug>VimwikiFollowLink
      au FileType markdown vmap <C-]> <Plug>VimwikiNormalizeLinkVisualCR
      au FileType markdown nmap <C-[> <Plug>VimwikiGoBackLink
      au BufRead,BufNewFile *.md setfiletype markdown
      au FileType markdown :call <SID>MDSettings()
    augroup END
    " }}}
    " Python {{{
    augroup python
    au!
    au FileType python nnoremap <leader>ft Vatzf
    au BufEnter *.py if getline(1) == "" | :call setline(1, "#!/usr/bin/env python") | endif
    au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
    augroup END
    " }}}
    " Javascript {{{
    function! JavaScriptFold()
        setl foldmethod=syntax
        setl foldlevelstart=1
        syn region foldBraces start=/^[^"'\/]*{[^"'\/}]*$/ end=/^[^{"'\/]*}[^"'\/]*$/ transparent fold keepend extend
        function! FoldText()
            return substitute("   ".getline(v:foldstart), '{.*', '{...}', '')
        endfunction
        setl foldtext=FoldText()
    endfunction
    augroup js
        au!
        au FileType javascript runtime ftplugin/javascript.vim
        au FileType javascript runtime syntax/javascript.vim
        au FileType javascript runtime indent/javascript.vim
        au FileType javascript  set smartindent
        au FileType javascript call JavaScriptFold()
        "au FileType javascript setl fen
    augroup END
    " }}}
    " for HTML texts {{{
    augroup html
        au!
        au FileType html nnoremap <leader>ft Vatzf
        au FileType html let html_use_css = 1
        au FileType html let use_xhtml = 1
        au FileType html let html_ignore_folding = 1
        au FileType html let html_use_encoding = 1
    augroup END
    " }}}
    " for CSS texts, CSS sorting {{{
    augroup css
        au!
        au FileType css nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
    augroup END
    " }}}
    " Scala {{{
    augroup scala
        au!
        au FileType scala set smartindent
    augroup END
    " }}}
    " Java {{{
    augroup java
        au!
        au FileType java set smartindent
    augroup END
    " }}}
    " Coffee script {{{
    augroup coffee
        au!
        au FileType coffee 'vim-coffee-script'
        au FileType coffee set smartindent
    augroup END
    " }}}
    " ChangeLog {{{
    augroup changelog
    au!
    au FileType changelog runtime ftplugin/changelog.vim
    au FileType let g:changelog_username = 'Guyzmo <guyzmo@m0g.net>'
    augroup END
    "}}}
" C Files options {{{
    augroup cfiletypedetect
        au!
        au BufNewFile,BufRead *.aadl    setf aadl
        au BufNewFile,BufRead *.pde     setf arduino
        au BufNewFile,BufRead *.ino     setf arduino
        au BufNewFile,BufRead *.C       setf cpp
        au BufNewFile,BufRead *.h       setf cpp
    augroup END

    " Set some sensible defaults for editing C-files
    augroup cprog
        " Remove all cprog autocommands
        au!
        au FileType cpp,c set smartindent
        " t-pope vim-commentary plugin
        autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

        " When starting to edit a file:
        "   For *.c and *.h files set formatting of comments and set C-indenting on.
        "   For other files switch it off.
        "   Don't change the order, it's important that the line with * comes first.
        autocmd BufRead *       set formatoptions=tcql nocindent comments&
        autocmd BufRead *.c,*.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
    augroup END

    " }}}
" bzip2 options {{{
    augroup bzip2
    " Remove all bzip2 autocommands
    au!

    " Enable editing of bzipped files
    "       read: set binary mode before reading the file
    "             uncompress text in buffer after reading
    "      write: compress file after writing
    "     append: uncompress file, append, compress file
    autocmd BufReadPre,FileReadPre        *.bz2 set bin
    autocmd BufReadPre,FileReadPre        *.bz2 let ch_save = &ch|set ch=2
    autocmd BufReadPost,FileReadPost      *.bz2 |'[,']!bunzip2
    autocmd BufReadPost,FileReadPost      *.bz2 let &ch = ch_save|unlet ch_save
    autocmd BufReadPost,FileReadPost      *.bz2 execute ":doautocmd BufReadPost " . expand("%:r")

    autocmd BufWritePost,FileWritePost    *.bz2 !mv <afile> <afile>:r
    autocmd BufWritePost,FileWritePost    *.bz2 !bzip2 <afile>:r

    autocmd FileAppendPre                 *.bz2 !bunzip2 <afile>
    autocmd FileAppendPre                 *.bz2 !mv <afile>:r <afile>
    autocmd FileAppendPost                *.bz2 !mv <afile> <afile>:r
    autocmd FileAppendPost                *.bz2 !bzip2 -9 --repetitive-best <afile>:r
    augroup END
""" }}}
" vimrc {{{
    augroup vimrc
    au BufReadPre $MYVIMRC setlocal foldmethod=marker
    au BufReadPre $MYVIMRC setlocal ft=vim
    au BufWinEnter $MYVIMRC if &fdm == 'indent' | setlocal foldmethod=manual | endif
    au BufWritePost $MYVIMRC source $MYVIMRC
    augroup END
" }}}

endif " has ("autocmd")
" }}}
"Syntax highlighting {{{

" color scheme
colorscheme murphy

" i hate cyan comments :)
hi Comment                        ctermfg=Black ctermbg=8    guifg=Gray80  guibg=grey12
hi Folded                         ctermfg=Cyan  ctermbg=0    guifg=Cyan    guibg=grey12
hi FoldColumn                     ctermfg=Cyan  ctermbg=0    guifg=Cyan    guibg=grey12
hi SignColumn      term=standout  ctermfg=11    ctermbg=8    guifg=Cyan    guibg=#222222
hi Pmenu                                        ctermbg=Grey               guibg=DarkSlateGrey
hi NonText                        ctermfg=8                  guifg=#111155
hi SpecialKey                     ctermfg=8                  guifg=#111155
hi CursorLine      term=underline                                          guibg=Grey5
hi CursorColumn    term=reverse                                            guibg=Grey5
hi ColorColumn     term=reverse                 ctermbg=4                  guibg=#250000
hi RedundantSpaces term=standout                ctermbg=red                guibg=red
hi TrailingSpaces  term=standout                ctermfg=red                guifg=red

call matchadd('TrailingSpaces', '\s\s*$')
call matchadd('NonText', '$')
call matchadd('NonText', '	')

"""}}}
