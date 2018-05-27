"/ File:        $HOME/.vim/vimrc
" Purpose:     Configuration file for VIM
" Author:      Leon Breedt <leon@obsidian.co.za> (Sat Jul 03 13:02:07 SAST 1999)
" Author:      G. Lejeune (Sat Jul 17 17:20:17 CET 2000)
" Author:      PRATZ Bernard <bernard@pratz.net>
" Last update: Sun Mar 20 19:23:02 CET 2016

" General behaviour config{{{1

let mapleader = ","
let maplocalleader = ","
set pastetoggle=<F3>

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

" {{{1 Locations

" for better synchronization, I have only:
"   ~/.config/vim/vimrc
" and all the files specific to a machines are within:
"   ~/.local/vim/bundle
"   ~/.local/vim/swapfiles
"   ~/.local/vim/undofiles

" check and build .local directories
if !!finddir(".local/share/vim/bundle", $HOME)
    call mkdir ($HOME . "/.local/share/vim/bundle", "p")
endif
if !!finddir(".local/share/vim/undofiles", $HOME)
    call mkdir ($HOME . "/.local/share/vim/undofiles", "p")
endif
if !!finddir(".local/share/vim/swapfiles", $HOME)
    call mkdir ($HOME . "/.local/share/vim/swapfiles", "p")
endif

" swap files
set directory=~/.local/share/vim/swapfiles

" undo file
set undofile
set undodir=~/.local/share/vim/undofiles
set undolevels=2000
set history=200

" Vim plugins {{{1
runtime macros/justify.vim
" runtime ftplugin/man.vim

" Plug setup
filetype off

" Plugs {{{2
call plug#begin('~/.local/share/vim/bundle')

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" General plugins {{{3
" Plug vim-etherpad {{{4

" Plug 'guyzmo/vim-etherpad', { 'on': 'Etherpad' }

" Plug Language Client Service {{{4

if has('nvim')
Plug 'autozimu/LanguageClient-neovim', Cond(has('nvim'), {
      \ 'do': ':UpdateRemotePlugins'
      \ })
endif



Plug 'junegunn/fzf.vim'

let g:fzf_layout = { 'window': 'enew' }

nnoremap <leader>bh :History<CR>
nnoremap <leader>bl :Buffers<CR>
nnoremap <leader>t :Files<CR>

" Plug GrepCommands {{{4

Plug 'vim-scripts/GrepCommands'

nnoremap <leader>bg<space> :BufGrep<CR>
nnoremap <leader>bg :BufGrep //<Left>

" Plug Airline {{{4

let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1 " I did compile the updated fonts!
let g:airline#extensions#tabline#enabled = 1

Plug 'vim-airline/vim-airline-themes' | Plug 'vim-airline/vim-airline'

" Plug bbye {{{4

Plug 'moll/vim-bbye'

" Plug easy-align {{{4

Plug 'junegunn/vim-easy-align'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Plug vim commentary {{{4
Plug 'tpope/vim-commentary'

" Plug vim git (syntax, indent, and filetype plugin files for git) {{{4
Plug 'tpope/vim-git'

" Plug vim sleuth (detect indent) {{{4

Plug 'tpope/vim-sleuth'

" Plug undotree ~GUndo~ {{{4
Plug 'mbbill/undotree'
nnoremap <Leader>u :UndotreeToggle<cr>
" Plug file:line {{{4

Plug 'bogado/file-line'

" Plug recover diff {{{4

Plug 'chrisbra/Recover.vim'

" Plug vim-exchange operator {{{4

Plug 'tommcdo/vim-exchange'

" Plug editing behaviour {{{4

"Plug 'vim-scripts/showmarks--Politz'

let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  guibg=#101010
hi IndentGuidesEven guibg=#202020

Plug 'nathanaelkane/vim-indent-guides'

Plug 'tomtom/quickfixsigns_vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'msanders/snipmate.vim'
Plug 'kana/vim-operator-user' | Plug 'kana/vim-operator-replace'
nmap - <Plug>(operator-replace)

" Plug EnhancedJumps {{{4
nmap <Leader>o  <Plug>EnhancedJumpsRemoteOlder
nmap <Leader>i  <Plug>EnhancedJumpsRemoteNewer
nmap <Plug>DisableEnhancedJumpsOlder <Plug>EnhancedJumpsOlder
nmap <Plug>DisableEnhancedJumpsNewer <Plug>EnhancedJumpsNewer
nmap <Plug>DisableEnhancedJumpsLocalOlder  <Plug>EnhancedJumpsLocalOlder
nmap <Plug>DisableEnhancedJumpsLocalNewer  <Plug>EnhancedJumpsLocalNewer
nmap <Plug>DisableEnhancedJumpsFarFallbackChangeNewer  <Plug>EnhancedJumpsFarFallbackChangeNewer
nmap <Plug>DisableEnhancedJumpsFarFallbackChangeOlder  <Plug>EnhancedJumpsFarFallbackChangeOlder

Plug 'guyzmo/ingo-library' | Plug 'guyzmo/EnhancedJumps'

" Plug CamelCaseMotion {{{4
"map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
omap <silent> i_ <Plug>CamelCaseMotion_iw
xmap <silent> i_ <Plug>CamelCaseMotion_iw
omap <silent> i- <Plug>CamelCaseMotion_iw
xmap <silent> i- <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

map <silent> <C-Right> <Plug>CamelCaseMotion_e
map <silent> <C-Left> <Plug>CamelCaseMotion_b

Plug 'bkad/CamelCaseMotion'

" Plug textobj for a column (-ic, -ac, -iC, -aC) {{{4

Plug 'coderifous/textobj-word-column.vim'

" Plug textobj for git merge conflicts {{{4

Plug 'rhysd/vim-textobj-conflict'

" ### Plug gf in python {{{5

if has('nvim')
Plug 'guyzmo/vim-gf-python'
endif

" Plug abolish {{{4

Plug 'tpope/vim-abolish'

" Plug Large File {{{4

let g:LargeFile = 512
Plug 'vim-scripts/LargeFile'

" Plug Editor Config {{{4

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exclude_patterns = ['scp://.*']
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

Plug 'editorconfig/editorconfig-vim'

" Plug Sunburst colorscheme {{{4

Plug 'zanloy/vim-colors-sunburst'

" Plug vim-test {{{4

if has('nvim')
let test#strategy = 'neovim'
Plug 'janko-m/vim-test', {'for': 'python'}
endif

" Plug filetype.vim {{{4

Plug 'vim-scripts/filetype.vim'
" Git plugs {{{3

" Plug vimagit {{{4

Plug 'jreybert/vimagit'
nnoremap <Leader>gg :MagitOnly<CR>


" Plug Fugitive {{{4
Plug 'tpope/vim-fugitive'
map <Leader>gw :Gwrite<CR>
map <Leader>gm :Grename<CR>
map <Leader>gb :Gblame<CR>

set diffopt=filler,vertical

if has('gui_running')
    if has('macunix')
        command! CI !PWD=%:p:h gitx &
    elseif has('unix')
        command! CI !gitg --activity commit %:p:h
    endif
    map <Leader>gc :CI<CR>
else
    map <Leader>gc :Gcommit<CR>
endif

" Plug TaskList {{{4
Plug 'vim-scripts/TaskList.vim'
map <leader>T <Plug>TaskList

" Development plugins {{{3

" ALE Linter {{{4

let g:ale_sign_error = '🖕'
let g:ale_sign_warning = '✋'
" let g:ale_statusline_format = ['🖕 %d', '✋ %d', '👌 ok']
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
"Plug 'w0rp/ale'

" Plug vim arguments swap {{{4
" Plug lldb {{{4

Plug 'vim-scripts/swap-parameters'
Plug 'critiqjo/lldb.nvim', Cond(has('nvim'), {
            \ 'for': ['c','cpp']
            \ })

let g:lldb#remote_server = 0

function! LLSpawn(target)
  if !system('pgrep "lldb-server"')
    if g:lldb#remote_server == 1
      echomsg 'Respawning the server'
      LL platform disconnect
    endif
    !lldb-server --listen localhost:42042&
    sleep 1
    LL platform select remote-linux
    LL platform connect connect://localhost:42042
    let g:lldb#remote_server = 1
  endif
  1wincmd w
  vsplit
  exe ":term ". a:target
  exe ":LL process attach -p " . b:terminal_job_pid
  2wincmd w
  1wincmd r
  2wincmd w
endfunction

nnoremap <space>N :LLsession new<CR>
nnoremap <space>C :LLmode code<CR><BS>n<CR>
nnoremap <space>D :LLmode debug<CR>
nnoremap <space>S :call LLSpawn(input('Target: ') . ' ' . input('Arguments: '))<CR>
nnoremap <space>i :LL process interrupt<CR>
nnoremap <space>k :LL process kill<CR>
nnoremap <space>c :LL continue<CR>
nnoremap <space>n :LL next<CR>
nnoremap <space>s :LL step<CR>
nnoremap <space>p :LL print <C-R>=expand('<cword>')<CR>
vnoremap <space>p :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
nnoremap <space>b <Plug>LLBreakSwitch :call lldb#remote#__notify("breakswitch", bufnr("%"), getcurpos()[1])<CR>

" Lang Server Protocol

Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
" (Optional) Multi-entry selection UI.
Plug 'Shougo/denite.nvim'

" (Optional) Completion integration with deoplete.
Plug 'Shougo/deoplete.nvim', Cond(has('nvim'), {
            \ 'do': ':UpdateRemotePlugins',
            \ 'for': ['c','cpp','javascript','python','ruby','java','zsh','bash','sh','vim']
            \ })

Plug 'kana/vim-textobj-user'
Plug 'vim-scripts/argtextobj.vim'
" (Optional) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['language-server-stdio'],
    \ 'python': ['pyls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <Leader>ll :call LanguageClient_workspace_symbol()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> gu :call LanguageClient_workspace_symbol()<CR>
set omnifunc=LanguageClient#complete

" Plug DeoPlete {{{4"

" let g:deoplete#enable_at_startup = 1
" Plug 'Shougo/deoplete.nvim', Cond(has('nvim'), {
"             \ 'for': ['c','cpp','javascript','python','ruby','java','zsh','bash','sh','vim']
"             \ })
" Plug 'Shougo/neco-vim', { 'for': 'vim' }
" Plug 'Shougo/neoinclude.vim', { 'for': ['c','cpp'] }
" Plug 'Rip-Rip/clang_complete', { 'for': ['c','cpp'] }
" Plug 'zchee/deoplete-jedi', Cond(has('nvim'), { 'for': 'python' })
" Plug 'carlitux/deoplete-ternjs', Cond(has('nvim'), { 'for': 'javascript' })
" Plug 'Shougo/context_filetype.vim'

"

" Plug 'neomake/neomake', {'for': ['python','javascript','cpp','c','ruby','java']}

" let g:neomake_warning_sign = { 'texthl': 'NeomakeWarning' }
" let g:neomake_error_sign = { 'texthl': 'NeomakeError' }
" let g:neomake_python_enabled_makers = ['pylint', 'pyflakes', 'pep8']
" let g:neomake_javascript_enabled_makers = ['jshint']

" Language specific plugins {{{3

" Natural Language {{{4

" ## vim Wordy plug {{{5

let g:wordy#ring = [
  \   'weak',
  \   ['being', 'passive-voice', ],
  \   'business-jargon',
  \   'weasel',
  \   'puffery',
  \   ['problematic', 'redundant', ],
  \   ['colloquial', 'idiomatic', 'similies', ],
  \   'art-jargon',
  \   ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
  \ ]
nnoremap <silent> <Leader>wn :NextWordy<cr>
if !&wildcharm | set wildcharm=<C-z> | endif
execute 'nnoremap <leader>wl :Wordy<space>'.nr2char(&wildcharm)
Plug 'reedes/vim-wordy'

" ## vim word lint plug

" Plug 'wordlint.vim'

" ## Markdown Language  {{{4

" Plug VIM Calendar  {{{5
let g:calendar_keys = {'close': 'q', 'do_action': '<CR>', 'goto_today': 't', 'show_help': '?', 'redisplay': 'r', 'goto_next_month': '<', 'goto_prev_month': '>', 'goto_next_year': '+', 'goto_prev_year': '-'}
let g:calendar_monday = 1
let g:calendar_weeknm = 5
Plug 'mattn/calendar-vim', {'for':['markdown']}

" Plug VIM Wiki  {{{5
augroup vimwiki
  au!
  "au FileType markdown nnoremap <leader>ww :VimwikiIndex<CR>
  au FileType markdown let wiki_notes = {}
  au FileType markdown let wiki_notes.path = '~/Documents/Perso/Notes/'
  au FileType markdown let wiki_notes.html_path = '~/Documents/Perso/Notes/html/'
  au FileType markdown let wiki_notes.syntax = 'markdown'
  au FileType markdown let wiki_notes.ext = '.md'
  au FileType markdown let wiki_notes.auto_export = 1
  au FileType markdown let wiki_notes.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'latex': 'latex'}
  au FileType markdown let g:vimwiki_list = [wiki_notes]
  au FileType markdown let g:vimwiki_folding = ''
  " let g:vimwiki_ext2syntax = {'.md': 'markdown',
  "             \ '.mkd': 'markdown',
  "             \ '.wiki': 'media'}

  Plug 'vimwiki/vimwiki', {
        \   'for': ['markdown', 'mkd', 'vimwiki', 'pandoc'],
        \   'on': 'VimwikiIndex'
        \ }

  " Plug Vim pandoc  {{{5

  " au FileType markdown let g:pandoc#folding#fold_yaml=1
  " au FileType markdown let g:pandoc#folding#level=4
  " au FileType markdown let g:pandoc#folding#level=4
  " au FileType markdown let g:pandoc#custom_open="/usr/bin/open"
  " au FileType markdown let g:pandoc#default_langs=["english", "french"]
  " au FileType markdown let g:pandoc#modules#disabled=["bibliographies"]
  " au FileType markdown let g:pandoc#command#custom_open = "XOpen"

augroup END

function! OSXOpen(file)
    return "open ". a:file
endfunction

function! XOpen(file)
    return "xdg-open ". a:file
endfunction

Plug 'vim-pandoc/vim-pandoc', {
            \ 'for': ['markdown', 'mkd', 'vimwiki', 'pandoc']
            \ }
Plug 'vim-pandoc/vim-pandoc-syntax', {
            \ 'for': ['markdown', 'mkd', 'vimwiki', 'pandoc']
            \ }

" ## Task Juggler Language {{{4

Plug 'guyzmo/vim-taskjuggler', {
            \  'do' : 'sh install.sh',
            \  'for': ['tji', 'tjp', 'taskjuggler', 'tj3']
            \ }


" ## Nix Language {{{4

Plug 'MarcWeber/vim-addon-nix', {'for': 'nix'}


" ## Applescript Language {{{4

Plug 'vim-scripts/applescript.vim', { 'for': 'applescript' }


" ## Coffee Script Language {{{4

Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}

" ## Java Language (Eclim support)  {{{4

Plug 'ervandew/eclim', {'for':['java']}
" 'open' on OSX will open the url in the default browser without issue
if has('macunix')
    let g:EclimBrowser='open'
else
    let g:EclimBrowser='xdg-open'
endif
let g:EclimCompletionMethod = 'omnifunc'

" Plug Prologue 
call plug#end()

filetype plugin on
filetype plugin indent on     " required!


" Editor's interface 

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

"":help quickfix
"set makeprg=jikes -nowarn -Xstdout +E %
"set errorformat=%f:%l:%c:%*\d:%*\d:%*\s%m

" X11 interaction 

"" all my old favorites ;-)
"set guifont=Monospace\ 8
"set guifont=Courier\ 10\ Pitch\ 8 " Really tiny font, need good eyes or good screen or both ;)
"set guifont=DejaVu\ Sans\ Mono:h9.00
"set guifont=Andale\ Mono:h9

if !has('nvim')
    set encoding=utf-8 " Necessary to show Unicode glyphs
endif

highlight Cursor guifg=black guibg=white
highlight iCursor guifg=white guibg=steelblue
set guicursor=i-n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

if !has('gui_running')
    " show which mode we're in
    set showmode
    set mouse=a
    if !has('nvim')
        set nocursorcolumn
        set ttymouse=xterm
        if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" || &term =~ "xterm"
            set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
            set t_Sf=^[[3%dm
            set t_Sb=^[[4%dm
        endif
        set t_Co=16
        set t_Sf=[3%dm
        set t_Sb=[4%dm
    else
        " neovim does not have gui_running yet
        set termguicolors
        " Neovim-qt Guifont command
        command! -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>") | let g:Guifont="<args>"
        " Set the font to DejaVu Sans Mono:h13
        Guifont Menlo for Powerline:h7
    endif
    set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P\ %{fugitive#statusline()}
else
    if has('macunix')
        set guifont=Menlo\ for\ Powerline:h7
        set transparency=10
    else
        set guifont=Menlo\ for\ Powerline\ 10
    endif

    " show which mode we're in
    set noshowmode
endif

" ## Scala Language {{{4

Plug 'derekwyatt/vim-scala', {'for': 'scala'}

" ## Elm Language {{{4

Plug 'lambdatoast/elm.vim', {'for': 'elm'}


" ## Javascript Lanuage {{{4

Plug 'jelera/vim-javascript-syntax', {'for':'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}

" ## HTML5 Syntax {{{4

Plug 'othree/html5.vim', {'for':['html']}

" ## Python Language {{{4

" ### Plug gf in python {{{5

let g:plug_url_format = 'git@github.com:%s.git'
Plug 'guyzmo/vim-gf-python', {'for':['python']}
unlet g:plug_url_format

" ### Plug Python textobjects

Plug 'bps/vim-textobj-python', {'for': 'python'}

" ### Plug Python mode [disabled] {{{5
" http://vimawesome.com/plugin/python-mode
" Plug 'klen/python-mode', {'for':['python']}
" :help ropevim.txt

" augroup pythonmode
"     au!
"     au FileType python let g:pymode = 1
"     au FileType python let g:pymode_warnings = 0
"     au FileType python let g:pymode_trim_whitespaces = 1
"     au FileType python let g:pymode_options = 1
"     au FileType python let g:pymode_options_max_line_length = 80
"     au FileType python let g:pymode_options_colorcolumn = 1
"     au FileType python let g:pymode_options_colorcolumn = 1
"     au FileType python let g:pymode_python = 'python3'
"     au FileType python let g:pymode_indent = 1
"     au FileType python let g:pymode_folding = 1
"     au FileType python let g:pymode_motion = 1
"     au FileType python let g:pymode_virtualenv = 0 " XXX virtualenv is disabled!
"     " run and debug
"     au FileType python let g:pymode_run = 1
"     au FileType python let g:pymode_run_bind = '<leader>r'
"     au FileType python let g:pymode_breakpoint = 1
"     au FileType python let g:pymode_breakpoint_bind = '<leader>b'
"     " linting
"     au FileType python let g:pymode_lint = 1
"     au FileType python let g:pymode_lint_on_write = 1
"     au FileType python let g:pymode_lint_unmodified = 0
"     au FileType python let g:pymode_lint_on_fly = 0
"     au FileType python let g:pymode_lint_message = 1
"     au FileType python let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
"     au FileType python let g:pymode_lint_ignore = 'E501,E121,E126,E127,E128' "  Skip errors and warnings (E.g. 'E501,W002', 'E2,W' (Skip all Warnings and Errors startswith E2) and etc..)
"     " au FileType python let g:pymode_lint_select = "E501,W0011,W430"
"     au FileType python let g:pymode_lint_cwindow = 1
"     au FileType python let g:pymode_lint_signs = 1
"     " use symbols here XXX
"     au FileType python let g:pymode_lint_todo_symbol = 'WW'
"     au FileType python let g:pymode_lint_comment_symbol = 'CC'
"     au FileType python let g:pymode_lint_visual_symbol = 'RR'
"     au FileType python let g:pymode_lint_error_symbol = 'EE'
"     au FileType python let g:pymode_lint_info_symbol = 'II'
"     au FileType python let g:pymode_lint_pyflakes_symbol = 'FF'
"     " ROPE stuff
"     au FileType python let g:pymode_rope = 1
"     au FileType python let g:pymode_rope_lookup_project = 0
"     au FileType python let g:pymode_rope_show_doc_bind = ',K'
"     au FileType python let g:pymode_rope_regenerate_on_write = 1 " XXX save action!
"     " completion
"     au FileType python let g:pymode_rope_completion = 1
"     au FileType python let g:pymode_rope_complete_on_dot = 1
"     au FileType python let g:pymode_rope_completion_bind = '<C-Space>'
"     " autoimport
"     au FileType python let g:pymode_rope_autoimport = 1
"     au FileType python let g:pymode_rope_autoimport_modules = ['os', 'sys', 'shutil', 'datetime', 'time', 'subprocess']
"     au FileType python let g:pymode_rope_autoimport_import_after_complete = 1
"     " go to definition
"     au FileType python let g:pymode_rope_goto_definition_bind = 'gd'
"     au FileType python let g:pymode_rope_goto_definition_cmd = '' " could be new or vnew, but replacing buffer is as good!
"     " refactoring
"     au FileType python let g:pymode_rope_rename_module_bind = ',rm'
"     au FileType python let g:pymode_rope_organize_imports_bind = ',rio'
"     au FileType python let g:pymode_rope_autoimport_bind = ',ria'
"     au FileType python let g:pymode_rope_module_to_package_bind = ',rmp'
"     au FileType python let g:pymode_rope_extract_method_bind = ',rem'
"     au FileType python let g:pymode_rope_extract_variable_bind = ',rev'
"     au FileType python let g:pymode_rope_use_function_bind = ',ruf'
"     au FileType python let g:pymode_rope_move_bind = ',rmm'
"     au FileType python let g:pymode_rope_change_signature_bind = ',rcs'
"     au FileType python map <Leader>ru :PymodeRopeUndo
"     au FileType python map <Leader>r<C-r> :PymodeRopeRedo
"     " syntax
"     au FileType python let g:pymode_syntax = 1
"     au FileType python let g:pymode_syntax_slow_sync = 1
"     au FileType python let g:pymode_syntax_all = 1
"     au FileType python let g:pymode_syntax_print_as_function = 1

"     " au FileType python " Execute the tests
"     " au FileType python map <Leader>RTf <Esc>:Pytest file<CR>
"     " au FileType python map <Leader>RTc <Esc>:Pytest class<CR>
"     " au FileType python map <Leader>RTm <Esc>:Pytest method<CR>
"     " au FileType python " cycle through test errors
"     " au FileType python map <Leader>RTn <Esc>:Pytest next<CR>
"     " au FileType python map <Leader>RTp <Esc>:Pytest previous<CR>
"     " au FileType python map <Leader>RTe <Esc>:Pytest error<CR>
" augroup END

" ## Ruby Language {{{4
Plug 'vim-ruby/vim-ruby', {'for':['ruby','eruby']}
Plug 'tpope/vim-rails', {'for':['ruby','eruby']}
Plug 'tpope/vim-bundler', {'for':['ruby','eruby']}

" ## Arduino Syntax {{{4

Plug 'kingbin/vim-arduino', {'for':['arduino']}

" Mappings {{{1

" custom text-objects that can be used as classic t-o (courtesy of @romainl) : ci\, vi+, da;, ya*

for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '`', '"""', "'''" ]
    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

" Map :wv to :w for when I mistype
cnoreabbrev <expr> wv ((getcmdtype() is# ':' && getcmdline() is# 'wv')?('w'):('wv'))

nmap Q @@
nmap ,/ :noh<CR>

if has('nvim')
    tnoremap <ESC><C-g> <C-\><C-n>
    tnoremap <ESC><ESC> <C-\><C-n>
    tnoremap <C-g><C-g> <C-\><C-n><C-w><C-p>
endif

" Windows
nnoremap <C-w><C-w> <C-w><C-p>
nnoremap gw <C-w>w

" Yank current line in register y and run it as an ex command
nnoremap <Leader>!e "yyy@y
" Yank current line in register y and run it as a python command
nnoremap <Leader>!p "yyy:let @y=":py3 ".@y<CR>@y<CR>
" Yank current line in register y and run it as a ruby command
nnoremap <Leader>!r "yyy:let @y=":ru ".@y<CR>@y<CR>
" Yank current line in register y and run it as a shell command
nnoremap <Leader>!s "yyy:let @y=":!".@y<CR>@y<CR>

nmap \n :setlocal number!<CR>
nmap \p :set paste!<CR>
nmap \t2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap \t4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \t8 :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \T2 :set noexpandtab tabstop=2 softtabstop=2 shiftwidth=2<CR>
nmap \T4 :set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>
nmap \T8 :set noexpandtab tabstop=8 softtabstop=8 shiftwidth=8<CR>

nmap <Leader>gr :grep -r  .<left><left>

" Tune the cmdline with emacs mode
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <Leader>, @:

nnoremap <Leader><SPACE> :bnext<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprev<CR>
"nmap <Leader>l :ls<CR>

nnoremap <Leader>ba :badd
nnoremap <Leader>bc :Bdelete<CR> " do not close window
nnoremap <Leader>bd :bdelete<CR> " close window
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

" fold mappings
nnoremap <Leader>fmm :set foldmethod=marker<CR>
nnoremap <Leader>fms :set foldmethod=syntax<CR>
nnoremap <Leader>fmi :set foldmethod=indent<CR>

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

map <leader>?h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

au FileType python set omnifunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview

" add sudo command
command! W w ! sudo tee % 2>&1 > /dev/null

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

" AutoCommands  {{{2

if has("autocmd")
    " restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf
    au BufWinLeave * call clearmatches()

    " nix {{{2
    augroup nix
      autocmd BufRead,BufNewFile *.nix setlocal ft=nix
    augroup END

    " Markdown  {{{2
    " http://code.google.com/p/vimwiki/issues/detail?id=384
    au BufNewFile,BufRead *.md set filetype=markdown
    function! s:MDSettings()
        "inoremap <buffer> <Leader>n \note[item]{}<Esc>i

        PandocTemplate save specs pdf --atx-headers --chapters --template ~/Documents/Templates/document.tpl.latex
        PandocTemplate save letter pdf --atx-headers --chapters --template ~/Documents/Templates/letter.tpl.latex

        " nnoremap <buffer> <Leader>cs :Pandoc! #specs
        " nnoremap <buffer> <Leader>cl :Pandoc! #letter

        " noremap <buffer> <Leader>cp :!pandoc
        "             \ --template ~/Documents/Templates/beamer.tpl.latex
        "             \ --from markdown "%" -t beamer -o "%<.pdf"<CR>
        noremap <buffer> <Leader>cd :!pandoc --atx-headers --chapters
                    \ --template ~/Documents/Templates/document.tpl.latex
                    \ --from markdown "%" -t latex -o "%<.pdf"<CR>

        noremap <buffer> <Leader>cl :!pandoc --atx-headers
                     \ --template ~/Documents/Templates/lettre.tpl.latex
                     \ --from markdown "%" -t latex -o "%<.pdf"<CR>
        " noremap <buffer> <Leader>ch :!pandoc --atx-headers
        "             \ --template ~/Documents/Templates/html.tpl.html
        "             \ --from markdown "%" -t html -o "%<.html"<CR>
        noremap <buffer> <Leader>cv :!qlmanage -p "%<.pdf" 2>&1 >/dev/null &<CR>
        noremap <buffer> <Leader>co :!open -a Preview "%<.pdf" 2>&1 >/dev/null &<CR>
    endfunction

    augroup markdown 
      au!
      au CursorHold *.md update
      " for markdown texts: adds a line of = under h1 titles
      au FileType markdown set noswapfile
      au FileType markdown nmap <leader>st :TOC<CR>
      au FileType markdown nmap ,] <Plug>VimwikiFollowLink
      au FileType markdown vmap ,] <Plug>VimwikiNormalizeLinkVisualCR
      au FileType markdown nmap ,[ <Plug>VimwikiGoBackLink
      au FileType markdown nmap g] <Plug>VimwikiFollowLink
      au FileType markdown vmap g] <Plug>VimwikiNormalizeLinkVisualCR
      au FileType markdown nmap g[ <Plug>VimwikiGoBackLink
      au FileType markdown nmap g[ <Plug>VimwikiGoBackLink
      au FileType markdown nmap <Leader>wn <Plug>VimwikiNextLink
      au FileType markdown nmap <Leader>wp <Plug>VimwikiPrevLink

      "au BufRead,BufNewFile *.md setfiletype markdown
      au FileType markdown :call <SID>MDSettings()
    augroup END
    " Mail {{{2
    augroup mail
      au!
      "au BufRead /tmp/mutt* source /home/guyzmo/.vim/after/ftplugin/yaposting.vim
    augroup END
    " Shell files{{{2 
    augroup shell
      au!
      au BufWritePost *.sh :!chmod u+x <afile>
      au BufWritePost * if getline(1) =~ "^#!/bin/[a-z]*sh" | silent !chmod u+x <afile> | endif
      au BufEnter *.sh if getline(1) == "" | :call setline(1, "#!/bin/sh") | endif
      au BufEnter *.sh let g:is_posix = 1
    augroup END
    " Python {{{2
    augroup python
    au!
    au FileType python nnoremap <leader>ft Vatzf
    au BufEnter *.py if getline(1) == "" | :call setline(1, "#!/usr/bin/env python") | endif
    au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
    augroup END
    " Ruby {{{2
    "autocmd FileType ruby,eruby setl omnifunc=syntaxcompelete#Complete
    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
    autocmd FileType ruby,eruby set expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType ruby,eruby set foldmethod=syntax
    " TaskJuggler {{{2
    autocmd FileType tji,tjp,taskjuggler,tj3 let g:ycm_collect_identifiers_from_tags_files = 1
    " Javascript {{{2
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
    " for HTML texts {{{2
    augroup html
        au!
        au FileType html nnoremap <leader>ft Vatzf
        au FileType html let html_use_css = 1
        au FileType html let use_xhtml = 1
        au FileType html let html_ignore_folding = 1
        au FileType html let html_use_encoding = 1
    augroup END
    " for CSS texts, CSS sorting {{{2
    augroup css
        au!
        au FileType css nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
    augroup END
    " Scala {{{2
    augroup scala
      au!
      au FileType scala set smartindent
      au FileType scala set expandtab tabstop=2 shiftwidth=2 softtabstop=2
    augroup END
    " Java {{{2
    augroup java
        au!
        au FileType java set smartindent
    augroup END
    " Coffee script {{{2
    augroup coffee
        au!
        au FileType coffee 'vim-coffee-script'
        au FileType coffee set smartindent
    augroup END
    " ChangeLog {{{2
    augroup changelog
    au!
    au FileType changelog runtime ftplugin/changelog.vim
    au FileType let g:changelog_username = 'Guyzmo <guyzmo@m0g.net>'
    augroup END


" C files {{{2

" C Files options {{{3
    augroup cfiletypedetect
        au!
        au BufNewFile,BufRead *.aadl    setf aadl
        au BufNewFile,BufRead *.pde     setf arduino
        au BufNewFile,BufRead *.ino     setf arduino
        au BufNewFile,BufRead *.C       setf cpp
        au BufNewFile,BufRead *.h       setf cpp
    augroup END

    " Set some sensible defaults for editing C-files {{{3
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

" bzip2 options {{{2
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
" vimrc 
    augroup vimrc
    au BufReadPre   vimrc,init.vim,.vimrc setlocal foldmethod=marker
    au BufReadPre   vimrc,init.vim,.vimrc setlocal ft=vim
    au BufWritePost vimrc,init.vim,.vimrc source %
    augroup END

endif " has ("autocmd")

" color scheme {{{1

" colorscheme murphy
colorscheme sunburst

" i hate cyan comments :)
hi Comment                        ctermfg=244   ctermbg=233  guifg=Grey80  guibg=grey12
"hi Normal                                                    guifg=white
"hi Constant                                                  guifg=lightgreen
hi Folded                         ctermfg=Cyan  ctermbg=0    guifg=Cyan    guibg=grey12
hi FoldColumn                     ctermfg=Cyan  ctermbg=0    guifg=Cyan    guibg=grey12
hi SignColumn      term=standout  ctermfg=11    ctermbg=8    guifg=Cyan    guibg=#222222
hi Pmenu                                        ctermbg=Grey               guibg=DarkSlateGrey
hi SpecialKey                     ctermfg=8                  guifg=#111155
hi CursorLine      term=none      cterm=none    ctermbg=234                guibg=Grey5
hi CursorColumn    term=none      cterm=none    ctermbg=234                guibg=Grey5
hi ColorColumn                                  ctermbg=52                 guibg=#250000
hi RedundantSpaces term=standout                ctermbg=red                guibg=red
hi NonText                        ctermfg=8                  guifg=#111155
hi TrailingSpaces  term=standout                ctermfg=red  guifg=red
hi Search          term=none      cterm=none    ctermbg=94                 guibg=#666600

call matchadd('TrailingSpaces', '\s\s*$')
call matchadd('NonText', '$')
call matchadd('NonText', '	')

