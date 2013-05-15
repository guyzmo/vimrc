" File:        $HOME/.vimrc
" Purpose:     Configuration file for VIM
" Author:      Leon Breedt <leon@obsidian.co.za>
" His last update: Sat Jul 03 13:02:07 SAST 1999
" Author:      G. Lejeune 
" His last update: Sat Jul 17 17:20:17 CET 2000
" Author:      PRATZ Bernard <bernard@pratz.net>
" Last update: Fri May 10 15:27:14 CEST 2013

" Just another justifier
" Version:    0.3
" Maintainer: Kontra, Gergely <kgergely@mcl.hu>
" GetLatestVimScripts: 177 2 :AutoInstall: MyJustify.vim
" Improved by Charles E. Campbell, Jr.
" Multibyte patch suggested by Teemu Likonen

let mapleader = ","
set pastetoggle=<F3>

runtime /usr/share/vim/vim72/ftplugin/justify.vim
runtime ftplugin/man.vim
nnoremap K :Man <C-r><C-w><CR>

let g:changelog_username = 'Guyzmo <guyzmo@m0g.net>'

"sil !echo -ne "k $USER@$HOST:$PWD:vim % \\"

" Bundles {{{

" Vundle {{{
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Bundle 'vim-scripts/YAPosting'
Bundle '/Users/guyzmo/Workspace/Perso/Codes/vim-yaposting/.git'

" }}}

" Bundles
Bundle 'kchmck/vim-coffee-script'
"Bundle 'vim-scripts/showmarks--Politz'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'tmhedberg/matchit'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-git'
" Bundle Fugitive {{{
Bundle 'tpope/vim-fugitive'
map <Leader>gw :Gwrite<CR>
map <Leader>gm :Grename<CR>
map <Leader>gb :Gblame<CR>

if has('gui_running')
  if has('macunix')
    command! CI !PWD=%:p:h gitxr &
  elseif has('unix')
    command! CI !git-cola -r %:p:h &
  endif
  map <Leader>gc :CI<CR>
else
  map <Leader>gc :Gcommit<CR>
endif

" }}}
" Bundle GUndo {{{
Bundle 'sjl/gundo.vim'
nnoremap U :GundoToggle<CR>
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
" }}}
" Bundle 'jelera/vim-javascript-syntax'
Bundle 'msanders/snipmate.vim'
Bundle 'reinh/vim-makegreen'
" TaskList {{{
Bundle 'vim-scripts/TaskList.vim'
map <leader>T <Plug>TaskList
" }}}
Bundle 'wincent/Command-T'
nmap <Leader>bl :CommandTBuffer<CR>
nmap <Leader>tf :CommandTFlush<CR>
Bundle 'Lokaltog/powerline'
" Bundle vim-slime {{{
Bundle 'jpalardy/vim-slime'
let g:slime_paste_file = "$HOME/.vim/.slime_paste"
let g:slime_target = "screen"
" }}}
" Bundle Syntastic {{{
Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_csslint_ignore="fallback-colors"
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol="✗"
let g:syntastic_style_warning_symbol="⚑"
let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['ruby', 'javascript'],
                               \ 'passive_filetypes': ['python'] }
map <Leader>CT :SyntasticToggleMode<CR>
" }}}
" Bundle Tagbar {{{
Bundle 'majutsushi/tagbar'
map <Leader>B :TagbarToggle<CR> 
let g:tagbar_type_javascript = {
            \ 'ctagsbin' : '/usr/local/bin/jsctags'
            \ }
" Set options for ctags
let g:ctags_path='./ctags' 
let g:ctags_args='-I __declspec+'
" }}}
" Bundle Clang_complete {{{
Bundle 'Rip-Rip/clang_complete'
" }}}
Bundle 'mkomitee/vim-gf-python'
" Bundle Python mode {{{
Bundle 'klen/python-mode'
" :help ropevim.txt

" Disable pylint checking every save
let g:pymode_lint_write = 1

" Load show documentation plugin
let g:pymode_doc = 1

" Key for show python documentation
let g:pymode_doc_key = '<leader>PK'

" Load run code plugin
let g:pymode_run = 1

" Key for run python code
let g:pymode_run_key = '<leader>PR'

let g:pymode_lint_checker = "pyflakes,pep8"

" Skip errors and warnings
" E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors startswith E2) and etc
let g:pymode_lint_ignore = "E501,E121,E126,E127,E128"

" Select errors and warnings
" E.g. "E4,W"
let g:pymode_lint_select = ""

" Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 1

" Auto jump on first error
let g:pymode_lint_jump = 0

" Hold cursor in current window
" when quickfix is open
let g:pymode_lint_hold = 0

" Place error signs
let g:pymode_lint_signs = 1

" Minimal height of pylint error window
let g:pymode_lint_minheight = 3

" Maximal height of pylint error window
let g:pymode_lint_maxheight = 6

" Load rope plugin
let g:pymode_rope = 1

" Auto create and open ropeproject
let g:pymode_rope_auto_project = 1

" Enable autoimport
let g:pymode_rope_enable_autoimport = 1

" Auto generate global cache
let g:pymode_rope_autoimport_generate = 1
let g:pymode_rope_autoimport_underlineds = 0
let g:pymode_rope_codeassist_maxfixes = 10
let g:pymode_rope_sorted_completions = 1
let g:pymode_rope_extended_complete = 1
let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]
let g:pymode_rope_confirm_saving = 1
let g:pymode_rope_global_prefix = "<C-x>p"
let g:pymode_rope_local_prefix = "<Leader>PR"
map <Leader>rh :help RopeKeys<CR>
let g:pymode_breakpoint_key = '<leader>PB'
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_guess_project = 1
let g:pymode_rope_goto_def_newwin = ""
let g:pymode_rope_always_show_complete_menu = 0

" Enable python folding
let g:pymode_folding = 1

let g:pymode_motion = 1

" Auto fix vim python paths if virtualenv enabled
let g:pymode_virtualenv = 1

" Additional python paths
let g:pymode_paths = []

" Load breakpoints plugin
let g:pymode_breakpoint = 1

" Key for set/unset breakpoint
let g:pymode_breakpoint_key = '<leader>b'

" Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1

" Enable pymode indentation
let g:pymode_indent = 1

" Set default pymode python options
let g:pymode_options = 1

" Enable pymode's custom syntax highlighting
let g:pymode_syntax = 1

" Enable all python highlightings
let g:pymode_syntax_all = 1

" Highlight "print" as function
let g:pymode_syntax_print_as_function = 0

" Highlight indentation errors
let g:pymode_syntax_indent_errors = g:pymode_syntax_all

" Highlight trailing spaces
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Highlight string formatting
let g:pymode_syntax_string_formatting = g:pymode_syntax_all

" Highlight str.format syntax
let g:pymode_syntax_string_format = g:pymode_syntax_all

" Highlight string.Template syntax
let g:pymode_syntax_string_templates = g:pymode_syntax_all

" Highlight doc-tests
let g:pymode_syntax_doctests = g:pymode_syntax_all

" Highlight builtin objects (__doc__, self, etc)
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

" Highlight builtin functions
let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all

" Highlight exceptions
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all

" For fast machines
let g:pymode_syntax_slow_sync = 0

" rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Execute the tests
nmap <silent><Leader>Tf <Esc>:Pytest file<CR>
nmap <silent><Leader>Tc <Esc>:Pytest class<CR>
nmap <silent><Leader>Tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>Tn <Esc>:Pytest next<CR>
nmap <silent><Leader>Tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>Te <Esc>:Pytest error<CR>
"" }}} python-mode
" Bundle Rainbow parentheses {{{
Bundle 'vim-scripts/Rainbow-Parentheses-Improved-and2'
let g:rainbow_active = 1
let g:rainbow_operators = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick',]
" }}}
Bundle 'kingbin/vim-arduino'
" Bundle Eclim {{{
" Bundle '???'
" ,i imports whatever is needed for current line
"map ,i :JavaImport<cr>
" ,d opens javadoc for statement in browser
"ap ,d :JavaDocSearch -x declarations<cr>
" ,<enter> searches context for statement
"ap ,<cr> :JavaSearchContext<cr>
" ,jv validates current java file
"ap ,jv :Validate<cr>
" ,jc shows corrections for the current line of java
"ap ,jc :JavaCorrect<cr>
" 'open' on OSX will open the url in the default browser without issue
"et g:EclimBrowser='open'
" }}}

filetype plugin indent on     " required!
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

" color scheme
colorscheme murphy

" swap files
set directory=~/.vim/swapfiles

" undo file
set undofile
set undodir=~/.vim/undofiles
set undolevels=2000
set history=200

"":help quickfix
"set makeprg=jikes -nowarn -Xstdout +E % 
"set errorformat=%f:%l:%c:%*\d:%*\d:%*\s%m 

""" }}}
" X11 interaction {{{ 

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
  " python from powerline.ext.vim import source_plugin; source_plugin()
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
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
" Shortcuts {{{

" Tune the cmdline with emacs mode 
nmap \n :setlocal number!<CR>
nmap \p :set paste!<CR>
nmap \t2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap \t4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \t8 :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \T2 :set noexpandtab tabstop=2 softtabstop=2 shiftwidth=2<CR>
nmap \T4 :set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>
nmap \T8 :set noexpandtab tabstop=8 softtabstop=8 shiftwidth=8<CR>

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

map <Leader>, @:

nmap <Leader><SPACE> :bnext<CR>
nmap <Leader>n :bnext<CR>
nmap <Leader>p :bprev<CR>
nmap <Leader>l :ls<CR>

nmap <Leader>ba :badd 
nmap <Leader>bd :bdel<CR>
nmap <Leader>b1 :b1<CR>
nmap <Leader>b2 :b2<CR>
nmap <Leader>b3 :b3<CR>
nmap <Leader>b4 :b4<CR>
nmap <Leader>b5 :b5<CR>
nmap <Leader>b6 :b6<CR>
nmap <Leader>b7 :b7<CR>
nmap <Leader>b8 :b8<CR>
nmap <Leader>b9 :b9<CR>
nmap <Leader>b0 :b0<CR>

"map <Leader>y<SPACE> :tabnext<CR>
"map <Leader>yn :tabnext<CR>
"map <Leader>yy :tabnext<CR>
"map <Leader>y<BACKSPACE> :tabprev<CR>
"map <Leader>yp :tabprev<CR>
"map <Leader>yn :tabnew<CR>
"map <Leader>yc :tabclose<CR> 

"   Edit another file in the same directory as the current file 
"   uses expression to extract path from current file's path 
"  (thanks Douglas Potts) 
"map <Leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>

"map <Leader>ev :e ~/.vimrc <CR>
"map <Leader>em :e ~/.muttrc <CR>
"map <Leader>ep :e ~/.procmailrc <CR>
"map <Leader>ez :e ~/.zshrc<CR>

" split shortcuts
map <Leader>sh :hsplit<CR>
map <Leader>sv :vsplit<CR>

" quickly edit files often edited
iab YDATE <C-R>=strftime("%a %b %d %T %Z %Y")<CR>

"map <Leader>cc :!ctags -R -I --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <Leader>L  1G/Last update:\s*/e+1<CR>CYDATE<ESC>
map <Leader>,L 1G/Last change:\s*/e+1<CR>CYDATE<ESC>

" Compile the source
map <Leader>cp :w<CR>:makeprg=g++ % -O<CR>:make<CR>
map <Leader>cc :w<CR>:makeprg=gcc % -O<CR>:make<CR>
map <Leader>cl :w<CR>:makeprg=latex<CR>:make<CR>
map <Leader>cm :w<CR>:makeprg=make<CR>:make<CR>

" Reselect pasted text
nnoremap <leader>v V`]

au FileType python set omnifunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview

" add sudo command
command! WW w ! sudo tee % > /dev/null
command! W execute ':silent WW'

" }}}
" AutoCommands {{{
filetype plugin on
filetype plugin indent on

if has("autocmd")
    " Markdown
    augroup markdown
    au!
    " for markdown texts: adds a line of = under h1 titles
    au FileType markdown nnoremap <leader>h1 yypVr= 
    au FileType markdown nnoremap <leader>h2 yypVr- 
augroup END

    " Mail
    augroup mail
    au!
    "au BufRead /tmp/mutt* source /home/guyzmo/.vim/after/ftplugin/yaposting.vim
    augroup END

    " Shell files
    augroup shell
    au!
    au BufWritePost *.sh :!chmod u+x <afile>
    au BufWritePost * if getline(1) =~ "^#!/bin/[a-z]*sh" | silent !chmod u+x <afile> | endif
    au BufEnter *.sh if getline(1) == "" | :call setline(1, "#!/bin/sh") | endif
    au BufEnter *.sh let g:is_posix = 1
    augroup END

    " Python
    augroup python
    au!
    au FileType python nnoremap <leader>ft Vatzf
    au BufEnter *.py if getline(1) == "" | :call setline(1, "#!/usr/bin/env python") | endif
    augroup END

    " Javascript
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
    au FileType javascript runtime /usr/share/vim/vim72/ftplugin/javascript.vim
    au FileType javascript runtime /usr/share/vim/vim72/syntax/javascript.vim
    au FileType javascript runtime /usr/share/vim/vim72/indent/javascript.vim
    "au FileType javascript call JavaScriptFold()
    "au FileType javascript setl fen
    augroup END

    " for HTML texts
    augroup html
    au!
    au FileType html nnoremap <leader>ft Vatzf
    au FileType html let html_use_css = 1
    au FileType html let use_xhtml = 1
    au FileType html let html_ignore_folding = 1
    au FileType html let html_use_encoding = 1
    augroup END

    " for CSS texts, CSS sorting
    augroup css
    au!
    au FileType css nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR> 
    augroup END

    augroup changelog
    au!
    au FileType changelog runtime /usr/share/vim/vim72/ftplugin/changelog.vim
    au FileType let g:changelog_username = 'Guyzmo <guyzmo@m0g.net>'
    augroup END


    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" C Files options {{{
    augroup filetypedetect
            au BufNewFile,BufRead *.aadl    setf aadl
            au BufNewFile,BufRead *.pde     setf arduino
            au BufNewFile,BufRead *.ino     setf arduino
            au BufNewFile,BufRead *.C       setf cpp
    augroup END

        
    " Set some sensible defaults for editing C-files
    augroup cprog
    " Remove all cprog autocommands
    au!

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
    au BufReadPre * setlocal foldmethod=marker
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
    au BufWritePost .vimrc source $MYVIMRC
    augroup END
" }}}

endif " has ("autocmd")
" }}}
"Syntax highlighting {{{ 
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
		
call matchadd("NonText", "$")
call matchadd("NonText", "	")

"""}}}
